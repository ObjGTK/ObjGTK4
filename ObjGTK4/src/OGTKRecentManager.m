/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKRecentManager.h"

@implementation OGTKRecentManager

+ (OGTKRecentManager*)default
{
	GtkRecentManager* gobjectValue = GTK_RECENT_MANAGER(gtk_recent_manager_get_default());

	OGTKRecentManager* returnValue = [OGTKRecentManager withGObject:gobjectValue];
	return returnValue;
}

- (instancetype)init
{
	GtkRecentManager* gobjectValue = GTK_RECENT_MANAGER(gtk_recent_manager_new());

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

- (GtkRecentManager*)castedGObject
{
	return GTK_RECENT_MANAGER([self gObject]);
}

- (bool)addFullWithUri:(OFString*)uri recentData:(const GtkRecentData*)recentData
{
	bool returnValue = gtk_recent_manager_add_full([self castedGObject], [uri UTF8String], recentData);

	return returnValue;
}

- (bool)addItem:(OFString*)uri
{
	bool returnValue = gtk_recent_manager_add_item([self castedGObject], [uri UTF8String]);

	return returnValue;
}

- (GList*)items
{
	GList* returnValue = gtk_recent_manager_get_items([self castedGObject]);

	return returnValue;
}

- (bool)hasItem:(OFString*)uri
{
	bool returnValue = gtk_recent_manager_has_item([self castedGObject], [uri UTF8String]);

	return returnValue;
}

- (GtkRecentInfo*)lookupItem:(OFString*)uri
{
	GError* err = NULL;

	GtkRecentInfo* returnValue = gtk_recent_manager_lookup_item([self castedGObject], [uri UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)moveItemWithUri:(OFString*)uri newUri:(OFString*)newUri
{
	GError* err = NULL;

	bool returnValue = gtk_recent_manager_move_item([self castedGObject], [uri UTF8String], [newUri UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (int)purgeItems
{
	GError* err = NULL;

	int returnValue = gtk_recent_manager_purge_items([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)removeItem:(OFString*)uri
{
	GError* err = NULL;

	bool returnValue = gtk_recent_manager_remove_item([self castedGObject], [uri UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end