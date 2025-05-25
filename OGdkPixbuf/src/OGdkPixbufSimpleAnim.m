/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbufSimpleAnim.h"

#import "OGdkPixbuf.h"

@implementation OGdkPixbufSimpleAnim

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_PIXBUF_SIMPLE_ANIM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_PIXBUF_SIMPLE_ANIM);
	return gObjectClass;
}

+ (instancetype)pixbufSimpleAnimWithWidth:(gint)width height:(gint)height rate:(gfloat)rate
{
	GdkPixbufSimpleAnim* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_simple_anim_new(width, height, rate), GDK_TYPE_PIXBUF_SIMPLE_ANIM, GdkPixbufSimpleAnim);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkPixbufSimpleAnim* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbufSimpleAnim alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkPixbufSimpleAnim*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_PIXBUF_SIMPLE_ANIM, GdkPixbufSimpleAnim);
}

- (void)addFrameWithPixbuf:(OGdkPixbuf*)pixbuf
{
	gdk_pixbuf_simple_anim_add_frame((GdkPixbufSimpleAnim*)[self castedGObject], [pixbuf castedGObject]);
}

- (bool)loop
{
	bool returnValue = (bool)gdk_pixbuf_simple_anim_get_loop((GdkPixbufSimpleAnim*)[self castedGObject]);

	return returnValue;
}

- (void)setLoop:(bool)loop
{
	gdk_pixbuf_simple_anim_set_loop((GdkPixbufSimpleAnim*)[self castedGObject], loop);
}


@end