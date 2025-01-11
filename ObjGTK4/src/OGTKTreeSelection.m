/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeSelection.h"

#import "OGTKTreeView.h"

@implementation OGTKTreeSelection

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_SELECTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkTreeSelection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkTreeSelection, GtkTreeSelection);
}

- (int)countSelectedRows
{
	int returnValue = (int)gtk_tree_selection_count_selected_rows([self castedGObject]);

	return returnValue;
}

- (GtkSelectionMode)mode
{
	GtkSelectionMode returnValue = (GtkSelectionMode)gtk_tree_selection_get_mode([self castedGObject]);

	return returnValue;
}

- (GtkTreeSelectionFunc)selectFunction
{
	GtkTreeSelectionFunc returnValue = (GtkTreeSelectionFunc)gtk_tree_selection_get_select_function([self castedGObject]);

	return returnValue;
}

- (bool)selectedWithModel:(GtkTreeModel**)model iter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_tree_selection_get_selected([self castedGObject], model, iter);

	return returnValue;
}

- (GList*)selectedRows:(GtkTreeModel**)model
{
	GList* returnValue = (GList*)gtk_tree_selection_get_selected_rows([self castedGObject], model);

	return returnValue;
}

- (OGTKTreeView*)treeView
{
	GtkTreeView* gobjectValue = gtk_tree_selection_get_tree_view([self castedGObject]);

	OGTKTreeView* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (gpointer)userData
{
	gpointer returnValue = (gpointer)gtk_tree_selection_get_user_data([self castedGObject]);

	return returnValue;
}

- (bool)iterIsSelected:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_tree_selection_iter_is_selected([self castedGObject], iter);

	return returnValue;
}

- (bool)pathIsSelected:(GtkTreePath*)path
{
	bool returnValue = (bool)gtk_tree_selection_path_is_selected([self castedGObject], path);

	return returnValue;
}

- (void)selectAll
{
	gtk_tree_selection_select_all([self castedGObject]);
}

- (void)selectIter:(GtkTreeIter*)iter
{
	gtk_tree_selection_select_iter([self castedGObject], iter);
}

- (void)selectPath:(GtkTreePath*)path
{
	gtk_tree_selection_select_path([self castedGObject], path);
}

- (void)selectRangeWithStartPath:(GtkTreePath*)startPath endPath:(GtkTreePath*)endPath
{
	gtk_tree_selection_select_range([self castedGObject], startPath, endPath);
}

- (void)selectedForeachWithFunc:(GtkTreeSelectionForeachFunc)func data:(gpointer)data
{
	gtk_tree_selection_selected_foreach([self castedGObject], func, data);
}

- (void)setMode:(GtkSelectionMode)type
{
	gtk_tree_selection_set_mode([self castedGObject], type);
}

- (void)setSelectFunctionWithFunc:(GtkTreeSelectionFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_tree_selection_set_select_function([self castedGObject], func, data, destroy);
}

- (void)unselectAll
{
	gtk_tree_selection_unselect_all([self castedGObject]);
}

- (void)unselectIter:(GtkTreeIter*)iter
{
	gtk_tree_selection_unselect_iter([self castedGObject], iter);
}

- (void)unselectPath:(GtkTreePath*)path
{
	gtk_tree_selection_unselect_path([self castedGObject], path);
}

- (void)unselectRangeWithStartPath:(GtkTreePath*)startPath endPath:(GtkTreePath*)endPath
{
	gtk_tree_selection_unselect_range([self castedGObject], startPath, endPath);
}


@end