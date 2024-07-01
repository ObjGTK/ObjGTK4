/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKTreeListRow;

/**
 * `GtkTreeListModel` is a list model that can create child models on demand.
 *
 */
@interface OGTKTreeListModel : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithRoot:(GListModel*)root passthrough:(bool)passthrough autoexpand:(bool)autoexpand createFunc:(GtkTreeListModelCreateModelFunc)createFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy;

/**
 * Methods
 */

- (GtkTreeListModel*)castedGObject;

/**
 * Gets whether the model is set to automatically expand new rows
 * that get added.
 * 
 * This can be either rows added by changes to the underlying
 * models or via [method@Gtk.TreeListRow.set_expanded].
 *
 * @return %TRUE if the model is set to autoexpand
 */
- (bool)autoexpand;

/**
 * Gets the row item corresponding to the child at index @position for
 * @self's root model.
 * 
 * If @position is greater than the number of children in the root model,
 * %NULL is returned.
 * 
 * Do not confuse this function with [method@Gtk.TreeListModel.get_row].
 *
 * @param position position of the child to get
 * @return the child in @position
 */
- (OGTKTreeListRow*)childRow:(guint)position;

/**
 * Gets the root model that @self was created with.
 *
 * @return the root model
 */
- (GListModel*)model;

/**
 * Gets whether the model is passing through original row items.
 * 
 * If this function returns %FALSE, the `GListModel` functions for @self
 * return custom `GtkTreeListRow` objects. You need to call
 * [method@Gtk.TreeListRow.get_item] on these objects to get the original
 * item.
 * 
 * If %TRUE, the values of the child models are passed through in their
 * original state. You then need to call [method@Gtk.TreeListModel.get_row]
 * to get the custom `GtkTreeListRow`s.
 *
 * @return %TRUE if the model is passing through original row items
 */
- (bool)passthrough;

/**
 * Gets the row object for the given row.
 * 
 * If @position is greater than the number of items in @self,
 * %NULL is returned.
 * 
 * The row object can be used to expand and collapse rows as
 * well as to inspect its position in the tree. See its
 * documentation for details.
 * 
 * This row object is persistent and will refer to the current
 * item as long as the row is present in @self, independent of
 * other rows being added or removed.
 * 
 * If @self is set to not be passthrough, this function is
 * equivalent to calling g_list_model_get_item().
 * 
 * Do not confuse this function with [method@Gtk.TreeListModel.get_child_row].
 *
 * @param position the position of the row to fetch
 * @return The row item
 */
- (OGTKTreeListRow*)row:(guint)position;

/**
 * Sets whether the model should autoexpand.
 * 
 * If set to %TRUE, the model will recursively expand all rows that
 * get added to the model. This can be either rows added by changes
 * to the underlying models or via [method@Gtk.TreeListRow.set_expanded].
 *
 * @param autoexpand %TRUE to make the model autoexpand its rows
 */
- (void)setAutoexpand:(bool)autoexpand;

@end