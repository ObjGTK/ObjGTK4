/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeModelFilter.h"

@implementation OGTKTreeModelFilter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_MODEL_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TREE_MODEL_FILTER);
	return gObjectClass;
}

- (GtkTreeModelFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TREE_MODEL_FILTER, GtkTreeModelFilter);
}

- (void)clearCache
{
	gtk_tree_model_filter_clear_cache((GtkTreeModelFilter*)[self castedGObject]);
}

- (bool)convertChildIterToIterWithFilterIter:(GtkTreeIter*)filterIter childIter:(GtkTreeIter*)childIter
{
	bool returnValue = (bool)gtk_tree_model_filter_convert_child_iter_to_iter((GtkTreeModelFilter*)[self castedGObject], filterIter, childIter);

	return returnValue;
}

- (GtkTreePath*)convertChildPathToPath:(GtkTreePath*)childPath
{
	GtkTreePath* returnValue = (GtkTreePath*)gtk_tree_model_filter_convert_child_path_to_path((GtkTreeModelFilter*)[self castedGObject], childPath);

	return returnValue;
}

- (void)convertIterToChildIter:(GtkTreeIter*)childIter filterIter:(GtkTreeIter*)filterIter
{
	gtk_tree_model_filter_convert_iter_to_child_iter((GtkTreeModelFilter*)[self castedGObject], childIter, filterIter);
}

- (GtkTreePath*)convertPathToChildPathWithFilterPath:(GtkTreePath*)filterPath
{
	GtkTreePath* returnValue = (GtkTreePath*)gtk_tree_model_filter_convert_path_to_child_path((GtkTreeModelFilter*)[self castedGObject], filterPath);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = (GtkTreeModel*)gtk_tree_model_filter_get_model((GtkTreeModelFilter*)[self castedGObject]);

	return returnValue;
}

- (void)refilter
{
	gtk_tree_model_filter_refilter((GtkTreeModelFilter*)[self castedGObject]);
}

- (void)setModifyFuncWithNcolumns:(int)ncolumns types:(GType*)types func:(GtkTreeModelFilterModifyFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_tree_model_filter_set_modify_func((GtkTreeModelFilter*)[self castedGObject], ncolumns, types, func, data, destroy);
}

- (void)setVisibleColumn:(int)column
{
	gtk_tree_model_filter_set_visible_column((GtkTreeModelFilter*)[self castedGObject], column);
}

- (void)setVisibleFunc:(GtkTreeModelFilterVisibleFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_tree_model_filter_set_visible_func((GtkTreeModelFilter*)[self castedGObject], func, data, destroy);
}


@end