/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

/**
 * `GtkTreeListRowSorter` is a special-purpose sorter that will apply a given
 * sorter to the levels in a tree.
 * 
 * Here is an example for setting up a column view with a tree model and
 * a `GtkTreeListSorter`:
 * 
 * ```c
 * column_sorter = gtk_column_view_get_sorter (view);
 * sorter = gtk_tree_list_row_sorter_new (g_object_ref (column_sorter));
 * sort_model = gtk_sort_list_model_new (tree_model, sorter);
 * selection = gtk_single_selection_new (sort_model);
 * gtk_column_view_set_model (view, G_LIST_MODEL (selection));
 * ```
 *
 */
@interface OGTKTreeListRowSorter : OGTKSorter
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGTKSorter*)sorter;

/**
 * Methods
 */

- (GtkTreeListRowSorter*)castedGObject;

/**
 * Returns the sorter used by @self.
 *
 * @return the sorter used
 */
- (OGTKSorter*)sorter;

/**
 * Sets the sorter to use for items with the same parent.
 * 
 * This sorter will be passed the [property@Gtk.TreeListRow:item] of
 * the tree list rows passed to @self.
 *
 * @param sorter The sorter to use
 */
- (void)setSorter:(OGTKSorter*)sorter;

@end