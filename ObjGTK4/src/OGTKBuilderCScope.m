/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilderCScope.h"

@implementation OGTKBuilderCScope

- (instancetype)init
{
	GtkBuilderCScope* gobjectValue = GTK_BUILDER_CSCOPE(gtk_builder_cscope_new());

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
	return GTK_BUILDER_CSCOPE([self gObject]);
}

- (void)addCallbackSymbolWithCallbackName:(OFString*)callbackName callbackSymbol:(GCallback)callbackSymbol
{
	gtk_builder_cscope_add_callback_symbol([self castedGObject], [callbackName UTF8String], callbackSymbol);
}

- (GCallback)lookupCallbackSymbol:(OFString*)callbackName
{
	GCallback returnValue = gtk_builder_cscope_lookup_callback_symbol([self castedGObject], [callbackName UTF8String]);

	return returnValue;
}


@end