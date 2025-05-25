/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeListRowSorter.h"

@implementation OGTKTreeListRowSorter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_LIST_ROW_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TREE_LIST_ROW_SORTER);
	return gObjectClass;
}

+ (instancetype)treeListRowSorterWithSorter:(OGTKSorter*)sorter
{
	GtkTreeListRowSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_list_row_sorter_new([sorter castedGObject]), GTK_TYPE_TREE_LIST_ROW_SORTER, GtkTreeListRowSorter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTreeListRowSorter* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeListRowSorter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTreeListRowSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TREE_LIST_ROW_SORTER, GtkTreeListRowSorter);
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = gtk_tree_list_row_sorter_get_sorter((GtkTreeListRowSorter*)[self castedGObject]);

	OGTKSorter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setSorter:(OGTKSorter*)sorter
{
	gtk_tree_list_row_sorter_set_sorter((GtkTreeListRowSorter*)[self castedGObject], [sorter castedGObject]);
}


@end