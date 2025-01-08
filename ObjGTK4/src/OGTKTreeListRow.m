/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeListRow.h"

@implementation OGTKTreeListRow

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_LIST_ROW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkTreeListRow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkTreeListRow, GtkTreeListRow);
}

- (OGTKTreeListRow*)childRow:(guint)position
{
	GtkTreeListRow* gobjectValue = gtk_tree_list_row_get_child_row([self castedGObject], position);

	OGTKTreeListRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GListModel*)children
{
	GListModel* returnValue = (GListModel*)gtk_tree_list_row_get_children([self castedGObject]);

	return returnValue;
}

- (guint)depth
{
	guint returnValue = (guint)gtk_tree_list_row_get_depth([self castedGObject]);

	return returnValue;
}

- (bool)expanded
{
	bool returnValue = (bool)gtk_tree_list_row_get_expanded([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = (gpointer)gtk_tree_list_row_get_item([self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)parent
{
	GtkTreeListRow* gobjectValue = gtk_tree_list_row_get_parent([self castedGObject]);

	OGTKTreeListRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (guint)position
{
	guint returnValue = (guint)gtk_tree_list_row_get_position([self castedGObject]);

	return returnValue;
}

- (bool)isExpandable
{
	bool returnValue = (bool)gtk_tree_list_row_is_expandable([self castedGObject]);

	return returnValue;
}

- (void)setExpanded:(bool)expanded
{
	gtk_tree_list_row_set_expanded([self castedGObject], expanded);
}


@end