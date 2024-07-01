/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMountOperation.h"

#import "OGTKWindow.h"
#import <OGdk4/OGGdkDisplay.h>

@implementation OGTKMountOperation

- (instancetype)init:(OGTKWindow*)parent
{
	GtkMountOperation* gobjectValue = GTK_MOUNT_OPERATION(gtk_mount_operation_new([parent castedGObject]));

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

- (GtkMountOperation*)castedGObject
{
	return GTK_MOUNT_OPERATION([self gObject]);
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gtk_mount_operation_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWindow*)parent
{
	GtkWindow* gobjectValue = GTK_WINDOW(gtk_mount_operation_get_parent([self castedGObject]));

	OGTKWindow* returnValue = [OGTKWindow withGObject:gobjectValue];
	return returnValue;
}

- (bool)isShowing
{
	bool returnValue = gtk_mount_operation_is_showing([self castedGObject]);

	return returnValue;
}

- (void)setDisplay:(OGGdkDisplay*)display
{
	gtk_mount_operation_set_display([self castedGObject], [display castedGObject]);
}

- (void)setParent:(OGTKWindow*)parent
{
	gtk_mount_operation_set_parent([self castedGObject], [parent castedGObject]);
}


@end