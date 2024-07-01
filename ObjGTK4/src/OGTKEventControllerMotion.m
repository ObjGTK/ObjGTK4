/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerMotion.h"

@implementation OGTKEventControllerMotion

- (instancetype)init
{
	GtkEventControllerMotion* gobjectValue = GTK_EVENT_CONTROLLER_MOTION(gtk_event_controller_motion_new());

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

- (GtkEventControllerMotion*)castedGObject
{
	return GTK_EVENT_CONTROLLER_MOTION([self gObject]);
}

- (bool)containsPointer
{
	bool returnValue = gtk_event_controller_motion_contains_pointer([self castedGObject]);

	return returnValue;
}

- (bool)isPointer
{
	bool returnValue = gtk_event_controller_motion_is_pointer([self castedGObject]);

	return returnValue;
}


@end