/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeListRowSorter.h"

@implementation OGTKTreeListRowSorter

- (instancetype)init:(OGTKSorter*)sorter
{
	GtkTreeListRowSorter* gobjectValue = GTK_TREE_LIST_ROW_SORTER(gtk_tree_list_row_sorter_new([sorter castedGObject]));

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

- (GtkTreeListRowSorter*)castedGObject
{
	return GTK_TREE_LIST_ROW_SORTER([self gObject]);
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = GTK_SORTER(gtk_tree_list_row_sorter_get_sorter([self castedGObject]));

	OGTKSorter* returnValue = [OGTKSorter withGObject:gobjectValue];
	return returnValue;
}

- (void)setSorter:(OGTKSorter*)sorter
{
	gtk_tree_list_row_sorter_set_sorter([self castedGObject], [sorter castedGObject]);
}


@end