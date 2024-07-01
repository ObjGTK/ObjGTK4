/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererCombo.h"

#import "OGTKCellRenderer.h"

@implementation OGTKCellRendererCombo

- (instancetype)init
{
	GtkCellRendererCombo* gobjectValue = GTK_CELL_RENDERER_COMBO(gtk_cell_renderer_combo_new());

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

- (GtkCellRendererCombo*)castedGObject
{
	return GTK_CELL_RENDERER_COMBO([self gObject]);
}


@end