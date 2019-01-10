/* linux/drivers/video/sunxi/disp2/disp/dev_fb.c
 *
 * Copyright (c) 2013 Allwinnertech Co., Ltd.
 * Author: Tyle <tyle@allwinnertech.com>
 *
 * Framebuffer driver for sunxi platform
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fb.h>
#include <linux/memblock.h>

struct __fb_addr_para
{
	uintptr_t fb_paddr;
	int fb_size;
};

struct __fb_addr_para g_fb_addr;

s32 sunxi_get_fb_addr_para(struct __fb_addr_para *fb_addr_para)
{
	if (fb_addr_para){
		fb_addr_para->fb_paddr = g_fb_addr.fb_paddr;
		fb_addr_para->fb_size  = g_fb_addr.fb_size;
		return 0;
	}

	return -1;
}

EXPORT_SYMBOL(g_fb_addr);
EXPORT_SYMBOL(sunxi_get_fb_addr_para);
