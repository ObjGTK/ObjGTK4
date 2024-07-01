/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKTreeView;

/**
 * The selection object for GtkTreeView
 * 
 * The `GtkTreeSelection` object is a helper object to manage the selection
 * for a `GtkTreeView` widget.  The `GtkTreeSelection` object is
 * automatically created when a new `GtkTreeView` widget is created, and
 * cannot exist independently of this widget.  The primary reason the
 * `GtkTreeSelection` objects exists is for cleanliness of code and API.
 * That is, there is no conceptual reason all these functions could not be
 * methods on the `GtkTreeView` widget instead of a separate function.
 * 
 * The `GtkTreeSelection` object is gotten from a `GtkTreeView` by calling
 * gtk_tree_view_get_selection().  It can be manipulated to check the
 * selection status of the tree, as well as select and deselect individual
 * rows.  Selection is done completely view side.  As a result, multiple
 * views of the same model can have completely different selections.
 * Additionally, you cannot change the selection of a row on the model that
 * is not currently displayed by the view without expanding its parents
 * first.
 * 
 * One of the important things to remember when monitoring the selection of
 * a view is that the `GtkTreeSelection`::changed signal is mostly a hint.
 * That is, it may only emit one signal when a range of rows is selected.
 * Additionally, it may on occasion emit a `GtkTreeSelection`::changed signal
 * when nothing has happened (mostly as a result of programmers calling
 * select_row on an already selected row).
 *
 */
@interface OGTKTreeSelection : OGObject
{

}


/**
 * Methods
 */

- (GtkTreeSelection*)castedGObject;

/**
 * Returns the number of rows that have been selected in @tree.
 *
 * @return The number of rows selected.
 */
- (int)countSelectedRows;

/**
 * Gets the selection mode for @selection. See
 * gtk_tree_selection_set_mode().
 *
 * @return the current selection mode
 */
- (GtkSelectionMode)mode;

/**
 * Returns the current selection function.
 *
 * @return The function.
 */
- (GtkTreeSelectionFunc)selectFunction;

/**
 * Sets @iter to the currently selected node if @selection is set to
 * %GTK_SELECTION_SINGLE or %GTK_SELECTION_BROWSE.  @iter may be NULL if you
 * just want to test if @selection has any selected nodes.  @model is filled
 * with the current model as a convenience.  This function will not work if you
 * use @selection is %GTK_SELECTION_MULTIPLE.
 *
 * @param model A pointer to set to the `GtkTreeModel`
 * @param iter The `GtkTreeIter`
 * @return TRUE, if there is a selected node.
 */
- (bool)selectedWithModel:(GtkTreeModel**)model iter:(GtkTreeIter*)iter;

/**
 * Creates a list of path of all selected rows. Additionally, if you are
 * planning on modifying the model after calling this function, you may
 * want to convert the returned list into a list of `GtkTreeRowReference`s.
 * To do this, you can use gtk_tree_row_reference_new().
 * 
 * To free the return value, use:
 * |[<!-- language="C" -->
 * g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
 * ]|
 *
 * @param model A pointer to set to the `GtkTreeModel`
 * @return A `GList` containing a `GtkTreePath` for each selected row.
 */
- (GList*)selectedRows:(GtkTreeModel**)model;

/**
 * Returns the tree view associated with @selection.
 *
 * @return A `GtkTreeView`
 */
- (OGTKTreeView*)treeView;

/**
 * Returns the user data for the selection function.
 *
 * @return The user data.
 */
- (gpointer)userData;

/**
 * Returns %TRUE if the row at @iter is currently selected.
 *
 * @param iter A valid `GtkTreeIter`
 * @return %TRUE, if @iter is selected
 */
- (bool)iterIsSelected:(GtkTreeIter*)iter;

/**
 * Returns %TRUE if the row pointed to by @path is currently selected.  If @path
 * does not point to a valid location, %FALSE is returned
 *
 * @param path A `GtkTreePath` to check selection on.
 * @return %TRUE if @path is selected.
 */
- (bool)pathIsSelected:(GtkTreePath*)path;

/**
 * Selects all the nodes. @selection must be set to %GTK_SELECTION_MULTIPLE
 * mode.
 *
 */
- (void)selectAll;

/**
 * Selects the specified iterator.
 *
 * @param iter The `GtkTreeIter` to be selected.
 */
- (void)selectIter:(GtkTreeIter*)iter;

/**
 * Select the row at @path.
 *
 * @param path The `GtkTreePath` to be selected.
 */
- (void)selectPath:(GtkTreePath*)path;

/**
 * Selects a range of nodes, determined by @start_path and @end_path inclusive.
 * @selection must be set to %GTK_SELECTION_MULTIPLE mode.
 *
 * @param startPath The initial node of the range.
 * @param endPath The final node of the range.
 */
- (void)selectRangeWithStartPath:(GtkTreePath*)startPath endPath:(GtkTreePath*)endPath;

/**
 * Calls a function for each selected node. Note that you cannot modify
 * the tree or selection from within this function. As a result,
 * gtk_tree_selection_get_selected_rows() might be more useful.
 *
 * @param func The function to call for each selected node.
 * @param data user data to pass to the function.
 */
- (void)selectedForeachWithFunc:(GtkTreeSelectionForeachFunc)func data:(gpointer)data;

/**
 * Sets the selection mode of the @selection.  If the previous type was
 * %GTK_SELECTION_MULTIPLE, then the anchor is kept selected, if it was
 * previously selected.
 *
 * @param type The selection mode
 */
- (void)setMode:(GtkSelectionMode)type;

/**
 * Sets the selection function.
 * 
 * If set, this function is called before any node is selected or unselected,
 * giving some control over which nodes are selected. The select function
 * should return %TRUE if the state of the node may be toggled, and %FALSE
 * if the state of the node should be left unchanged.
 *
 * @param func The selection function. May be %NULL
 * @param data The selection function’s data. May be %NULL
 * @param destroy The destroy function for user data.  May be %NULL
 */
- (void)setSelectFunctionWithFunc:(GtkTreeSelectionFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy;

/**
 * Unselects all the nodes.
 *
 */
- (void)unselectAll;

/**
 * Unselects the specified iterator.
 *
 * @param iter The `GtkTreeIter` to be unselected.
 */
- (void)unselectIter:(GtkTreeIter*)iter;

/**
 * Unselects the row at @path.
 *
 * @param path The `GtkTreePath` to be unselected.
 */
- (void)unselectPath:(GtkTreePath*)path;

/**
 * Unselects a range of nodes, determined by @start_path and @end_path
 * inclusive.
 *
 * @param startPath The initial node of the range.
 * @param endPath The initial node of the range.
 */
- (void)unselectRangeWithStartPath:(GtkTreePath*)startPath endPath:(GtkTreePath*)endPath;

@end