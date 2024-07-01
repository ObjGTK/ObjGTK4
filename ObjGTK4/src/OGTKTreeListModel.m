/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeListModel.h"

#import "OGTKTreeListRow.h"

@implementation OGTKTreeListModel

- (instancetype)initWithRoot:(GListModel*)root passthrough:(bool)passthrough autoexpand:(bool)autoexpand createFunc:(GtkTreeListModelCreateModelFunc)createFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkTreeListModel* gobjectValue = GTK_TREE_LIST_MODEL(gtk_tree_list_model_new(root, passthrough, autoexpand, createFunc, userData, userDestroy));

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

- (GtkTreeListModel*)castedGObject
{
	return GTK_TREE_LIST_MODEL([self gObject]);
}

- (bool)autoexpand
{
	bool returnValue = gtk_tree_list_model_get_autoexpand([self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)childRow:(guint)position
{
	GtkTreeListRow* gobjectValue = GTK_TREE_LIST_ROW(gtk_tree_list_model_get_child_row([self castedGObject], position));

	OGTKTreeListRow* returnValue = [OGTKTreeListRow withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_tree_list_model_get_model([self castedGObject]);

	return returnValue;
}

- (bool)passthrough
{
	bool returnValue = gtk_tree_list_model_get_passthrough([self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)row:(guint)position
{
	GtkTreeListRow* gobjectValue = GTK_TREE_LIST_ROW(gtk_tree_list_model_get_row([self castedGObject], position));

	OGTKTreeListRow* returnValue = [OGTKTreeListRow withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setAutoexpand:(bool)autoexpand
{
	gtk_tree_list_model_set_autoexpand([self castedGObject], autoexpand);
}


@end