/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilderCScope.h"

@implementation OGTKBuilderCScope

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BUILDER_CSCOPE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_BUILDER_CSCOPE);
	return gObjectClass;
}

+ (instancetype)builderCScope
{
	GtkBuilderCScope* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_cscope_new(), GTK_TYPE_BUILDER_CSCOPE, GtkBuilderCScope);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBuilderCScope* wrapperObject;
	@try {
		wrapperObject = [[OGTKBuilderCScope alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBuilderCScope*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_BUILDER_CSCOPE, GtkBuilderCScope);
}

- (void)addCallbackSymbolWithCallbackName:(OFString*)callbackName callbackSymbol:(GCallback)callbackSymbol
{
	gtk_builder_cscope_add_callback_symbol((GtkBuilderCScope*)[self castedGObject], [callbackName UTF8String], callbackSymbol);
}

- (GCallback)lookupCallbackSymbolWithCallbackName:(OFString*)callbackName
{
	GCallback returnValue = (GCallback)gtk_builder_cscope_lookup_callback_symbol((GtkBuilderCScope*)[self castedGObject], [callbackName UTF8String]);

	return returnValue;
}


@end