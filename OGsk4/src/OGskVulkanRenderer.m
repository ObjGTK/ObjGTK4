/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGskVulkanRenderer.h"

#import "OGskRenderer.h"

@implementation OGskVulkanRenderer

+ (void)load
{
	GType gtypeToAssociate = GSK_TYPE_VULKAN_RENDERER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GskVulkanRenderer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gsk_vulkan_renderer_new(), GskVulkanRenderer, GskVulkanRenderer);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GskVulkanRenderer, GskVulkanRenderer);
}


@end