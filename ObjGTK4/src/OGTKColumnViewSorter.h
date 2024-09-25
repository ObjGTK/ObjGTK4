/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

@class OGTKColumnViewColumn;

/**
 * `GtkColumnViewSorter` is a sorter implementation that
 * is geared towards the needs of `GtkColumnView`.
 * 
 * The sorter returned by [method@Gtk.ColumnView.get_sorter] is
 * a `GtkColumnViewSorter`.
 * 
 * In column views, sorting can be configured by associating
 * sorters with columns, and users can invert sort order by clicking
 * on column headers. The API of `GtkColumnViewSorter` is designed
 * to allow saving and restoring this configuration.
 * 
 * If you are only interested in the primary sort column (i.e. the
 * column where a sort indicator is shown in the header), then
 * you can just look at [property@Gtk.ColumnViewSorter:primary-sort-column]
 * and [property@Gtk.ColumnViewSorter:primary-sort-order].
 * 
 * If you want to store the full sort configuration, including
 * secondary sort columns that are used for tie breaking, then
 * you can use [method@Gtk.ColumnViewSorter.get_nth_sort_column].
 * To get notified about changes, use [signal@Gtk.Sorter::changed].
 * 
 * To restore a saved sort configuration on a `GtkColumnView`,
 * use code like:
 * 
 * ```
 * sorter = gtk_column_view_get_sorter (view);
 * for (i = gtk_column_view_sorter_get_n_sort_columns (sorter) - 1; i >= 0; i--)
 *   {
 *     column = gtk_column_view_sorter_get_nth_sort_column (sorter, i, &order);
 *     gtk_column_view_sort_by_column (view, column, order);
 *   }
 * ```
 *
 */
@interface OGTKColumnViewSorter : OGTKSorter
{

}


/**
 * Methods
 */

- (GtkColumnViewSorter*)castedGObject;

/**
 * Returns the number of columns by which the sorter sorts.
 * 
 * If the sorter of the primary sort column does not determine
 * a total order, then the secondary sorters are consulted to
 * break the ties.
 * 
 * Use the [signal@Gtk.Sorter::changed] signal to get notified
 * when the number of sort columns changes.
 *
 * @return the number of sort columns
 */
- (guint)nsortColumns;

/**
 * Gets the @position'th sort column and its associated sort order.
 * 
 * Use the [signal@Gtk.Sorter::changed] signal to get notified
 * when sort columns change.
 *
 * @param position the position of the sort column to retrieve (0 for the
 *     primary sort column)
 * @param sortOrder return location for the sort order
 * @return the @positions sort column
 */
- (OGTKColumnViewColumn*)nthSortColumnWithPosition:(guint)position sortOrder:(GtkSortType*)sortOrder;

/**
 * Returns the primary sort column.
 * 
 * The primary sort column is the one that displays the triangle
 * in a column view header.
 *
 * @return the primary sort column
 */
- (OGTKColumnViewColumn*)primarySortColumn;

/**
 * Returns the primary sort order.
 * 
 * The primary sort order determines whether the triangle displayed
 * in the column view header of the primary sort column points upwards
 * or downwards.
 * 
 * If there is no primary sort column, then this function returns
 * `GTK_SORT_ASCENDING`.
 *
 * @return the primary sort order
 */
- (GtkSortType)primarySortOrder;

@end