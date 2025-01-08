/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMountOperation.h"

#import <OGdk4/OGdkDisplay.h>
#import "OGTKWindow.h"

@implementation OGTKMountOperation

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MOUNT_OPERATION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithParent:(OGTKWindow*)parent
{
	GtkMountOperation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_mount_operation_new([parent castedGObject]), GtkMountOperation, GtkMountOperation);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkMountOperation, GtkMountOperation);
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gtk_mount_operation_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWindow*)parent
{
	GtkWindow* gobjectValue = gtk_mount_operation_get_parent([self castedGObject]);

	OGTKWindow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)isShowing
{
	bool returnValue = (bool)gtk_mount_operation_is_showing([self castedGObject]);

	return returnValue;
}

- (void)setDisplay:(OGdkDisplay*)display
{
	gtk_mount_operation_set_display([self castedGObject], [display castedGObject]);
}

- (void)setParent:(OGTKWindow*)parent
{
	gtk_mount_operation_set_parent([self castedGObject], [parent castedGObject]);
}


@end