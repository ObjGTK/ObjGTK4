/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererSpinner.h"

@implementation OGTKCellRendererSpinner

- (instancetype)init
{
	GtkCellRendererSpinner* gobjectValue = GTK_CELL_RENDERER_SPINNER(gtk_cell_renderer_spinner_new());

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

- (GtkCellRendererSpinner*)castedGObject
{
	return GTK_CELL_RENDERER_SPINNER([self gObject]);
}


@end