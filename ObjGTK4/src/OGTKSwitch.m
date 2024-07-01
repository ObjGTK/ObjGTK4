/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSwitch.h"

@implementation OGTKSwitch

- (instancetype)init
{
	GtkSwitch* gobjectValue = GTK_SWITCH(gtk_switch_new());

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

- (GtkSwitch*)castedGObject
{
	return GTK_SWITCH([self gObject]);
}

- (bool)active
{
	bool returnValue = gtk_switch_get_active([self castedGObject]);

	return returnValue;
}

- (bool)state
{
	bool returnValue = gtk_switch_get_state([self castedGObject]);

	return returnValue;
}

- (void)setActive:(bool)isActive
{
	gtk_switch_set_active([self castedGObject], isActive);
}

- (void)setState:(bool)state
{
	gtk_switch_set_state([self castedGObject], state);
}


@end