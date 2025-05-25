/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeModelSort.h"

@implementation OGTKTreeModelSort

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_MODEL_SORT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TREE_MODEL_SORT);
	return gObjectClass;
}

+ (instancetype)treeModelSortWithModelWithChildModel:(GtkTreeModel*)childModel
{
	GtkTreeModelSort* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_model_sort_new_with_model(childModel), GTK_TYPE_TREE_MODEL_SORT, GtkTreeModelSort);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTreeModelSort* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeModelSort alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTreeModelSort*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TREE_MODEL_SORT, GtkTreeModelSort);
}

- (void)clearCache
{
	gtk_tree_model_sort_clear_cache((GtkTreeModelSort*)[self castedGObject]);
}

- (bool)convertChildIterToIterWithSortIter:(GtkTreeIter*)sortIter childIter:(GtkTreeIter*)childIter
{
	bool returnValue = (bool)gtk_tree_model_sort_convert_child_iter_to_iter((GtkTreeModelSort*)[self castedGObject], sortIter, childIter);

	return returnValue;
}

- (GtkTreePath*)convertChildPathToPath:(GtkTreePath*)childPath
{
	GtkTreePath* returnValue = (GtkTreePath*)gtk_tree_model_sort_convert_child_path_to_path((GtkTreeModelSort*)[self castedGObject], childPath);

	return returnValue;
}

- (void)convertIterToChildIter:(GtkTreeIter*)childIter sortedIter:(GtkTreeIter*)sortedIter
{
	gtk_tree_model_sort_convert_iter_to_child_iter((GtkTreeModelSort*)[self castedGObject], childIter, sortedIter);
}

- (GtkTreePath*)convertPathToChildPathWithSortedPath:(GtkTreePath*)sortedPath
{
	GtkTreePath* returnValue = (GtkTreePath*)gtk_tree_model_sort_convert_path_to_child_path((GtkTreeModelSort*)[self castedGObject], sortedPath);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = (GtkTreeModel*)gtk_tree_model_sort_get_model((GtkTreeModelSort*)[self castedGObject]);

	return returnValue;
}

- (bool)iterIsValidWithIter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_tree_model_sort_iter_is_valid((GtkTreeModelSort*)[self castedGObject], iter);

	return returnValue;
}

- (void)resetDefaultSortFunc
{
	gtk_tree_model_sort_reset_default_sort_func((GtkTreeModelSort*)[self castedGObject]);
}


@end