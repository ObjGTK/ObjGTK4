/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkPixbufSimpleAnim.h"

#import "OGGdkPixbuf.h"

@implementation OGGdkPixbufSimpleAnim

- (instancetype)initWithWidth:(gint)width height:(gint)height rate:(gfloat)rate
{
	GdkPixbufSimpleAnim* gobjectValue = GDK_PIXBUF_SIMPLE_ANIM(gdk_pixbuf_simple_anim_new(width, height, rate));

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

- (GdkPixbufSimpleAnim*)castedGObject
{
	return GDK_PIXBUF_SIMPLE_ANIM([self gObject]);
}

- (void)addFrame:(OGGdkPixbuf*)pixbuf
{
	gdk_pixbuf_simple_anim_add_frame([self castedGObject], [pixbuf castedGObject]);
}

- (bool)loop
{
	bool returnValue = gdk_pixbuf_simple_anim_get_loop([self castedGObject]);

	return returnValue;
}

- (void)setLoop:(bool)loop
{
	gdk_pixbuf_simple_anim_set_loop([self castedGObject], loop);
}


@end