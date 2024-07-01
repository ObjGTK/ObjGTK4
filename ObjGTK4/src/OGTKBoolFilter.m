/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBoolFilter.h"

@implementation OGTKBoolFilter

- (instancetype)init:(GtkExpression*)expression
{
	GtkBoolFilter* gobjectValue = GTK_BOOL_FILTER(gtk_bool_filter_new(expression));

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

- (GtkBoolFilter*)castedGObject
{
	return GTK_BOOL_FILTER([self gObject]);
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = gtk_bool_filter_get_expression([self castedGObject]);

	return returnValue;
}

- (bool)invert
{
	bool returnValue = gtk_bool_filter_get_invert([self castedGObject]);

	return returnValue;
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_bool_filter_set_expression([self castedGObject], expression);
}

- (void)setInvert:(bool)invert
{
	gtk_bool_filter_set_invert([self castedGObject], invert);
}


@end