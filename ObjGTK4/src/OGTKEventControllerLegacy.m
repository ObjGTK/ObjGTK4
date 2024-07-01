/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventControllerLegacy.h"

@implementation OGTKEventControllerLegacy

- (instancetype)init
{
	GtkEventControllerLegacy* gobjectValue = GTK_EVENT_CONTROLLER_LEGACY(gtk_event_controller_legacy_new());

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

- (GtkEventControllerLegacy*)castedGObject
{
	return GTK_EVENT_CONTROLLER_LEGACY([self gObject]);
}


@end