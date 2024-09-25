/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGskVulkanRenderer.h"

@implementation OGGskVulkanRenderer

- (instancetype)init
{
	GskVulkanRenderer* gobjectValue = GSK_VULKAN_RENDERER(gsk_vulkan_renderer_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GskVulkanRenderer*)castedGObject
{
	return GSK_VULKAN_RENDERER([self gObject]);
}


@end