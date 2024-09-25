/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringSorter.h"

@implementation OGTKStringSorter

- (instancetype)init:(GtkExpression*)expression
{
	GtkStringSorter* gobjectValue = GTK_STRING_SORTER(gtk_string_sorter_new(expression));

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

- (GtkStringSorter*)castedGObject
{
	return GTK_STRING_SORTER([self gObject]);
}

- (GtkCollation)collation
{
	GtkCollation returnValue = gtk_string_sorter_get_collation([self castedGObject]);

	return returnValue;
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = gtk_string_sorter_get_expression([self castedGObject]);

	return returnValue;
}

- (bool)ignoreCase
{
	bool returnValue = gtk_string_sorter_get_ignore_case([self castedGObject]);

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