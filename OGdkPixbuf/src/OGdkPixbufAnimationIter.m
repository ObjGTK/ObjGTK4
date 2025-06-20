/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbufAnimationIter.h"

#import "OGdkPixbuf.h"

@implementation OGdkPixbufAnimationIter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_PIXBUF_ANIMATION_ITER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_PIXBUF_ANIMATION_ITER);
	return gObjectClass;
}

- (GdkPixbufAnimationIter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_PIXBUF_ANIMATION_ITER, GdkPixbufAnimationIter);
}

- (bool)advanceWithCurrentTime:(const GTimeVal*)currentTime
{
	bool returnValue = (bool)gdk_pixbuf_animation_iter_advance((GdkPixbufAnimationIter*)[self castedGObject], currentTime);

	return returnValue;
}

- (int)delayTime
{
	int returnValue = (int)gdk_pixbuf_animation_iter_get_delay_time((GdkPixbufAnimationIter*)[self castedGObject]);

	return returnValue;
}

- (OGdkPixbuf*)pixbuf
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_animation_iter_get_pixbuf((GdkPixbufAnimationIter*)[self castedGObject]);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)onCurrentlyLoadingFrame
{
	bool returnValue = (bool)gdk_pixbuf_animation_iter_on_currently_loading_frame((GdkPixbufAnimationIter*)[self castedGObject]);

	return returnValue;
}


@end