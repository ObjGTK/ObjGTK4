/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A tree-like data structure that can be used with the [class@Gtk.TreeView].
 * 
 * The `GtkTreeStore` object is a list model for use with a `GtkTreeView`
 * widget. It implements the [iface@Gtk.TreeModel] interface, and consequently,
 * can use all of the methods available there. It also implements the
 * [iface@Gtk.TreeSortable] interface so it can be sorted by the view.
 * Finally, it also implements the tree [drag][iface@Gtk.TreeDragSource]
 * and [drop][iface@Gtk.TreeDragDest] interfaces.
 * 
 * `GtkTreeStore` is deprecated since GTK 4.10, and should not be used in newly
 * written code. You should use [class@Gtk.TreeListModel] for a tree-like model
 * object.
 * 
 * ## GtkTreeStore as GtkBuildable
 * 
 * The GtkTreeStore implementation of the `GtkBuildable` interface allows
 * to specify the model columns with a `<columns>` element that may contain
 * multiple `<column>` elements, each specifying one model column. The “type”
 * attribute specifies the data type for the column.
 * 
 * An example of a UI Definition fragment for a tree store:
 * 
 * ```xml
 * <object class="GtkTreeStore">
 *   <columns>
 *     <column type="gchararray"/>
 *     <column type="gchararray"/>
 *     <column type="gint"/>
 *   </columns>
 * </object>
 * ```
 *
 */
@interface OGTKTreeStore : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initvWithNcolumns:(int)ncolumns types:(GType*)types;

/**
 * Methods
 */

- (GtkTreeStore*)castedGObject;

/**
 * Appends a new row to @tree_store.
 * 
 * If @parent is non-%NULL, then it will append the new row after the last
 * child of @parent, otherwise it will append a row to the top level.
 * 
 * The @iter parameter will be changed to point to this new row. The row will
 * be empty after this function is called. To fill in values, you need to call
 * gtk_tree_store_set() or gtk_tree_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the appended row
 * @param parent A valid `GtkTreeIter`
 */
- (void)appendWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent;

/**
 * Removes all rows from @tree_store
 *
 */
- (void)clear;

/**
 * Creates a new row at @position.
 * 
 * If parent is non-%NULL, then the row will be made a child of @parent.
 * Otherwise, the row will be created at the toplevel.
 * 
 * If @position is `-1` or is larger than the number of rows at that level,
 * then the new row will be inserted to the end of the list.
 * 
 * The @iter parameter will be changed to point to this new row. The row
 * will be empty after this function is called. To fill in values, you
 * need to call gtk_tree_store_set() or gtk_tree_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the new row
 * @param parent A valid `GtkTreeIter`
 * @param position position to insert the new row, or -1 for last
 */
- (void)insertWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent position:(int)position;

/**
 * Inserts a new row after @sibling.
 * 
 * If @sibling is %NULL, then the row will be prepended to @parent’s children.
 * 
 * If @parent and @sibling are %NULL, then the row will be prepended to the
 * toplevel.
 * 
 * If both @sibling and @parent are set, then @parent must be the parent
 * of @sibling. When @sibling is set, @parent is optional.
 * 
 * The @iter parameter will be changed to point to this new row. The row will
 * be empty after this function is called. To fill in values, you need to call
 * gtk_tree_store_set() or gtk_tree_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the new row
 * @param parent A valid `GtkTreeIter`
 * @param sibling A valid `GtkTreeIter`
 */
- (void)insertAfterWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent sibling:(GtkTreeIter*)sibling;

/**
 * Inserts a new row before @sibling.
 * 
 * If @sibling is %NULL, then the row will be appended to @parent’s children.
 * 
 * If @parent and @sibling are %NULL, then the row will be appended to the
 * toplevel.
 * 
 * If both @sibling and @parent are set, then @parent must be the parent
 * of @sibling. When @sibling is set, @parent is optional.
 * 
 * The @iter parameter will be changed to point to this new row. The row will
 * be empty after this function is called. To fill in values, you need to call
 * gtk_tree_store_set() or gtk_tree_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the new row
 * @param parent A valid `GtkTreeIter`
 * @param sibling A valid `GtkTreeIter`
 */
- (void)insertBeforeWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent sibling:(GtkTreeIter*)sibling;

/**
 * A variant of gtk_tree_store_insert_with_values() which takes
 * the columns and values as two arrays, instead of varargs.
 * 
 * This function is mainly intended for language bindings.
 *
 * @param iter An unset `GtkTreeIter` to set the new row
 * @param parent A valid `GtkTreeIter`
 * @param position position to insert the new row, or -1 for last
 * @param columns an array of column numbers
 * @param values an array of GValues
 * @param nvalues the length of the @columns and @values arrays
 */
- (void)insertWithValuesvWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent position:(int)position columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues;

/**
 * Checks if @iter is an ancestor of @descendant.
 *
 * @param iter A valid `GtkTreeIter`
 * @param descendant A valid `GtkTreeIter`
 * @return true if @iter is an ancestor of @descendant, and false otherwise
 */
- (bool)isAncestorWithIter:(GtkTreeIter*)iter descendant:(GtkTreeIter*)descendant;

/**
 * Returns the depth of the position pointed by the iterator
 * 
 * The depth will be 0 for anything on the root level, 1 for anything down
 * a level, etc.
 *
 * @param iter A valid `GtkTreeIter`
 * @return The depth of the position pointed by the iterator
 */
- (int)iterDepth:(GtkTreeIter*)iter;

/**
 * Checks if the given iter is a valid iter for this `GtkTreeStore`.
 * 
 * This function is slow. Only use it for debugging and/or testing
 * purposes.
 *
 * @param iter the iterator to check
 * @return true if the iter is valid, and false otherwise
 */
- (bool)iterIsValid:(GtkTreeIter*)iter;

/**
 * Moves @iter in @tree_store to the position after @position.
 * 
 * @iter and @position should be in the same level.
 * 
 * Note that this function only works with unsorted stores.
 * 
 * If @position is %NULL, @iter will be moved to the start of the level.
 *
 * @param iter A `GtkTreeIter`.
 * @param position A `GtkTreeIter`.
 */
- (void)moveAfterWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position;

/**
 * Moves @iter in @tree_store to the position before @position.
 * 
 * @iter and @position should be in the same level.
 * 
 * Note that this function only works with unsorted stores.
 * 
 * If @position is %NULL, @iter will be moved to the end of the level.
 *
 * @param iter A `GtkTreeIter`
 * @param position A `GtkTreeIter`
 */
- (void)moveBeforeWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position;

/**
 * Prepends a new row to @tree_store.
 * 
 * If @parent is non-%NULL, then it will prepend the new row before the first
 * child of @parent, otherwise it will prepend a row to the top level. The
 * `iter` parameter will be changed to point to this new row.  The row will
 * be empty after this function is called. To fill in values, you need to
 * call gtk_tree_store_set() or gtk_tree_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the prepended row
 * @param parent A valid `GtkTreeIter`
 */
- (void)prependWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent;

/**
 * Removes @iter from @tree_store.
 * 
 * After being removed, @iter is set to the next valid row at that level, or
 * invalidated if it previously pointed to the last one.
 *
 * @param iter A valid `GtkTreeIter`
 * @return true if @iter is still valid, and false otherwise
 */
- (bool)remove:(GtkTreeIter*)iter;

/**
 * Reorders the children of @parent in @tree_store to follow the order
 * indicated by @new_order.
 * 
 * Note that this function only works with unsorted stores.
 *
 * @param parent the parent of the children to re-order
 * @param newOrder an array of integers mapping the new position
 *   of each child to its old position before the re-ordering,
 *   i.e. `new_order[newpos] = oldpos`
 */
- (void)reorderWithParent:(GtkTreeIter*)parent newOrder:(int*)newOrder;

/**
 * Sets the type of the columns in a tree store.
 * 
 * This function is meant primarily for types that inherit from
 * `GtkTreeStore`, and should only be used when constructing a new
 * `GtkTreeStore`.
 * 
 * This functions cannot be called after a row has been added,
 * or a method on the `GtkTreeModel` interface is called on the
 * tree store.
 *
 * @param ncolumns Number of columns for the tree store
 * @param types An array of `GType` types, one for each column
 */
- (void)setColumnTypesWithNcolumns:(int)ncolumns types:(GType*)types;

/**
 * A version of gtk_tree_store_set() using `va_list`.
 *
 * @param iter A valid `GtkTreeIter` for the row being modified
 * @param varArgs va_list of column/value pairs
 */
- (void)setValistWithIter:(GtkTreeIter*)iter varArgs:(va_list)varArgs;

/**
 * Sets the data in the cell specified by @iter and @column.
 * 
 * The type of @value must be convertible to the type of the
 * column.
 *
 * @param iter A valid `GtkTreeIter` for the row being modified
 * @param column column number to modify
 * @param value new value for the cell
 */
- (void)setValueWithIter:(GtkTreeIter*)iter column:(int)column value:(GValue*)value;

/**
 * A variant of gtk_tree_store_set_valist() which takes
 * the columns and values as two arrays, instead of using variadic
 * arguments.
 * 
 * This function is mainly intended for language bindings or in case
 * the number of columns to change is not known until run-time.
 *
 * @param iter A valid `GtkTreeIter` for the row being modified
 * @param columns an array of column numbers
 * @param values an array of GValues
 * @param nvalues the length of the @columns and @values arrays
 */
- (void)setValuesvWithIter:(GtkTreeIter*)iter columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues;

/**
 * Swaps @a and @b in the same level of @tree_store.
 * 
 * Note that this function only works with unsorted stores.
 *
 * @param a A `GtkTreeIter`.
 * @param b Another `GtkTreeIter`.
 */
- (void)swapWithA:(GtkTreeIter*)a b:(GtkTreeIter*)b;

@end