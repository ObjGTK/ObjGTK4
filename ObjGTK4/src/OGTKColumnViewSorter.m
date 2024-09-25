/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewSorter.h"

#import "OGTKColumnViewColumn.h"

@implementation OGTKColumnViewSorter

- (GtkColumnViewSorter*)castedGObject
{
	return GTK_COLUMN_VIEW_SORTER([self gObject]);
}

- (guint)nsortColumns
{
	guint returnValue = gtk_column_view_sorter_get_n_sort_columns([self castedGObject]);

	return returnValue;
}

- (OGTKColumnViewColumn*)nthSortColumnWithPosition:(guint)position sortOrder:(GtkSortType*)sortOrder
{
	GtkColumnViewColumn* gobjectValue = GTK_COLUMN_VIEW_COLUMN(gtk_column_view_sorter_get_nth_sort_column([self castedGObject], position, sortOrder));

	OGTKColumnViewColumn* returnValue = [OGTKColumnViewColumn withGObject:gobjectValue];
	return returnValue;
}

- (OGTKColumnViewColumn*)primarySortColumn
{
	GtkColumnViewColumn* gobjectValue = GTK_COLUMN_VIEW_COLUMN(gtk_column_view_sorter_get_primary_sort_column([self castedGObject]));

	OGTKColumnViewColumn* returnValue = [OGTKColumnViewColumn withGObject:gobjectValue];
	return returnValue;
}

- (GtkSortType)primarySortOrder
{
	GtkSortType returnValue = gtk_column_view_sorter_get_primary_sort_order([self castedGObject]);

	return returnValue;
}


@end