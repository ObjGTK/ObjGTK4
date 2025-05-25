/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNumericSorter.h"

@implementation OGTKNumericSorter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NUMERIC_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_NUMERIC_SORTER);
	return gObjectClass;
}

+ (instancetype)numericSorterWithExpression:(GtkExpression*)expression
{
	GtkNumericSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_numeric_sorter_new(expression), GTK_TYPE_NUMERIC_SORTER, GtkNumericSorter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKNumericSorter* wrapperObject;
	@try {
		wrapperObject = [[OGTKNumericSorter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkNumericSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_NUMERIC_SORTER, GtkNumericSorter);
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_numeric_sorter_get_expression((GtkNumericSorter*)[self castedGObject]);

	return returnValue;
}

- (GtkSortType)sortOrder
{
	GtkSortType returnValue = (GtkSortType)gtk_numeric_sorter_get_sort_order((GtkNumericSorter*)[self castedGObject]);

	return returnValue;
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_numeric_sorter_set_expression((GtkNumericSorter*)[self castedGObject], expression);
}

- (void)setSortOrder:(GtkSortType)sortOrder
{
	gtk_numeric_sorter_set_sort_order((GtkNumericSorter*)[self castedGObject], sortOrder);
}


@end