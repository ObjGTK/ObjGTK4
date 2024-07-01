/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererText.h"

@implementation OGTKCellRendererText

- (instancetype)init
{
	GtkCellRendererText* gobjectValue = GTK_CELL_RENDERER_TEXT(gtk_cell_renderer_text_new());

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

- (GtkCellRendererText*)castedGObject
{
	return GTK_CELL_RENDERER_TEXT([self gObject]);
}

- (void)setFixedHeightFromFont:(int)numberOfRows
{
	gtk_cell_renderer_text_set_fixed_height_from_font([self castedGObject], numberOfRows);
}


@end