/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A `GtkFilter` object describes the filtering to be performed by a
 * [class@Gtk.FilterListModel].
 * 
 * The model will use the filter to determine if it should include items
 * or not by calling [method@Gtk.Filter.match] for each item and only
 * keeping the ones that the function returns %TRUE for.
 * 
 * Filters may change what items they match through their lifetime. In that
 * case, they will emit the [signal@Gtk.Filter::changed] signal to notify
 * that previous filter results are no longer valid and that items should
 * be checked again via [method@Gtk.Filter.match].
 * 
 * GTK provides various pre-made filter implementations for common filtering
 * operations. These filters often include properties that can be linked to
 * various widgets to easily allow searches.
 * 
 * However, in particular for large lists or complex search methods, it is
 * also possible to subclass `GtkFilter` and provide one's own filter.
 *
 */
@interface OGTKFilter : OGObject
{

}


/**
 * Methods
 */

- (GtkFilter*)castedGObject;

/**
 * Notifies all users of the filter that it has changed.
 * 
 * This emits the [signal@Gtk.Filter::changed] signal. Users
 * of the filter should then check items again via
 * [method@Gtk.Filter.match].
 * 
 * Depending on the @change parameter, not all items need to
 * be changed, but only some. Refer to the [enum@Gtk.FilterChange]
 * documentation for details.
 * 
 * This function is intended for implementers of `GtkFilter`
 * subclasses and should not be called from other functions.
 *
 * @param change How the filter changed
 */
- (void)changed:(GtkFilterChange)change;

/**
 * Gets the known strictness of @filters.
 * 
 * If the strictness is not known, %GTK_FILTER_MATCH_SOME is returned.
 * 
 * This value may change after emission of the [signal@Gtk.Filter::changed]
 * signal.
 * 
 * This function is meant purely for optimization purposes, filters can
 * choose to omit implementing it, but `GtkFilterListModel` uses it.
 *
 * @return the strictness of @self
 */
- (GtkFilterMatch)strictness;

/**
 * Checks if the given @item is matched by the filter or not.
 *
 * @param item The item to check
 * @return %TRUE if the filter matches the item and a filter model should
 *   keep it, %FALSE if not.
 */
- (bool)match:(gpointer)item;

@end