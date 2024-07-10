/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererPixbuf.h"

@implementation OGTKCellRendererPixbuf

- (instancetype)init
{
	GtkCellRendererPixbuf* gobjectValue = GTK_CELL_RENDERER_PIXBUF(gtk_cell_renderer_pixbuf_new());

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkCellRendererPixbuf*)castedGObject
{
	return GTK_CELL_RENDERER_PIXBUF([self gObject]);
}


@end