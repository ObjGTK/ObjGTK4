/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkMemoryTexture.h"

@implementation OGGdkMemoryTexture

- (instancetype)initWithWidth:(int)width height:(int)height format:(GdkMemoryFormat)format bytes:(GBytes*)bytes stride:(gsize)stride
{
	GdkMemoryTexture* gobjectValue = GDK_MEMORY_TEXTURE(gdk_memory_texture_new(width, height, format, bytes, stride));

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

- (GdkMemoryTexture*)castedGObject
{
	return GDK_MEMORY_TEXTURE([self gObject]);
}


@end