// SPDX-License-Identifier: GPL-2.0
// WM8960 Audio HAT Driver - Optimized for Kernel 6.18+
// Supports Raspberry Pi 4 with Master-Clock Fix

#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/of.h>
#include <sound/soc.h>
#include <sound/simple_card_utils.h>

#define PREFIX "simple-audio-card,"

/* Makros zur Pfad-Auflösung in Kernel 6.18 (simple-util Framework) */
#ifndef simple_priv_to_card
#define simple_priv_to_card(priv) (&(priv)->snd_card)
#endif
#ifndef simple_priv_to_link
#define simple_priv_to_link(priv, i) ((priv)->snd_card.dai_link + (i))
#endif

static const struct snd_soc_ops wm8960_ops = {
    .startup    = simple_util_startup,
    .shutdown   = simple_util_shutdown,
    .hw_params  = simple_util_hw_params,
};

static int wm8960_dai_link_of(struct simple_util_priv *priv, struct device_node *node, struct device_node *codec_node)
{
    struct snd_soc_card *card = simple_priv_to_card(priv);
    struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, 0);
    int ret;

    /* 1. Format & Clock-Verhältnisse parsen */
    ret = simple_util_parse_daifmt(card->dev, node, codec_node, PREFIX, &dai_link->dai_fmt);
    if (ret < 0) {
        // Standard-Fallback für I2S Master Mode
        dai_link->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
    }

    /* 2. CPU (I2S Controller) Zuweisung */
    ret = snd_soc_of_get_dai_name(node, &dai_link->cpus->dai_name, 0);
    if (ret < 0) {
        dai_link->cpus->dai_name = "bcm2835-i2s"; // Manueller Fix für RPi 4
    } else {
        dai_link->cpus->of_node = node;
    }

    /* 3. CODEC (WM8960) Zuweisung */
    ret = snd_soc_of_get_dai_name(codec_node, &dai_link->codecs->dai_name, 0);
    if (ret < 0) {
        dai_link->codecs->dai_name = "wm8960-hifi";
    } else {
        dai_link->codecs->of_node = codec_node;
    }

    /* 4. Platform (DMA) Zuweisung */
    dai_link->platforms->name = "fe203000.i2s"; // Absoluter Pfad auf Pi 4

    dai_link->ops = &wm8960_ops;
    dai_link->init = simple_util_dai_init;

    return simple_util_set_dailink_name(priv, dai_link, "wm8960-hifi");
}

static int wm8960_probe(struct platform_device *pdev)
{
    struct simple_util_priv *priv;
    struct device *dev = &pdev->dev;
    struct device_node *np = dev->of_node;
    struct device_node *codec_node;
    struct snd_soc_dai_link *link;
    int ret;

    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    if (!priv) return -ENOMEM;

    link = devm_kzalloc(dev, sizeof(*link), GFP_KERNEL);
    if (!link) return -ENOMEM;

    /* Speicher für Link-Komponenten reservieren (Fix für Kernel 6.18) */
    link->cpus = devm_kzalloc(dev, sizeof(*link->cpus), GFP_KERNEL);
    link->codecs = devm_kzalloc(dev, sizeof(*link->codecs), GFP_KERNEL);
    link->platforms = devm_kzalloc(dev, sizeof(*link->platforms), GFP_KERNEL);
    if (!link->cpus || !link->codecs || !link->platforms) return -ENOMEM;

    link->num_cpus = 1;
    link->num_codecs = 1;
    link->num_platforms = 1;

    priv->snd_card.dev = dev;
    priv->snd_card.dai_link = link;
    priv->snd_card.num_links = 1;
    priv->snd_card.name = "wm8960-soundcard";

    codec_node = of_parse_phandle(np, "simple-audio-card,codec", 0);
    wm8960_dai_link_of(priv, np, codec_node);
    if (codec_node) of_node_put(codec_node);

    platform_set_drvdata(pdev, priv);
    
    ret = devm_snd_soc_register_card(dev, &priv->snd_card);
    if (ret < 0)
        pr_err("wm8960-soundcard: Card registration failed: %d\n", ret);

    return ret;
}

static const struct of_device_id wm8960_of_match[] = {
    { .compatible = "waveshare,wm8960-soundcard" },
    { .compatible = "seeed,seeed-voicecard" },
    { }
};
MODULE_DEVICE_TABLE(of, wm8960_of_match);

static struct platform_driver wm8960_driver = {
    .driver = { 
        .name = "wm8960-audio", 
        .of_match_table = wm8960_of_match 
    },
    .probe = wm8960_probe,
};

module_platform_driver(wm8960_driver);

MODULE_AUTHOR("Custom Fix");
MODULE_DESCRIPTION("WM8960 Audio HAT Driver for RPi 4 - Kernel 6.18+");
MODULE_LICENSE("GPL v2");
