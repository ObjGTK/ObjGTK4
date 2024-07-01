/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeModelSort.h"

@implementation OGTKTreeModelSort

- (instancetype)initWithModel:(GtkTreeModel*)childModel
{
	GtkTreeModelSort* gobjectValue = GTK_TREE_MODEL_SORT(gtk_tree_model_sort_new_with_model(childModel));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkTreeModelSort*)castedGObject
{
	return GTK_TREE_MODEL_SORT([self gObject]);
}

- (void)clearCache
{
	gtk_tree_model_sort_clear_cache([self castedGObject]);
}

- (bool)convertChildIterToIterWithSortIter:(GtkTreeIter*)sortIter childIter:(GtkTreeIter*)childIter
{
	bool returnValue = gtk_tree_model_sort_convert_child_iter_to_iter([self castedGObject], sortIter, childIter);

	return returnValue;
}

- (GtkTreePath*)convertChildPathToPath:(GtkTreePath*)childPath
{
	GtkTreePath* returnValue = gtk_tree_model_sort_convert_child_path_to_path([self castedGObject], childPath);

	return returnValue;
}

- (void)convertIterToChildIterWithChildIter:(GtkTreeIter*)childIter sortedIter:(GtkTreeIter*)sortedIter
{
	gtk_tree_model_sort_convert_iter_to_child_iter([self castedGObject], childIter, sortedIter);
}

- (GtkTreePath*)convertPathToChildPath:(GtkTreePath*)sortedPath
{
	GtkTreePath* returnValue = gtk_tree_model_sort_convert_path_to_child_path([self castedGObject], sortedPath);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = gtk_tree_model_sort_get_model([self castedGObject]);

	return returnValue;
}

- (bool)iterIsValid:(GtkTreeIter*)iter
{
	bool returnValue = gtk_tree_model_sort_iter_is_valid([self castedGObject], iter);

	return returnValue;
}

- (void)resetDefaultSortFunc
{
	gtk_tree_model_sort_reset_default_sort_func([self castedGObject]);
}


@end