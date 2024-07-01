/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkVulkanContext.h"

@implementation OGGdkVulkanContext

- (GdkVulkanContext*)castedGObject
{
	return GDK_VULKAN_CONTEXT([self gObject]);
}


@end