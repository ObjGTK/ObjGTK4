/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGskVulkanRenderer.h"

#import "OGskRenderer.h"

@implementation OGskVulkanRenderer

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GSK_TYPE_VULKAN_RENDERER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GSK_TYPE_VULKAN_RENDERER);
	return gObjectClass;
}

+ (instancetype)vulkanRenderer
{
	GskVulkanRenderer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gsk_vulkan_renderer_new(), GSK_TYPE_VULKAN_RENDERER, GskVulkanRenderer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGskVulkanRenderer* wrapperObject;
	@try {
		wrapperObject = [[OGskVulkanRenderer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GskVulkanRenderer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GSK_TYPE_VULKAN_RENDERER, GskVulkanRenderer);
}


@end