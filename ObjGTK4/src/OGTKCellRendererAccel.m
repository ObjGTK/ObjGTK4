/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererAccel.h"

#import "OGTKCellRenderer.h"

@implementation OGTKCellRendererAccel

- (instancetype)init
{
	GtkCellRendererAccel* gobjectValue = GTK_CELL_RENDERER_ACCEL(gtk_cell_renderer_accel_new());

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

- (GtkCellRendererAccel*)castedGObject
{
	return GTK_CELL_RENDERER_ACCEL([self gObject]);
}


@end