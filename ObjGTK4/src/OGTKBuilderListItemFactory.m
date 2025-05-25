/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilderListItemFactory.h"

@implementation OGTKBuilderListItemFactory

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BUILDER_LIST_ITEM_FACTORY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_BUILDER_LIST_ITEM_FACTORY);
	return gObjectClass;
}

+ (instancetype)builderListItemFactoryFromBytesWithScope:(GtkBuilderScope*)scope bytes:(GBytes*)bytes
{
	GtkBuilderListItemFactory* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_list_item_factory_new_from_bytes(scope, bytes), GTK_TYPE_BUILDER_LIST_ITEM_FACTORY, GtkBuilderListItemFactory);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBuilderListItemFactory* wrapperObject;
	@try {
		wrapperObject = [[OGTKBuilderListItemFactory alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)builderListItemFactoryFromResourceWithScope:(GtkBuilderScope*)scope resourcePath:(OFString*)resourcePath
{
	GtkBuilderListItemFactory* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_list_item_factory_new_from_resource(scope, [resourcePath UTF8String]), GTK_TYPE_BUILDER_LIST_ITEM_FACTORY, GtkBuilderListItemFactory);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBuilderListItemFactory* wrapperObject;
	@try {
		wrapperObject = [[OGTKBuilderListItemFactory alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBuilderListItemFactory*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_BUILDER_LIST_ITEM_FACTORY, GtkBuilderListItemFactory);
}

- (GBytes*)bytes
{
	GBytes* returnValue = (GBytes*)gtk_builder_list_item_factory_get_bytes((GtkBuilderListItemFactory*)[self castedGObject]);

	return returnValue;
}

- (OFString*)resource
{
	const char* gobjectValue = gtk_builder_list_item_factory_get_resource((GtkBuilderListItemFactory*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkBuilderScope*)scope
{
	GtkBuilderScope* returnValue = (GtkBuilderScope*)gtk_builder_list_item_factory_get_scope((GtkBuilderListItemFactory*)[self castedGObject]);

	return returnValue;
}


@end