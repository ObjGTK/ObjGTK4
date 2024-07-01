/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSwipe.h"

#import "OGTKGesture.h"

@implementation OGTKGestureSwipe

- (instancetype)init
{
	GtkGestureSwipe* gobjectValue = GTK_GESTURE_SWIPE(gtk_gesture_swipe_new());

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

- (GtkGestureSwipe*)castedGObject
{
	return GTK_GESTURE_SWIPE([self gObject]);
}

- (bool)velocityWithVelocityX:(double*)velocityX velocityY:(double*)velocityY
{
	bool returnValue = gtk_gesture_swipe_get_velocity([self castedGObject], velocityX, velocityY);

	return returnValue;
}


@end