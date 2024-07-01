/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureZoom.h"

@implementation OGTKGestureZoom

- (instancetype)init
{
	GtkGestureZoom* gobjectValue = GTK_GESTURE_ZOOM(gtk_gesture_zoom_new());

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

- (GtkGestureZoom*)castedGObject
{
	return GTK_GESTURE_ZOOM([self gObject]);
}

- (double)scaleDelta
{
	double returnValue = gtk_gesture_zoom_get_scale_delta([self castedGObject]);

	return returnValue;
}


@end