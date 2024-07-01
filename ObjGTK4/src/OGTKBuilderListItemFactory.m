/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilderListItemFactory.h"

@implementation OGTKBuilderListItemFactory

- (instancetype)initFromBytesWithScope:(GtkBuilderScope*)scope bytes:(GBytes*)bytes
{
	GtkBuilderListItemFactory* gobjectValue = GTK_BUILDER_LIST_ITEM_FACTORY(gtk_builder_list_item_factory_new_from_bytes(scope, bytes));

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

- (instancetype)initFromResourceWithScope:(GtkBuilderScope*)scope resourcePath:(OFString*)resourcePath
{
	GtkBuilderListItemFactory* gobjectValue = GTK_BUILDER_LIST_ITEM_FACTORY(gtk_builder_list_item_factory_new_from_resource(scope, [resourcePath UTF8String]));

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

- (GtkBuilderListItemFactory*)castedGObject
{
	return GTK_BUILDER_LIST_ITEM_FACTORY([self gObject]);
}

- (GBytes*)bytes
{
	GBytes* returnValue = gtk_builder_list_item_factory_get_bytes([self castedGObject]);

	return returnValue;
}

- (OFString*)resource
{
	const char* gobjectValue = gtk_builder_list_item_factory_get_resource([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkBuilderScope*)scope
{
	GtkBuilderScope* returnValue = gtk_builder_list_item_factory_get_scope([self castedGObject]);

	return returnValue;
}


@end