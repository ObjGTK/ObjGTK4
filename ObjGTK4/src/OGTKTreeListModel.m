/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeListModel.h"

#import "OGTKTreeListRow.h"

@implementation OGTKTreeListModel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_LIST_MODEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TREE_LIST_MODEL);
	return gObjectClass;
}

+ (instancetype)treeListModelWithRoot:(GListModel*)root passthrough:(bool)passthrough autoexpand:(bool)autoexpand createFunc:(GtkTreeListModelCreateModelFunc)createFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkTreeListModel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_list_model_new(root, passthrough, autoexpand, createFunc, userData, userDestroy), GTK_TYPE_TREE_LIST_MODEL, GtkTreeListModel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTreeListModel* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeListModel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTreeListModel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TREE_LIST_MODEL, GtkTreeListModel);
}

- (bool)autoexpand
{
	bool returnValue = (bool)gtk_tree_list_model_get_autoexpand((GtkTreeListModel*)[self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)childRowWithPosition:(guint)position
{
	GtkTreeListRow* gobjectValue = gtk_tree_list_model_get_child_row((GtkTreeListModel*)[self castedGObject], position);

	OGTKTreeListRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_tree_list_model_get_model((GtkTreeListModel*)[self castedGObject]);

	return returnValue;
}

- (bool)passthrough
{
	bool returnValue = (bool)gtk_tree_list_model_get_passthrough((GtkTreeListModel*)[self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)rowWithPosition:(guint)position
{
	GtkTreeListRow* gobjectValue = gtk_tree_list_model_get_row((GtkTreeListModel*)[self castedGObject], position);

	OGTKTreeListRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setAutoexpand:(bool)autoexpand
{
	gtk_tree_list_model_set_autoexpand((GtkTreeListModel*)[self castedGObject], autoexpand);
}


@end