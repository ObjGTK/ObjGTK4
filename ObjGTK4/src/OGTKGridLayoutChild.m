/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGridLayoutChild.h"

@implementation OGTKGridLayoutChild

- (GtkGridLayoutChild*)castedGObject
{
	return GTK_GRID_LAYOUT_CHILD([self gObject]);
}

- (int)column
{
	int returnValue = gtk_grid_layout_child_get_column([self castedGObject]);

	return returnValue;
}

- (int)columnSpan
{
	int returnValue = gtk_grid_layout_child_get_column_span([self castedGObject]);

	return returnValue;
}

- (int)row
{
	int returnValue = gtk_grid_layout_child_get_row([self castedGObject]);

	return returnValue;
}

- (int)rowSpan
{
	int returnValue = gtk_grid_layout_child_get_row_span([self castedGObject]);

	return returnValue;
}

- (void)setColumn:(int)column
{
	gtk_grid_layout_child_set_column([self castedGObject], column);
}

- (void)setColumnSpan:(int)span
{
	gtk_grid_layout_child_set_column_span([self castedGObject], span);
}

- (void)setRow:(int)row
{
	gtk_grid_layout_child_set_row([self castedGObject], row);
}

- (void)setRowSpan:(int)span
{
	gtk_grid_layout_child_set_row_span([self castedGObject], span);
}


@end