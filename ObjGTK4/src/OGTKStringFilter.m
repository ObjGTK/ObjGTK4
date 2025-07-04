/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStringFilter.h"

@implementation OGTKStringFilter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STRING_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_STRING_FILTER);
	return gObjectClass;
}

+ (instancetype)stringFilterWithExpression:(GtkExpression*)expression
{
	GtkStringFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_string_filter_new(expression), GTK_TYPE_STRING_FILTER, GtkStringFilter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKStringFilter* wrapperObject;
	@try {
		wrapperObject = [[OGTKStringFilter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStringFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_STRING_FILTER, GtkStringFilter);
}

- (GtkExpression*)expression
{
	GtkExpression* returnValue = (GtkExpression*)gtk_string_filter_get_expression((GtkStringFilter*)[self castedGObject]);

	return returnValue;
}

- (bool)ignoreCase
{
	bool returnValue = (bool)gtk_string_filter_get_ignore_case((GtkStringFilter*)[self castedGObject]);

	return returnValue;
}

- (GtkStringFilterMatchMode)matchMode
{
	GtkStringFilterMatchMode returnValue = (GtkStringFilterMatchMode)gtk_string_filter_get_match_mode((GtkStringFilter*)[self castedGObject]);

	return returnValue;
}

- (OFString*)search
{
	const char* gobjectValue = gtk_string_filter_get_search((GtkStringFilter*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setExpression:(GtkExpression*)expression
{
	gtk_string_filter_set_expression((GtkStringFilter*)[self castedGObject], expression);
}

- (void)setIgnoreCase:(bool)ignoreCase
{
	gtk_string_filter_set_ignore_case((GtkStringFilter*)[self castedGObject], ignoreCase);
}

- (void)setMatchMode:(GtkStringFilterMatchMode)mode
{
	gtk_string_filter_set_match_mode((GtkStringFilter*)[self castedGObject], mode);
}

- (void)setSearch:(OFString*)search
{
	gtk_string_filter_set_search((GtkStringFilter*)[self castedGObject], [search UTF8String]);
}


@end