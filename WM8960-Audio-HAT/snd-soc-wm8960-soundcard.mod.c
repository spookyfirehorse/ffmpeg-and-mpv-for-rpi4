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
	{ 0x03f60f37, "simple_util_startup" },
	{ 0x7ff77fca, "devm_kmalloc" },
	{ 0x272db143, "platform_driver_unregister" },
	{ 0x34dffbbc, "simple_util_hw_params" },
	{ 0x92997ed8, "_printk" },
	{ 0x5e1366bc, "simple_util_shutdown" },
	{ 0x26acbc6e, "__platform_driver_register" },
	{ 0xd891f4c3, "devm_snd_soc_register_card" },
	{ 0x03cf58e7, "simple_util_dai_init" },
	{ 0x651985ac, "module_layout" },
};

MODULE_INFO(depends, "snd-soc-simple-card-utils,snd-soc-core");

MODULE_ALIAS("of:N*T*Cwaveshare,wm8960-soundcard");
MODULE_ALIAS("of:N*T*Cwaveshare,wm8960-soundcardC*");
MODULE_ALIAS("of:N*T*Cseeed,seeed-2mic-voicecard");
MODULE_ALIAS("of:N*T*Cseeed,seeed-2mic-voicecardC*");

MODULE_INFO(srcversion, "7DED9F57E3A2AA9BFE64964");
