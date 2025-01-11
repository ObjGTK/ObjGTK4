/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGskRenderer.h"

/**
 * A GSK renderer that is using Vulkan.
 * 
 * This renderer will fail to realize if Vulkan is not supported.
 *
 */
@interface OGskVulkanRenderer : OGskRenderer
{

}


/**
 * Constructors
 */
+ (instancetype)vulkanRenderer;

/**
 * Methods
 */

- (GskVulkanRenderer*)castedGObject;

@end