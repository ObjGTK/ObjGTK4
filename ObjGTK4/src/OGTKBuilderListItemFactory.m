/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilderListItemFactory.h"

@implementation OGTKBuilderListItemFactory

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BUILDER_LIST_ITEM_FACTORY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initFromBytesWithScope:(GtkBuilderScope*)scope bytes:(GBytes*)bytes
{
	GtkBuilderListItemFactory* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_list_item_factory_new_from_bytes(scope, bytes), GtkBuilderListItemFactory, GtkBuilderListItemFactory);

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
	GtkBuilderListItemFactory* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_list_item_factory_new_from_resource(scope, [resourcePath UTF8String]), GtkBuilderListItemFactory, GtkBuilderListItemFactory);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkBuilderListItemFactory, GtkBuilderListItemFactory);
}

- (GBytes*)bytes
{
	GBytes* returnValue = (GBytes*)gtk_builder_list_item_factory_get_bytes([self castedGObject]);

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
	GtkBuilderScope* returnValue = (GtkBuilderScope*)gtk_builder_list_item_factory_get_scope([self castedGObject]);

	return returnValue;
}


@end