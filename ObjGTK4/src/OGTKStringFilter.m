/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringFilter.h"

@implementation OGTKStringFilter

- (instancetype)init:(GtkExpression*)expression
{
	GtkStringFilter* gobjectValue = GTK_STRING_FILTER(gtk_string_filter_new(expression));

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

- (GtkStringFilter*)castedGObject
{
	return GTK_STRING_FILTER([self gObject]);
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = gtk_string_filter_get_expression([self castedGObject]);

	return returnValue;
}

- (bool)ignoreCase
{
	bool returnValue = gtk_string_filter_get_ignore_case([self castedGObject]);

	return returnValue;
}

- (GtkStringFilterMatchMode)matchMode
{
	GtkStringFilterMatchMode returnValue = gtk_string_filter_get_match_mode([self castedGObject]);

	return returnValue;
}

- (OFString*)search
{
	const char* gobjectValue = gtk_string_filter_get_search([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_string_filter_set_expression([self castedGObject], expression);
}

- (void)setIgnoreCase:(bool)ignoreCase
{
	gtk_string_filter_set_ignore_case([self castedGObject], ignoreCase);
}

- (void)setMatchMode:(GtkStringFilterMatchMode)mode
{
	gtk_string_filter_set_match_mode([self castedGObject], mode);
}

- (void)setSearch:(OFString*)search
{
	gtk_string_filter_set_search([self castedGObject], [search UTF8String]);
}


@end