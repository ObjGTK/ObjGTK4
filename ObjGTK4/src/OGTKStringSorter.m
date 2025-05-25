/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringSorter.h"

@implementation OGTKStringSorter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STRING_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_STRING_SORTER);
	return gObjectClass;
}

+ (instancetype)stringSorterWithExpression:(GtkExpression*)expression
{
	GtkStringSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_string_sorter_new(expression), GTK_TYPE_STRING_SORTER, GtkStringSorter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKStringSorter* wrapperObject;
	@try {
		wrapperObject = [[OGTKStringSorter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStringSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_STRING_SORTER, GtkStringSorter);
}

- (GtkCollation)collation
{
	GtkCollation returnValue = (GtkCollation)gtk_string_sorter_get_collation((GtkStringSorter*)[self castedGObject]);

	return returnValue;
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_string_sorter_get_expression((GtkStringSorter*)[self castedGObject]);

	return returnValue;
}

- (bool)ignoreCase
{
	bool returnValue = (bool)gtk_string_sorter_get_ignore_case((GtkStringSorter*)[self castedGObject]);

	return returnValue;
}

- (void)setCollation:(GtkCollation)collation
{
	gtk_string_sorter_set_collation((GtkStringSorter*)[self castedGObject], collation);
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_string_sorter_set_expression((GtkStringSorter*)[self castedGObject], expression);
}

- (void)setIgnoreCase:(bool)ignoreCase
{
	gtk_string_sorter_set_ignore_case((GtkStringSorter*)[self castedGObject], ignoreCase);
}


@end