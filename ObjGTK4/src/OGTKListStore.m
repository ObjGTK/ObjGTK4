/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListStore.h"

@implementation OGTKListStore

- (instancetype)initvWithNcolumns:(int)ncolumns types:(GType*)types
{
	GtkListStore* gobjectValue = GTK_LIST_STORE(gtk_list_store_newv(ncolumns, types));

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

- (GtkListStore*)castedGObject
{
	return GTK_LIST_STORE([self gObject]);
}

- (void)append:(GtkTreeIter*)iter
{
	gtk_list_store_append([self castedGObject], iter);
}

- (void)clear
{
	gtk_list_store_clear([self castedGObject]);
}

- (void)insertWithIter:(GtkTreeIter*)iter position:(int)position
{
	gtk_list_store_insert([self castedGObject], iter, position);
}

- (void)insertAfterWithIter:(GtkTreeIter*)iter sibling:(GtkTreeIter*)sibling
{
	gtk_list_store_insert_after([self castedGObject], iter, sibling);
}

- (void)insertBeforeWithIter:(GtkTreeIter*)iter sibling:(GtkTreeIter*)sibling
{
	gtk_list_store_insert_before([self castedGObject], iter, sibling);
}

- (void)insertWithValuesvWithIter:(GtkTreeIter*)iter position:(int)position columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues
{
	gtk_list_store_insert_with_valuesv([self castedGObject], iter, position, columns, values, nvalues);
}

- (bool)iterIsValid:(GtkTreeIter*)iter
{
	bool returnValue = gtk_list_store_iter_is_valid([self castedGObject], iter);

	return returnValue;
}

- (void)moveAfterWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position
{
	gtk_list_store_move_after([self castedGObject], iter, position);
}

- (void)moveBeforeWithIter:(GtkTreeIter*)iter position:(GtkTreeIter*)position
{
	gtk_list_store_move_before([self castedGObject], iter, position);
}

- (void)prepend:(GtkTreeIter*)iter
{
	gtk_list_store_prepend([self castedGObject], iter);
}

- (bool)remove:(GtkTreeIter*)iter
{
	bool returnValue = gtk_list_store_remove([self castedGObject], iter);

	return returnValue;
}

- (void)reorder:(int*)newOrder
{
	gtk_list_store_reorder([self castedGObject], newOrder);
}

- (void)setColumnTypesWithNcolumns:(int)ncolumns types:(GType*)types
{
	gtk_list_store_set_column_types([self castedGObject], ncolumns, types);
}

- (void)setValistWithIter:(GtkTreeIter*)iter varArgs:(va_list)varArgs
{
	gtk_list_store_set_valist([self castedGObject], iter, varArgs);
}

- (void)setValueWithIter:(GtkTreeIter*)iter column:(int)column value:(GValue*)value
{
	gtk_list_store_set_value([self castedGObject], iter, column, value);
}

- (void)setValuesvWithIter:(GtkTreeIter*)iter columns:(int*)columns values:(GValue*)values nvalues:(int)nvalues
{
	gtk_list_store_set_valuesv([self castedGObject], iter, columns, values, nvalues);
}

- (void)swapWithA:(GtkTreeIter*)a b:(GtkTreeIter*)b
{
	gtk_list_store_swap([self castedGObject], a, b);
}


@end