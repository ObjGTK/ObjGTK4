/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKRecentManager.h"

@implementation OGTKRecentManager

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_RECENT_MANAGER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGTKRecentManager*)default
{
	GtkRecentManager* gobjectValue = gtk_recent_manager_get_default();

	OGTKRecentManager* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

+ (instancetype)recentManager
{
	GtkRecentManager* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_recent_manager_new(), GtkRecentManager, GtkRecentManager);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKRecentManager* wrapperObject;
	@try {
		wrapperObject = [[OGTKRecentManager alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkRecentManager*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkRecentManager, GtkRecentManager);
}

- (bool)addFullWithUri:(OFString*)uri recentData:(const GtkRecentData*)recentData
{
	bool returnValue = (bool)gtk_recent_manager_add_full([self castedGObject], [uri UTF8String], recentData);

	return returnValue;
}

- (bool)addItem:(OFString*)uri
{
	bool returnValue = (bool)gtk_recent_manager_add_item([self castedGObject], [uri UTF8String]);

	return returnValue;
}

- (GList*)items
{
	GList* returnValue = (GList*)gtk_recent_manager_get_items([self castedGObject]);

	return returnValue;
}

- (bool)hasItem:(OFString*)uri
{
	bool returnValue = (bool)gtk_recent_manager_has_item([self castedGObject], [uri UTF8String]);

	return returnValue;
}

- (GtkRecentInfo*)lookupItem:(OFString*)uri
{
	GError* err = NULL;

	GtkRecentInfo* returnValue = (GtkRecentInfo*)gtk_recent_manager_lookup_item([self castedGObject], [uri UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)moveItemWithUri:(OFString*)uri newUri:(OFString*)newUri
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_recent_manager_move_item([self castedGObject], [uri UTF8String], [newUri UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (int)purgeItems
{
	GError* err = NULL;

	int returnValue = (int)gtk_recent_manager_purge_items([self castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)removeItem:(OFString*)uri
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_recent_manager_remove_item([self castedGObject], [uri UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end