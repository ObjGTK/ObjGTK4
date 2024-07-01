/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerFocus.h"

@implementation OGTKEventControllerFocus

- (instancetype)init
{
	GtkEventControllerFocus* gobjectValue = GTK_EVENT_CONTROLLER_FOCUS(gtk_event_controller_focus_new());

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

- (GtkEventControllerFocus*)castedGObject
{
	return GTK_EVENT_CONTROLLER_FOCUS([self gObject]);
}

- (bool)containsFocus
{
	bool returnValue = gtk_event_controller_focus_contains_focus([self castedGObject]);

	return returnValue;
}

- (bool)isFocus
{
	bool returnValue = gtk_event_controller_focus_is_focus([self castedGObject]);

	return returnValue;
}


@end