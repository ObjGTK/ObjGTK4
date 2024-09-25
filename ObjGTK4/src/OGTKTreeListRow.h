/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkTreeListRow` is used by `GtkTreeListModel` to represent items.
 * 
 * It allows navigating the model as a tree and modify the state of rows.
 * 
 * `GtkTreeListRow` instances are created by a `GtkTreeListModel` only
 * when the [property@Gtk.TreeListModel:passthrough] property is not set.
 * 
 * There are various support objects that can make use of `GtkTreeListRow`
 * objects, such as the [class@Gtk.TreeExpander] widget that allows displaying
 * an icon to expand or collapse a row or [class@Gtk.TreeListRowSorter] that
 * makes it possible to sort trees properly.
 *
 */
@interface OGTKTreeListRow : OGObject
{

}


/**
 * Methods
 */

- (GtkTreeListRow*)castedGObject;

/**
 * If @self is not expanded or @position is greater than the
 * number of children, %NULL is returned.
 *
 * @param position position of the child to get
 * @return the child in @position
 */
- (OGTKTreeListRow*)childRow:(guint)position;

/**
 * If the row is expanded, gets the model holding the children of @self.
 * 
 * This model is the model created by the
 * [callback@Gtk.TreeListModelCreateModelFunc]
 * and contains the original items, no matter what value
 * [property@Gtk.TreeListModel:passthrough] is set to.
 *
 * @return The model containing the children
 */
- (GListModel*)children;

/**
 * Gets the depth of this row.
 * 
 * Rows that correspond to items in the root model have a depth
 * of zero, rows corresponding to items of models of direct children
 * of the root model have a depth of 1 and so on.
 * 
 * The depth of a row never changes until the row is removed from its model
 * at which point it will forever return 0.
 *
 * @return The depth of this row
 */
- (guint)depth;

/**
 * Gets if a row is currently expanded.
 *
 * @return %TRUE if the row is expanded
 */
- (bool)expanded;

/**
 * Gets the item corresponding to this row,
 *
 * @return The item
 *   of this row. This function is only marked as nullable for backwards
 *   compatibility reasons.
 */
- (gpointer)item;

/**
 * Gets the row representing the parent for @self.
 * 
 * That is the row that would need to be collapsed
 * to make this row disappear.
 * 
 * If @self is a row corresponding to the root model,
 * %NULL is returned.
 * 
 * The value returned by this function never changes
 * until the row is removed from its model at which point
 * it will forever return %NULL.
 *
 * @return The parent of @self
 */
- (OGTKTreeListRow*)parent;

/**
 * Returns the position in the `GtkTreeListModel` that @self occupies
 * at the moment.
 *
 * @return The position in the model
 */
- (guint)position;

/**
 * Checks if a row can be expanded.
 * 
 * This does not mean that the row is actually expanded,
 * this can be checked with [method@Gtk.TreeListRow.get_expanded].
 * 
 * If a row is expandable never changes until the row is removed
 * from its model at which point it will forever return %FALSE.
 *
 * @return %TRUE if the row is expandable
 */
- (bool)isExpandable;

/**
 * Expands or collapses a row.
 * 
 * If a row is expanded, the model of calling the
 * [callback@Gtk.TreeListModelCreateModelFunc] for the row's
 * item will be inserted after this row. If a row is collapsed,
 * those items will be removed from the model.
 * 
 * If the row is not expandable, this function does nothing.
 *
 * @param expanded %TRUE if the row should be expanded
 */
- (void)setExpanded:(bool)expanded;

@end