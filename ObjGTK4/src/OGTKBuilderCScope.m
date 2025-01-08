/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilderCScope.h"

@implementation OGTKBuilderCScope

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BUILDER_CSCOPE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkBuilderCScope* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_cscope_new(), GtkBuilderCScope, GtkBuilderCScope);

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

- (GtkBuilderCScope*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkBuilderCScope, GtkBuilderCScope);
}

- (void)addCallbackSymbolWithCallbackName:(OFString*)callbackName callbackSymbol:(GCallback)callbackSymbol
{
	gtk_builder_cscope_add_callback_symbol([self castedGObject], [callbackName UTF8String], callbackSymbol);
}

- (GCallback)lookupCallbackSymbol:(OFString*)callbackName
{
	GCallback returnValue = (GCallback)gtk_builder_cscope_lookup_callback_symbol([self castedGObject], [callbackName UTF8String]);

	return returnValue;
}


@end