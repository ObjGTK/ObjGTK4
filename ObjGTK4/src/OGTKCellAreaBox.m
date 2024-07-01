/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellAreaBox.h"

#import "OGTKCellRenderer.h"

@implementation OGTKCellAreaBox

- (instancetype)init
{
	GtkCellAreaBox* gobjectValue = GTK_CELL_AREA_BOX(gtk_cell_area_box_new());

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

- (GtkCellAreaBox*)castedGObject
{
	return GTK_CELL_AREA_BOX([self gObject]);
}

- (int)spacing
{
	int returnValue = gtk_cell_area_box_get_spacing([self castedGObject]);

	return returnValue;
}

- (void)packEndWithRenderer:(OGTKCellRenderer*)renderer expand:(bool)expand align:(bool)align fixed:(bool)fixed
{
	gtk_cell_area_box_pack_end([self castedGObject], [renderer castedGObject], expand, align, fixed);
}

- (void)packStartWithRenderer:(OGTKCellRenderer*)renderer expand:(bool)expand align:(bool)align fixed:(bool)fixed
{
	gtk_cell_area_box_pack_start([self castedGObject], [renderer castedGObject], expand, align, fixed);
}

- (void)setSpacing:(int)spacing
{
	gtk_cell_area_box_set_spacing([self castedGObject], spacing);
}


@end