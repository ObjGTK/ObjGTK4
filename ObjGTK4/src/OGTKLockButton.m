/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLockButton.h"

#import <OGio/OGPermission.h>
#import "OGTKWidget.h"

@implementation OGTKLockButton

- (instancetype)init:(OGPermission*)permission
{
	GtkLockButton* gobjectValue = GTK_LOCK_BUTTON(gtk_lock_button_new([permission castedGObject]));

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

- (GtkLockButton*)castedGObject
{
	return GTK_LOCK_BUTTON([self gObject]);
}

- (OGPermission*)permission
{
	GPermission* gobjectValue = G_PERMISSION(gtk_lock_button_get_permission([self castedGObject]));

	OGPermission* returnValue = [OGPermission withGObject:gobjectValue];
	return returnValue;
}

- (void)setPermission:(OGPermission*)permission
{
	gtk_lock_button_set_permission([self castedGObject], [permission castedGObject]);
}


@end