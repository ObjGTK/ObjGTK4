/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbufSimpleAnim.h"

#import "OGdkPixbuf.h"

@implementation OGdkPixbufSimpleAnim

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_PIXBUF_SIMPLE_ANIM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithWidth:(gint)width height:(gint)height rate:(gfloat)rate
{
	GdkPixbufSimpleAnim* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_simple_anim_new(width, height, rate), GdkPixbufSimpleAnim, GdkPixbufSimpleAnim);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkPixbufSimpleAnim, GdkPixbufSimpleAnim);
}

- (void)addFrame:(OGdkPixbuf*)pixbuf
{
	gdk_pixbuf_simple_anim_add_frame([self castedGObject], [pixbuf castedGObject]);
}

- (bool)loop
{
	bool returnValue = (bool)gdk_pixbuf_simple_anim_get_loop([self castedGObject]);

	return returnValue;
}

- (void)setLoop:(bool)loop
{
	gdk_pixbuf_simple_anim_set_loop([self castedGObject], loop);
}


@end