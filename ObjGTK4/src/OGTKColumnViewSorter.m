/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewSorter.h"

#import "OGTKColumnViewColumn.h"

@implementation OGTKColumnViewSorter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLUMN_VIEW_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COLUMN_VIEW_SORTER);
	return gObjectClass;
}

- (GtkColumnViewSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COLUMN_VIEW_SORTER, GtkColumnViewSorter);
}

- (guint)nsortColumns
{
	guint returnValue = (guint)gtk_column_view_sorter_get_n_sort_columns((GtkColumnViewSorter*)[self castedGObject]);

	return returnValue;
}

- (OGTKColumnViewColumn*)nthSortColumnWithPosition:(guint)position sortOrder:(GtkSortType*)sortOrder
{
	GtkColumnViewColumn* gobjectValue = gtk_column_view_sorter_get_nth_sort_column((GtkColumnViewSorter*)[self castedGObject], position, sortOrder);

	OGTKColumnViewColumn* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKColumnViewColumn*)primarySortColumn
{
	GtkColumnViewColumn* gobjectValue = gtk_column_view_sorter_get_primary_sort_column((GtkColumnViewSorter*)[self castedGObject]);

	OGTKColumnViewColumn* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkSortType)primarySortOrder
{
	GtkSortType returnValue = (GtkSortType)gtk_column_view_sorter_get_primary_sort_order((GtkColumnViewSorter*)[self castedGObject]);

	return returnValue;
}


@end