/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListStore.h"

@implementation OGTKListStore

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_STORE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LIST_STORE);
	return gObjectClass;
}

+ (instancetype)listStorevWithNcolumns:(int)ncolumns types:(GType*)types
{
	GtkListStore* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_list_store_newv(ncolumns, types), GTK_TYPE_LIST_STORE, GtkListStore);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKListStore* wrapperObject;
	@try {
		wrapperObject = [[OGTKListStore alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkListStore*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LIST_STORE, GtkListStore);
}

- (void)appendWithIter:(GtkTreeIter*)iter
{
	gtk_list_store_append((GtkListStore*)[self castedGObject], iter);
}

- (void)clear
{
	gtk_list_store_clear((GtkListStore*)[self castedGObject]);
}

- (void)insertWithIter:(GtkTreeIter*)iter position:(int)position
{
	gtk_list_store_insert((GtkListStore*)[self castedGObject], iter, position);
}

- (void)insertAfterWithIter:(GtkTreeIter*)iter sibling:(GtkTreeIter*)sibling
{
	gtk_list_store_insert_after((GtkListStore*)[self castedGObject], iter, sibling);
}

- (void)insertBeforeWithIter:(GtkTreeIter*)iter sibling:(GtkTreeIter*)sibling
{
	gtk_list_store_insert_before((GtkListStore*)[self castedGObject], iter, sibling);
}

- (void)insertWithValuesvWithIter:(GtkTreeIter*)iter position:(int)position columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues
{
	gtk_list_store_insert_with_valuesv((GtkListStore*)[self castedGObject], iter, position, columns, values, nvalues);
}

- (bool)iterIsValidWithIter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_list_store_iter_is_valid((GtkListStore*)[self castedGObject], iter);

	return returnValue;
}

- (void)moveAfterWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position
{
	gtk_list_store_move_after((GtkListStore*)[self castedGObject], iter, position);
}

- (void)moveBeforeWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position
{
	gtk_list_store_move_before((GtkListStore*)[self castedGObject], iter, position);
}

- (void)prependWithIter:(GtkTreeIter*)iter
{
	gtk_list_store_prepend((GtkListStore*)[self castedGObject], iter);
}

- (bool)removeWithIter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_list_store_remove((GtkListStore*)[self castedGObject], iter);

	return returnValue;
}

- (void)reorderWithNewOrder:(int*)newOrder
{
	gtk_list_store_reorder((GtkListStore*)[self castedGObject], newOrder);
}

- (void)setColumnTypesWithNcolumns:(int)ncolumns types:(GType*)types
{
	gtk_list_store_set_column_types((GtkListStore*)[self castedGObject], ncolumns, types);
}

- (void)setValistWithIter:(GtkTreeIter*)iter varArgs:(va_list)varArgs
{
	gtk_list_store_set_valist((GtkListStore*)[self castedGObject], iter, varArgs);
}

- (void)setValueWithIter:(GtkTreeIter*)iter column:(int)column value:(GValue*)value
{
	gtk_list_store_set_value((GtkListStore*)[self castedGObject], iter, column, value);
}

- (void)setValuesvWithIter:(GtkTreeIter*)iter columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues
{
	gtk_list_store_set_valuesv((GtkListStore*)[self castedGObject], iter, columns, values, nvalues);
}

- (void)swap:(GtkTreeIter*)a b:(GtkTreeIter*)b
{
	gtk_list_store_swap((GtkListStore*)[self castedGObject], a, b);
}


@end