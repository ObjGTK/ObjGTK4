/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGskRenderer.h"

/**
 * A GSK renderer that is using Vulkan.
 * 
 * This renderer will fail to realize if Vulkan is not supported.
 *
 */
@interface OGGskVulkanRenderer : OGGskRenderer
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GskVulkanRenderer*)castedGObject;

@end