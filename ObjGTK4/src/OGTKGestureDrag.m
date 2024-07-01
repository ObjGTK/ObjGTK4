/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureDrag.h"

#import "OGTKGesture.h"

@implementation OGTKGestureDrag

- (instancetype)init
{
	GtkGestureDrag* gobjectValue = GTK_GESTURE_DRAG(gtk_gesture_drag_new());

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

- (GtkGestureDrag*)castedGObject
{
	return GTK_GESTURE_DRAG([self gObject]);
}

- (bool)offsetWithX:(double*)x y:(double*)y
{
	bool returnValue = gtk_gesture_drag_get_offset([self castedGObject], x, y);

	return returnValue;
}

- (bool)startPointWithX:(double*)x y:(double*)y
{
	bool returnValue = gtk_gesture_drag_get_start_point([self castedGObject], x, y);

	return returnValue;
}


@end