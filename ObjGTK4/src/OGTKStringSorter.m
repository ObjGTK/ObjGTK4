/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringSorter.h"

@implementation OGTKStringSorter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STRING_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)stringSorter:(GtkExpression*)expression
{
	GtkStringSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_string_sorter_new(expression), GtkStringSorter, GtkStringSorter);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkStringSorter, GtkStringSorter);
}

- (GtkCollation)collation
{
	GtkCollation returnValue = (GtkCollation)gtk_string_sorter_get_collation([self castedGObject]);

	return returnValue;
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_string_sorter_get_expression([self castedGObject]);

	return returnValue;
}

- (bool)ignoreCase
{
	bool returnValue = (bool)gtk_string_sorter_get_ignore_case([self castedGObject]);

	return returnValue;
}

- (void)setCollation:(GtkCollation)collation
{
	gtk_string_sorter_set_collation([self castedGObject], collation);
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_string_sorter_set_expression([self castedGObject], expression);
}

- (void)setIgnoreCase:(bool)ignoreCase
{
	gtk_string_sorter_set_ignore_case([self castedGObject], ignoreCase);
}


@end