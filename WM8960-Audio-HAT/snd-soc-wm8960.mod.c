#include <linux/module.h>
#include <linux/export-internal.h>
#include <linux/compiler.h>

MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};



static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0xed8d2417, "regcache_sync" },
	{ 0x4cde676c, "regmap_write" },
	{ 0x7ff77fca, "devm_kmalloc" },
	{ 0xa18690c4, "snd_soc_component_read" },
	{ 0x30419d7c, "snd_soc_put_enum_double" },
	{ 0x20f09678, "devm_clk_get" },
	{ 0xcf466dce, "snd_soc_component_write" },
	{ 0x671ad169, "devm_snd_soc_register_component" },
	{ 0x7c9a7371, "clk_prepare" },
	{ 0x92997ed8, "_printk" },
	{ 0x9ca150bb, "__devm_regmap_init_i2c" },
	{ 0x6cb13deb, "snd_soc_get_enum_double" },
	{ 0x124d06bb, "i2c_register_driver" },
	{ 0x2c351d88, "snd_soc_info_volsw" },
	{ 0x409815be, "snd_ctl_boolean_mono_info" },
	{ 0x1eaee65d, "_dev_err" },
	{ 0xb4cef456, "of_property_read_bool" },
	{ 0xe8ee8ae2, "snd_soc_dapm_put_volsw" },
	{ 0x43c35ff7, "snd_soc_dapm_get_bias_level" },
	{ 0x29e67dab, "snd_soc_add_component_controls" },
	{ 0x03d0e320, "snd_soc_dapm_add_routes" },
	{ 0x8a6b44f7, "snd_soc_info_enum_double" },
	{ 0xe2d5255a, "strcmp" },
	{ 0x396bebce, "snd_soc_get_volsw" },
	{ 0x42c904fc, "snd_soc_put_volsw" },
	{ 0x3ab07969, "snd_soc_component_update_bits" },
	{ 0x01ebe331, "snd_soc_dapm_new_controls" },
	{ 0xb6e6d99d, "clk_disable" },
	{ 0xe4eea543, "regmap_update_bits_base" },
	{ 0x182d9a11, "snd_soc_dapm_get_volsw" },
	{ 0xf9ad9539, "i2c_del_driver" },
	{ 0x815588a6, "clk_enable" },
	{ 0x2acda8a0, "snd_soc_params_to_bclk" },
	{ 0xf9a482f9, "msleep" },
	{ 0xe56a9336, "snd_pcm_format_width" },
	{ 0xb077e70a, "clk_unprepare" },
	{ 0x651985ac, "module_layout" },
};

MODULE_INFO(depends, "snd-soc-core,regmap-i2c,snd,snd-pcm");

MODULE_ALIAS("of:N*T*Cwlf,wm8960");
MODULE_ALIAS("of:N*T*Cwlf,wm8960C*");
MODULE_ALIAS("i2c:wm8960");

MODULE_INFO(srcversion, "D95DC324B7436AD157CD644");
