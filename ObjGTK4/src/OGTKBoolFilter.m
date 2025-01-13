/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBoolFilter.h"

@implementation OGTKBoolFilter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BOOL_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)boolFilterWithExpression:(GtkExpression*)expression
{
	GtkBoolFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_bool_filter_new(expression), GtkBoolFilter, GtkBoolFilter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBoolFilter* wrapperObject;
	@try {
		wrapperObject = [[OGTKBoolFilter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBoolFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkBoolFilter, GtkBoolFilter);
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_bool_filter_get_expression([self castedGObject]);

	return returnValue;
}

- (bool)invert
{
	bool returnValue = (bool)gtk_bool_filter_get_invert([self castedGObject]);

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