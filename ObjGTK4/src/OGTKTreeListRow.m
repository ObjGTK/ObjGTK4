/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeListRow.h"

@implementation OGTKTreeListRow

- (GtkTreeListRow*)castedGObject
{
	return GTK_TREE_LIST_ROW([self gObject]);
}

- (OGTKTreeListRow*)childRow:(guint)position
{
	GtkTreeListRow* gobjectValue = GTK_TREE_LIST_ROW(gtk_tree_list_row_get_child_row([self castedGObject], position));

	OGTKTreeListRow* returnValue = [OGTKTreeListRow withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GListModel*)children
{
	GListModel* returnValue = gtk_tree_list_row_get_children([self castedGObject]);

	return returnValue;
}

- (guint)depth
{
	guint returnValue = gtk_tree_list_row_get_depth([self castedGObject]);

	return returnValue;
}

- (bool)expanded
{
	bool returnValue = gtk_tree_list_row_get_expanded([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = gtk_tree_list_row_get_item([self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)parent
{
	GtkTreeListRow* gobjectValue = GTK_TREE_LIST_ROW(gtk_tree_list_row_get_parent([self castedGObject]));

	OGTKTreeListRow* returnValue = [OGTKTreeListRow withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (guint)position
{
	guint returnValue = gtk_tree_list_row_get_position([self castedGObject]);

	return returnValue;
}

- (bool)isExpandable
{
	bool returnValue = gtk_tree_list_row_is_expandable([self castedGObject]);

	return returnValue;
}

- (void)setExpanded:(bool)expanded
{
	gtk_tree_list_row_set_expanded([self castedGObject], expanded);
}


@end