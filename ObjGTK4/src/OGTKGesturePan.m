/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGesturePan.h"

#import "OGTKGesture.h"

@implementation OGTKGesturePan

- (instancetype)init:(GtkOrientation)orientation
{
	GtkGesturePan* gobjectValue = GTK_GESTURE_PAN(gtk_gesture_pan_new(orientation));

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

- (GtkGesturePan*)castedGObject
{
	return GTK_GESTURE_PAN([self gObject]);
}

- (GtkOrientation)orientation
{
	GtkOrientation returnValue = gtk_gesture_pan_get_orientation([self castedGObject]);

	return returnValue;
}

- (void)setOrientation:(GtkOrientation)orientation
{
	gtk_gesture_pan_set_orientation([self castedGObject], orientation);
}


@end