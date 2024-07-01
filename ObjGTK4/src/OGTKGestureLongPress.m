/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureLongPress.h"

#import "OGTKGesture.h"

@implementation OGTKGestureLongPress

- (instancetype)init
{
	GtkGestureLongPress* gobjectValue = GTK_GESTURE_LONG_PRESS(gtk_gesture_long_press_new());

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

- (GtkGestureLongPress*)castedGObject
{
	return GTK_GESTURE_LONG_PRESS([self gObject]);
}

- (double)delayFactor
{
	double returnValue = gtk_gesture_long_press_get_delay_factor([self castedGObject]);

	return returnValue;
}

- (void)setDelayFactor:(double)delayFactor
{
	gtk_gesture_long_press_set_delay_factor([self castedGObject], delayFactor);
}


@end