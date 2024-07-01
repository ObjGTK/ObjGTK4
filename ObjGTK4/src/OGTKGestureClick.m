/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureClick.h"

#import "OGTKGesture.h"

@implementation OGTKGestureClick

- (instancetype)init
{
	GtkGestureClick* gobjectValue = GTK_GESTURE_CLICK(gtk_gesture_click_new());

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

- (GtkGestureClick*)castedGObject
{
	return GTK_GESTURE_CLICK([self gObject]);
}


@end