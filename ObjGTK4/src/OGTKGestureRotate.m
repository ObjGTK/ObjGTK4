/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureRotate.h"

@implementation OGTKGestureRotate

- (instancetype)init
{
	GtkGestureRotate* gobjectValue = GTK_GESTURE_ROTATE(gtk_gesture_rotate_new());

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

- (GtkGestureRotate*)castedGObject
{
	return GTK_GESTURE_ROTATE([self gObject]);
}

- (double)angleDelta
{
	double returnValue = gtk_gesture_rotate_get_angle_delta([self castedGObject]);

	return returnValue;
}


@end