/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A list-like data structure that can be used with the [class@Gtk.TreeView].
 * 
 * The `GtkListStore` object is a list model for use with a `GtkTreeView`
 * widget.  It implements the `GtkTreeModel` interface, and consequentialy,
 * can use all of the methods available there.  It also implements the
 * `GtkTreeSortable` interface so it can be sorted by the view.
 * Finally, it also implements the tree
 * [drag](iface.TreeDragSource.html) and [drop](iface.TreeDragDest.html)
 * interfaces.
 * 
 * The `GtkListStore` can accept most `GType`s as a column type, though
 * it can’t accept all custom types.  Internally, it will keep a copy of
 * data passed in (such as a string or a boxed pointer).  Columns that
 * accept `GObject`s are handled a little differently.  The
 * `GtkListStore` will keep a reference to the object instead of copying the
 * value.  As a result, if the object is modified, it is up to the
 * application writer to call [method@Gtk.TreeModel.row_changed] to emit the
 * [signal@Gtk.TreeModel::row_changed] signal. This most commonly affects lists
 * with [class@Gdk.Texture]s stored.
 * 
 * An example for creating a simple list store:
 * 
 * ```c
 * enum {
 *   COLUMN_STRING,
 *   COLUMN_INT,
 *   COLUMN_BOOLEAN,
 *   N_COLUMNS
 * };
 * 
 * {
 *   GtkListStore *list_store;
 *   GtkTreePath *path;
 *   GtkTreeIter iter;
 *   int i;
 * 
 *   list_store = gtk_list_store_new (N_COLUMNS,
 *                                    G_TYPE_STRING,
 *                                    G_TYPE_INT,
 *                                    G_TYPE_BOOLEAN);
 * 
 *   for (i = 0; i < 10; i++)
 *     {
 *       char *some_data;
 * 
 *       some_data = get_some_data (i);
 * 
 *       // Add a new row to the model
 *       gtk_list_store_append (list_store, &iter);
 *       gtk_list_store_set (list_store, &iter,
 *                           COLUMN_STRING, some_data,
 *                           COLUMN_INT, i,
 *                           COLUMN_BOOLEAN,  FALSE,
 *                           -1);
 * 
 *       // As the store will keep a copy of the string internally,
 *       // we free some_data.
 *       g_free (some_data);
 *     }
 * 
 *   // Modify a particular row
 *   path = gtk_tree_path_new_from_string ("4");
 *   gtk_tree_model_get_iter (GTK_TREE_MODEL (list_store),
 *                            &iter,
 *                            path);
 *   gtk_tree_path_free (path);
 *   gtk_list_store_set (list_store, &iter,
 *                       COLUMN_BOOLEAN, TRUE,
 *                       -1);
 * }
 * ```
 * 
 * `GtkListStore` is deprecated since GTK 4.10, and should not be used in newly
 * written code. You should use [class@Gio.ListStore] instead, and the various
 * list models provided by GTK.
 * 
 * ## Performance Considerations
 * 
 * Internally, the `GtkListStore` was originally implemented with a linked list
 * with a tail pointer.  As a result, it was fast at data insertion and deletion,
 * and not fast at random data access.  The `GtkListStore` sets the
 * `GTK_TREE_MODEL_ITERS_PERSIST` flag, which means that `GtkTreeIter`s can be
 * cached while the row exists.  Thus, if access to a particular row is needed
 * often and your code is expected to run on older versions of GTK, it is worth
 * keeping the iter around.
 * 
 * ## Atomic Operations
 * 
 * It is important to note that only the methods
 * gtk_list_store_insert_with_values() and gtk_list_store_insert_with_valuesv()
 * are atomic, in the sense that the row is being appended to the store and the
 * values filled in in a single operation with regard to `GtkTreeModel` signaling.
 * In contrast, using e.g. gtk_list_store_append() and then gtk_list_store_set()
 * will first create a row, which triggers the `GtkTreeModel::row-inserted` signal
 * on `GtkListStore`. The row, however, is still empty, and any signal handler
 * connecting to `GtkTreeModel::row-inserted` on this particular store should be prepared
 * for the situation that the row might be empty. This is especially important
 * if you are wrapping the `GtkListStore` inside a `GtkTreeModel`Filter and are
 * using a `GtkTreeModel`FilterVisibleFunc. Using any of the non-atomic operations
 * to append rows to the `GtkListStore` will cause the
 * `GtkTreeModel`FilterVisibleFunc to be visited with an empty row first; the
 * function must be prepared for that.
 * 
 * ## GtkListStore as GtkBuildable
 * 
 * The GtkListStore implementation of the [iface@Gtk.Buildable] interface allows
 * to specify the model columns with a `<columns>` element that may contain
 * multiple `<column>` elements, each specifying one model column. The “type”
 * attribute specifies the data type for the column.
 * 
 * Additionally, it is possible to specify content for the list store
 * in the UI definition, with the `<data>` element. It can contain multiple
 * `<row>` elements, each specifying to content for one row of the list model.
 * Inside a `<row>`, the `<col>` elements specify the content for individual cells.
 * 
 * Note that it is probably more common to define your models in the code,
 * and one might consider it a layering violation to specify the content of
 * a list store in a UI definition, data, not presentation, and common wisdom
 * is to separate the two, as far as possible.
 * 
 * An example of a UI Definition fragment for a list store:
 * 
 * ```xml
 * <object class="GtkListStore">
 *   <columns>
 *     <column type="gchararray"/>
 *     <column type="gchararray"/>
 *     <column type="gint"/>
 *   </columns>
 *   <data>
 *     <row>
 *       <col id="0">John</col>
 *       <col id="1">Doe</col>
 *       <col id="2">25</col>
 *     </row>
 *     <row>
 *       <col id="0">Johan</col>
 *       <col id="1">Dahlin</col>
 *       <col id="2">50</col>
 *     </row>
 *   </data>
 * </object>
 * ```
 *
 */
@interface OGTKListStore : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initvWithNcolumns:(int)ncolumns types:(GType*)types;

/**
 * Methods
 */

- (GtkListStore*)castedGObject;

/**
 * Appends a new row to @list_store.  @iter will be changed to point to this new
 * row.  The row will be empty after this function is called.  To fill in
 * values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the appended row
 */
- (void)append:(GtkTreeIter*)iter;

/**
 * Removes all rows from the list store.
 *
 */
- (void)clear;

/**
 * Creates a new row at @position.  @iter will be changed to point to this new
 * row.  If @position is -1 or is larger than the number of rows on the list,
 * then the new row will be appended to the list. The row will be empty after
 * this function is called.  To fill in values, you need to call
 * gtk_list_store_set() or gtk_list_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the new row
 * @param position position to insert the new row, or -1 for last
 */
- (void)insertWithIter:(GtkTreeIter*)iter position:(int)position;

/**
 * Inserts a new row after @sibling. If @sibling is %NULL, then the row will be
 * prepended to the beginning of the list. @iter will be changed to point to
 * this new row. The row will be empty after this function is called. To fill
 * in values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the new row
 * @param sibling A valid `GtkTreeIter`
 */
- (void)insertAfterWithIter:(GtkTreeIter*)iter sibling:(GtkTreeIter*)sibling;

/**
 * Inserts a new row before @sibling. If @sibling is %NULL, then the row will
 * be appended to the end of the list. @iter will be changed to point to this
 * new row. The row will be empty after this function is called. To fill in
 * values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the new row
 * @param sibling A valid `GtkTreeIter`
 */
- (void)insertBeforeWithIter:(GtkTreeIter*)iter sibling:(GtkTreeIter*)sibling;

/**
 * A variant of gtk_list_store_insert_with_values() which
 * takes the columns and values as two arrays, instead of
 * varargs.
 * 
 * This function is mainly intended for language-bindings.
 *
 * @param iter An unset `GtkTreeIter` to set to the new row
 * @param position position to insert the new row, or -1 for last
 * @param columns an array of column numbers
 * @param values an array of GValues
 * @param nvalues the length of the @columns and @values arrays
 */
- (void)insertWithValuesvWithIter:(GtkTreeIter*)iter position:(int)position columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues;

/**
 * Checks if the given iter is a valid iter for this `GtkListStore`.
 * 
 * This function is slow. Only use it for debugging and/or testing
 * purposes.
 *
 * @param iter the iterator to check
 * @return %TRUE if the iter is valid, %FALSE if the iter is invalid.
 */
- (bool)iterIsValid:(GtkTreeIter*)iter;

/**
 * Moves @iter in @store to the position after @position. Note that this
 * function only works with unsorted stores. If @position is %NULL, @iter
 * will be moved to the start of the list.
 *
 * @param iter A `GtkTreeIter`
 * @param position A `GtkTreeIter`
 */
- (void)moveAfterWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position;

/**
 * Moves @iter in @store to the position before @position. Note that this
 * function only works with unsorted stores. If @position is %NULL, @iter
 * will be moved to the end of the list.
 *
 * @param iter A `GtkTreeIter`
 * @param position A `GtkTreeIter`
 */
- (void)moveBeforeWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position;

/**
 * Prepends a new row to @list_store. @iter will be changed to point to this new
 * row. The row will be empty after this function is called. To fill in
 * values, you need to call gtk_list_store_set() or gtk_list_store_set_value().
 *
 * @param iter An unset `GtkTreeIter` to set to the prepend row
 */
- (void)prepend:(GtkTreeIter*)iter;

/**
 * Removes the given row from the list store.  After being removed,
 * @iter is set to be the next valid row, or invalidated if it pointed
 * to the last row in @list_store.
 *
 * @param iter A valid `GtkTreeIter`
 * @return %TRUE if @iter is valid, %FALSE if not.
 */
- (bool)remove:(GtkTreeIter*)iter;

/**
 * Reorders @store to follow the order indicated by @new_order. Note that
 * this function only works with unsorted stores.
 *
 * @param newOrder an array of integers mapping the new
 *   position of each child to its old position before the re-ordering,
 *   i.e. @new_order`[newpos] = oldpos`. It must have
 *   exactly as many items as the list store’s length.
 */
- (void)reorder:(int*)newOrder;

/**
 * Sets the types of the columns of a list store.
 * 
 * This function is meant primarily for objects that inherit
 * from `GtkListStore`, and should only be used when constructing
 * a new instance.
 * 
 * This function cannot be called after a row has been added, or
 * a method on the `GtkTreeModel` interface is called.
 *
 * @param ncolumns Number of columns for the list store
 * @param types An array length n of `GType`s
 */
- (void)setColumnTypesWithNcolumns:(int)ncolumns types:(GType*)types;

/**
 * See gtk_list_store_set(); this version takes a va_list for use by language
 * bindings.
 *
 * @param iter A valid `GtkTreeIter` for the row being modified
 * @param varArgs va_list of column/value pairs
 */
- (void)setValistWithIter:(GtkTreeIter*)iter varArgs:(va_list)varArgs;

/**
 * Sets the data in the cell specified by @iter and @column.
 * The type of @value must be convertible to the type of the
 * column.
 *
 * @param iter A valid `GtkTreeIter` for the row being modified
 * @param column column number to modify
 * @param value new value for the cell
 */
- (void)setValueWithIter:(GtkTreeIter*)iter column:(int)column value:(GValue*)value;

/**
 * A variant of gtk_list_store_set_valist() which
 * takes the columns and values as two arrays, instead of
 * varargs. This function is mainly intended for
 * language-bindings and in case the number of columns to
 * change is not known until run-time.
 *
 * @param iter A valid `GtkTreeIter` for the row being modified
 * @param columns an array of column numbers
 * @param values an array of GValues
 * @param nvalues the length of the @columns and @values arrays
 */
- (void)setValuesvWithIter:(GtkTreeIter*)iter columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues;

/**
 * Swaps @a and @b in @store. Note that this function only works with
 * unsorted stores.
 *
 * @param a A `GtkTreeIter`
 * @param b Another `GtkTreeIter`
 */
- (void)swapWithA:(GtkTreeIter*)a b:(GtkTreeIter*)b;

@end