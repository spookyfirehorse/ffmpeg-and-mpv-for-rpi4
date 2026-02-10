// SPDX-License-Identifier: GPL-2.0
#include <linux/module.h>
#include <linux/platform_device.h>
#include <sound/soc.h>
#include <sound/simple_card_utils.h>

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

static int wm8960_probe(struct platform_device *pdev) {
    struct simple_util_priv *priv;
    struct device *dev = &pdev->dev;
    struct snd_soc_dai_link *link;
    int ret;

    pr_info("WM8960-Debug: FORCE PROBE START\n");

    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    link = devm_kzalloc(dev, sizeof(*link), GFP_KERNEL);
    link->cpus = devm_kzalloc(dev, sizeof(*link->cpus), GFP_KERNEL);
    link->codecs = devm_kzalloc(dev, sizeof(*link->codecs), GFP_KERNEL);
    link->platforms = devm_kzalloc(dev, sizeof(*link->platforms), GFP_KERNEL);
    
    if (!priv || !link || !link->cpus || !link->codecs || !link->platforms) return -ENOMEM;

    link->num_cpus = 1; link->num_codecs = 1; link->num_platforms = 1;
    link->cpus->dai_name = "bcm2835-i2s";
    link->codecs->dai_name = "wm8960-hifi";
    link->platforms->name = "fe203000.i2s";
    link->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
    link->ops = &wm8960_ops;
    link->init = simple_util_dai_init;

    priv->snd_card.dev = dev;
    priv->snd_card.dai_link = link;
    priv->snd_card.num_links = 1;
    priv->snd_card.name = "wm8960-soundcard";

    platform_set_drvdata(pdev, priv);
    ret = devm_snd_soc_register_card(dev, &priv->snd_card);
    if (ret < 0) pr_err("WM8960-Debug: ERROR %d\n", ret);
    else pr_info("WM8960-Debug: !!! SUCCESS !!!\n");
    return ret;
}

static const struct of_device_id wm8960_match[] = {
    { .compatible = "waveshare,wm8960-soundcard" },
    { .compatible = "seeed,seeed-2mic-voicecard" },
    { }
};
MODULE_DEVICE_TABLE(of, wm8960_match);

static struct platform_driver wm8960_driver = {
    .driver = { .name = "wm8960-audio", .of_match_table = wm8960_match },
    .probe = wm8960_probe,
};
module_platform_driver(wm8960_driver);
MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("WM8960 Force Fix 6.18");
