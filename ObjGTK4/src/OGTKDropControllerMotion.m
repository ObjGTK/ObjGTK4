/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropControllerMotion.h"

#import <OGdk4/OGGdkDrop.h>

@implementation OGTKDropControllerMotion

- (instancetype)init
{
	GtkDropControllerMotion* gobjectValue = GTK_DROP_CONTROLLER_MOTION(gtk_drop_controller_motion_new());

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

- (GtkDropControllerMotion*)castedGObject
{
	return GTK_DROP_CONTROLLER_MOTION([self gObject]);
}

- (bool)containsPointer
{
	bool returnValue = gtk_drop_controller_motion_contains_pointer([self castedGObject]);

	return returnValue;
}

- (OGGdkDrop*)drop
{
	GdkDrop* gobjectValue = GDK_DROP(gtk_drop_controller_motion_get_drop([self castedGObject]));

	OGGdkDrop* returnValue = [OGGdkDrop withGObject:gobjectValue];
	return returnValue;
}

- (bool)isPointer
{
	bool returnValue = gtk_drop_controller_motion_is_pointer([self castedGObject]);

	return returnValue;
}


@end