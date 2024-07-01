/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererToggle.h"

@implementation OGTKCellRendererToggle

- (instancetype)init
{
	GtkCellRendererToggle* gobjectValue = GTK_CELL_RENDERER_TOGGLE(gtk_cell_renderer_toggle_new());

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

- (GtkCellRendererToggle*)castedGObject
{
	return GTK_CELL_RENDERER_TOGGLE([self gObject]);
}

- (bool)activatable
{
	bool returnValue = gtk_cell_renderer_toggle_get_activatable([self castedGObject]);

	return returnValue;
}

- (bool)active
{
	bool returnValue = gtk_cell_renderer_toggle_get_active([self castedGObject]);

	return returnValue;
}

- (bool)radio
{
	bool returnValue = gtk_cell_renderer_toggle_get_radio([self castedGObject]);

	return returnValue;
}

- (void)setActivatable:(bool)setting
{
	gtk_cell_renderer_toggle_set_activatable([self castedGObject], setting);
}

- (void)setActive:(bool)setting
{
	gtk_cell_renderer_toggle_set_active([self castedGObject], setting);
}

- (void)setRadio:(bool)radio
{
	gtk_cell_renderer_toggle_set_radio([self castedGObject], radio);
}


@end