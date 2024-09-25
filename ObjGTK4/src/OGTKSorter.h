/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkSorter` is an object to describe sorting criteria.
 * 
 * Its primary user is [class@Gtk.SortListModel]
 * 
 * The model will use a sorter to determine the order in which
 * its items should appear by calling [method@Gtk.Sorter.compare]
 * for pairs of items.
 * 
 * Sorters may change their sorting behavior through their lifetime.
 * In that case, they will emit the [signal@Gtk.Sorter::changed] signal
 * to notify that the sort order is no longer valid and should be updated
 * by calling gtk_sorter_compare() again.
 * 
 * GTK provides various pre-made sorter implementations for common sorting
 * operations. [class@Gtk.ColumnView] has built-in support for sorting lists
 * via the [property@Gtk.ColumnViewColumn:sorter] property, where the user can
 * change the sorting by clicking on list headers.
 * 
 * Of course, in particular for large lists, it is also possible to subclass
 * `GtkSorter` and provide one's own sorter.
 *
 */
@interface OGTKSorter : OGObject
{

}


/**
 * Methods
 */

- (GtkSorter*)castedGObject;

/**
 * Notifies all users of the sorter that it has changed.
 * 
 * This emits the [signal@Gtk.Sorter::changed] signal. Users
 * of the sorter should then update the sort order via
 * [method@Gtk.Sorter.compare].
 * 
 * Depending on the @change parameter, it may be possible to
 * update the sort order without a full resorting. Refer to
 * the [enum@Gtk.SorterChange] documentation for details.
 * 
 * This function is intended for implementers of `GtkSorter`
 * subclasses and should not be called from other functions.
 *
 * @param change How the sorter changed
 */
- (void)changed:(GtkSorterChange)change;

/**
 * Compares two given items according to the sort order implemented
 * by the sorter.
 * 
 * Sorters implement a partial order:
 * 
 * * It is reflexive, ie a = a
 * * It is antisymmetric, ie if a < b and b < a, then a = b
 * * It is transitive, ie given any 3 items with a ≤ b and b ≤ c,
 *   then a ≤ c
 * 
 * The sorter may signal it conforms to additional constraints
 * via the return value of [method@Gtk.Sorter.get_order].
 *
 * @param item1 first item to compare
 * @param item2 second item to compare
 * @return %GTK_ORDERING_EQUAL if @item1 == @item2,
 *   %GTK_ORDERING_SMALLER if @item1 < @item2,
 *   %GTK_ORDERING_LARGER if @item1 > @item2
 */
- (GtkOrdering)compareWithItem1:(gpointer)item1 item2:(gpointer)item2;

/**
 * Gets the order that @self conforms to.
 * 
 * See [enum@Gtk.SorterOrder] for details
 * of the possible return values.
 * 
 * This function is intended to allow optimizations.
 *
 * @return The order
 */
- (GtkSorterOrder)order;

@end