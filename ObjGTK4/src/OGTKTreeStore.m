/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeStore.h"

@implementation OGTKTreeStore

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_STORE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)treeStorevWithNcolumns:(int)ncolumns types:(GType*)types
{
	GtkTreeStore* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_store_newv(ncolumns, types), GtkTreeStore, GtkTreeStore);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTreeStore* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeStore alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTreeStore*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkTreeStore, GtkTreeStore);
}

- (void)appendWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent
{
	gtk_tree_store_append([self castedGObject], iter, parent);
}

- (void)clear
{
	gtk_tree_store_clear([self castedGObject]);
}

- (void)insertWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent position:(int)position
{
	gtk_tree_store_insert([self castedGObject], iter, parent, position);
}

- (void)insertAfterWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent sibling:(GtkTreeIter*)sibling
{
	gtk_tree_store_insert_after([self castedGObject], iter, parent, sibling);
}

- (void)insertBeforeWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent sibling:(GtkTreeIter*)sibling
{
	gtk_tree_store_insert_before([self castedGObject], iter, parent, sibling);
}

- (void)insertWithValuesvWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent position:(int)position columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues
{
	gtk_tree_store_insert_with_valuesv([self castedGObject], iter, parent, position, columns, values, nvalues);
}

- (bool)isAncestorWithIter:(GtkTreeIter*)iter descendant:(GtkTreeIter*)descendant
{
	bool returnValue = (bool)gtk_tree_store_is_ancestor([self castedGObject], iter, descendant);

	return returnValue;
}

- (int)iterDepthWithIter:(GtkTreeIter*)iter
{
	int returnValue = (int)gtk_tree_store_iter_depth([self castedGObject], iter);

	return returnValue;
}

- (bool)iterIsValidWithIter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_tree_store_iter_is_valid([self castedGObject], iter);

	return returnValue;
}

- (void)moveAfterWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position
{
	gtk_tree_store_move_after([self castedGObject], iter, position);
}

- (void)moveBeforeWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position
{
	gtk_tree_store_move_before([self castedGObject], iter, position);
}

- (void)prependWithIter:(GtkTreeIter*)iter parent:(GtkTreeIter*)parent
{
	gtk_tree_store_prepend([self castedGObject], iter, parent);
}

- (bool)removeWithIter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_tree_store_remove([self castedGObject], iter);

	return returnValue;
}

- (void)reorderWithParent:(GtkTreeIter*)parent newOrder:(int*)newOrder
{
	gtk_tree_store_reorder([self castedGObject], parent, newOrder);
}

- (void)setColumnTypesWithNcolumns:(int)ncolumns types:(GType*)types
{
	gtk_tree_store_set_column_types([self castedGObject], ncolumns, types);
}

- (void)setValistWithIter:(GtkTreeIter*)iter varArgs:(va_list)varArgs
{
	gtk_tree_store_set_valist([self castedGObject], iter, varArgs);
}

- (void)setValueWithIter:(GtkTreeIter*)iter column:(int)column value:(GValue*)value
{
	gtk_tree_store_set_value([self castedGObject], iter, column, value);
}

- (void)setValuesvWithIter:(GtkTreeIter*)iter columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues
{
	gtk_tree_store_set_valuesv([self castedGObject], iter, columns, values, nvalues);
}

- (void)swap:(GtkTreeIter*)a b:(GtkTreeIter*)b
{
	gtk_tree_store_swap([self castedGObject], a, b);
}


@end