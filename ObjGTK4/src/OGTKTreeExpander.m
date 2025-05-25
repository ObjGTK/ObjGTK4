/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeExpander.h"

#import "OGTKTreeListRow.h"

@implementation OGTKTreeExpander

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_EXPANDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TREE_EXPANDER);
	return gObjectClass;
}

+ (instancetype)treeExpander
{
	GtkTreeExpander* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_expander_new(), GTK_TYPE_TREE_EXPANDER, GtkTreeExpander);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKTreeExpander* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeExpander alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTreeExpander*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TREE_EXPANDER, GtkTreeExpander);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_tree_expander_get_child((GtkTreeExpander*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hideExpander
{
	bool returnValue = (bool)gtk_tree_expander_get_hide_expander((GtkTreeExpander*)[self castedGObject]);

	return returnValue;
}

- (bool)indentForDepth
{
	bool returnValue = (bool)gtk_tree_expander_get_indent_for_depth((GtkTreeExpander*)[self castedGObject]);

	return returnValue;
}

- (bool)indentForIcon
{
	bool returnValue = (bool)gtk_tree_expander_get_indent_for_icon((GtkTreeExpander*)[self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = (gpointer)gtk_tree_expander_get_item((GtkTreeExpander*)[self castedGObject]);

	return returnValue;
}

- (OGTKTreeListRow*)listRow
{
	GtkTreeListRow* gobjectValue = gtk_tree_expander_get_list_row((GtkTreeExpander*)[self castedGObject]);

	OGTKTreeListRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_tree_expander_set_child((GtkTreeExpander*)[self castedGObject], [child castedGObject]);
}

- (void)setHideExpander:(bool)hideExpander
{
	gtk_tree_expander_set_hide_expander((GtkTreeExpander*)[self castedGObject], hideExpander);
}

- (void)setIndentForDepth:(bool)indentForDepth
{
	gtk_tree_expander_set_indent_for_depth((GtkTreeExpander*)[self castedGObject], indentForDepth);
}

- (void)setIndentForIcon:(bool)indentForIcon
{
	gtk_tree_expander_set_indent_for_icon((GtkTreeExpander*)[self castedGObject], indentForIcon);
}

- (void)setListRow:(OGTKTreeListRow*)listRow
{
	gtk_tree_expander_set_list_row((GtkTreeExpander*)[self castedGObject], [listRow castedGObject]);
}


@end