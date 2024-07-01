/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerScroll.h"

@implementation OGTKEventControllerScroll

- (instancetype)init:(GtkEventControllerScrollFlags)flags
{
	GtkEventControllerScroll* gobjectValue = GTK_EVENT_CONTROLLER_SCROLL(gtk_event_controller_scroll_new(flags));

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

- (GtkEventControllerScroll*)castedGObject
{
	return GTK_EVENT_CONTROLLER_SCROLL([self gObject]);
}

- (GtkEventControllerScrollFlags)flags
{
	GtkEventControllerScrollFlags returnValue = gtk_event_controller_scroll_get_flags([self castedGObject]);

	return returnValue;
}

- (GdkScrollUnit)unit
{
	GdkScrollUnit returnValue = gtk_event_controller_scroll_get_unit([self castedGObject]);

	return returnValue;
}

- (void)setFlags:(GtkEventControllerScrollFlags)flags
{
	gtk_event_controller_scroll_set_flags([self castedGObject], flags);
}


@end