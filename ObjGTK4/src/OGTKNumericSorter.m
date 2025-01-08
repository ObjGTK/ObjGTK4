/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNumericSorter.h"

@implementation OGTKNumericSorter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NUMERIC_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithExpression:(GtkExpression*)expression
{
	GtkNumericSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_numeric_sorter_new(expression), GtkNumericSorter, GtkNumericSorter);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkNumericSorter, GtkNumericSorter);
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_numeric_sorter_get_expression([self castedGObject]);

	return returnValue;
}

- (GtkSortType)sortOrder
{
	GtkSortType returnValue = (GtkSortType)gtk_numeric_sorter_get_sort_order([self castedGObject]);

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