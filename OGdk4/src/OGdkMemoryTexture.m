/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkMemoryTexture.h"

@implementation OGdkMemoryTexture

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_MEMORY_TEXTURE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_MEMORY_TEXTURE);
	return gObjectClass;
}

+ (instancetype)memoryTextureWithWidth:(int)width height:(int)height format:(GdkMemoryFormat)format bytes:(GBytes*)bytes stride:(gsize)stride
{
	GdkMemoryTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_memory_texture_new(width, height, format, bytes, stride), GDK_TYPE_MEMORY_TEXTURE, GdkMemoryTexture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkMemoryTexture* wrapperObject;
	@try {
		wrapperObject = [[OGdkMemoryTexture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkMemoryTexture*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_MEMORY_TEXTURE, GdkMemoryTexture);
}


@end