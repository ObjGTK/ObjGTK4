/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGridLayout.h"

@implementation OGTKGridLayout

- (instancetype)init
{
	GtkGridLayout* gobjectValue = GTK_GRID_LAYOUT(gtk_grid_layout_new());

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

- (GtkGridLayout*)castedGObject
{
	return GTK_GRID_LAYOUT([self gObject]);
}

- (int)baselineRow
{
	int returnValue = gtk_grid_layout_get_baseline_row([self castedGObject]);

	return returnValue;
}

- (bool)columnHomogeneous
{
	bool returnValue = gtk_grid_layout_get_column_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)columnSpacing
{
	guint returnValue = gtk_grid_layout_get_column_spacing([self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)rowBaselinePosition:(int)row
{
	GtkBaselinePosition returnValue = gtk_grid_layout_get_row_baseline_position([self castedGObject], row);

	return returnValue;
}

- (bool)rowHomogeneous
{
	bool returnValue = gtk_grid_layout_get_row_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)rowSpacing
{
	guint returnValue = gtk_grid_layout_get_row_spacing([self castedGObject]);

	return returnValue;
}

- (void)setBaselineRow:(int)row
{
	gtk_grid_layout_set_baseline_row([self castedGObject], row);
}

- (void)setColumnHomogeneous:(bool)homogeneous
{
	gtk_grid_layout_set_column_homogeneous([self castedGObject], homogeneous);
}

- (void)setColumnSpacing:(guint)spacing
{
	gtk_grid_layout_set_column_spacing([self castedGObject], spacing);
}

- (void)setRowBaselinePositionWithRow:(int)row pos:(GtkBaselinePosition)pos
{
	gtk_grid_layout_set_row_baseline_position([self castedGObject], row, pos);
}

- (void)setRowHomogeneous:(bool)homogeneous
{
	gtk_grid_layout_set_row_homogeneous([self castedGObject], homogeneous);
}

- (void)setRowSpacing:(guint)spacing
{
	gtk_grid_layout_set_row_spacing([self castedGObject], spacing);
}


@end