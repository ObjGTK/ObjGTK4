/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkPixbufAnimationIter.h"

#import "OGGdkPixbuf.h"

@implementation OGGdkPixbufAnimationIter

- (GdkPixbufAnimationIter*)castedGObject
{
	return GDK_PIXBUF_ANIMATION_ITER([self gObject]);
}

- (bool)advance:(const GTimeVal*)currentTime
{
	bool returnValue = gdk_pixbuf_animation_iter_advance([self castedGObject], currentTime);

	return returnValue;
}

- (int)delayTime
{
	int returnValue = gdk_pixbuf_animation_iter_get_delay_time([self castedGObject]);

	return returnValue;
}

- (OGGdkPixbuf*)pixbuf
{
	GdkPixbuf* gobjectValue = GDK_PIXBUF(gdk_pixbuf_animation_iter_get_pixbuf([self castedGObject]));

	OGGdkPixbuf* returnValue = [OGGdkPixbuf withGObject:gobjectValue];
	return returnValue;
}

- (bool)onCurrentlyLoadingFrame
{
	bool returnValue = gdk_pixbuf_animation_iter_on_currently_loading_frame([self castedGObject]);

	return returnValue;
}


@end