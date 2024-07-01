/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDrawContext.h"

/**
 * `GdkVulkanContext` is an object representing the platform-specific
 * Vulkan draw context.
 * 
 * `GdkVulkanContext`s are created for a surface using
 * [method@Gdk.Surface.create_vulkan_context], and the context will match
 * the characteristics of the surface.
 * 
 * Support for `GdkVulkanContext` is platform-specific and context creation
 * can fail, returning %NULL context.
 *
 */
@interface OGGdkVulkanContext : OGGdkDrawContext
{

}


/**
 * Methods
 */

- (GdkVulkanContext*)castedGObject;

@end