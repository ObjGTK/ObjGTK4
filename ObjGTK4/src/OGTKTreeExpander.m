/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeExpander.h"

#import "OGTKTreeListRow.h"

@implementation OGTKTreeExpander

- (instancetype)init
{
	GtkTreeExpander* gobjectValue = GTK_TREE_EXPANDER(gtk_tree_expander_new());

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

- (GtkTreeExpander*)castedGObject
{
	return GTK_TREE_EXPANDER([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_tree_expander_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)indentForIcon
{
	bool returnValue = gtk_tree_expander_get_indent_for_icon([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = gtk_tree_expander_get_item([self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)listRow
{
	GtkTreeListRow* gobjectValue = GTK_TREE_LIST_ROW(gtk_tree_expander_get_list_row([self castedGObject]));

	OGTKTreeListRow* returnValue = [OGTKTreeListRow withGObject:gobjectValue];
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_tree_expander_set_child([self castedGObject], [child castedGObject]);
}

- (void)setIndentForIcon:(bool)indentForIcon
{
	gtk_tree_expander_set_indent_for_icon([self castedGObject], indentForIcon);
}

- (void)setListRow:(OGTKTreeListRow*)listRow
{
	gtk_tree_expander_set_list_row([self castedGObject], [listRow castedGObject]);
}


@end