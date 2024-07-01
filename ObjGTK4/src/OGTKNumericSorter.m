/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNumericSorter.h"

@implementation OGTKNumericSorter

- (instancetype)init:(GtkExpression*)expression
{
	GtkNumericSorter* gobjectValue = GTK_NUMERIC_SORTER(gtk_numeric_sorter_new(expression));

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

- (GtkNumericSorter*)castedGObject
{
	return GTK_NUMERIC_SORTER([self gObject]);
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = gtk_numeric_sorter_get_expression([self castedGObject]);

	return returnValue;
}

- (GtkSortType)sortOrder
{
	GtkSortType returnValue = gtk_numeric_sorter_get_sort_order([self castedGObject]);

	return returnValue;
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_numeric_sorter_set_expression([self castedGObject], expression);
}

- (void)setSortOrder:(GtkSortType)sortOrder
{
	gtk_numeric_sorter_set_sort_order([self castedGObject], sortOrder);
}


@end