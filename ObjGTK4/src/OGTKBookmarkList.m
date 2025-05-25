/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBookmarkList.h"

@implementation OGTKBookmarkList

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BOOKMARK_LIST;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_BOOKMARK_LIST);
	return gObjectClass;
}

+ (instancetype)bookmarkListWithFilename:(OFString*)filename attributes:(OFString*)attributes
{
	GtkBookmarkList* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_bookmark_list_new([filename UTF8String], [attributes UTF8String]), GTK_TYPE_BOOKMARK_LIST, GtkBookmarkList);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBookmarkList* wrapperObject;
	@try {
		wrapperObject = [[OGTKBookmarkList alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBookmarkList*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_BOOKMARK_LIST, GtkBookmarkList);
}

- (OFString*)attributes
{
	const char* gobjectValue = gtk_bookmark_list_get_attributes((GtkBookmarkList*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)filename
{
	const char* gobjectValue = gtk_bookmark_list_get_filename((GtkBookmarkList*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)ioPriority
{
	int returnValue = (int)gtk_bookmark_list_get_io_priority((GtkBookmarkList*)[self castedGObject]);

	return returnValue;
}

- (bool)isLoading
{
	bool returnValue = (bool)gtk_bookmark_list_is_loading((GtkBookmarkList*)[self castedGObject]);

	return returnValue;
}

- (void)setAttributes:(OFString*)attributes
{
	gtk_bookmark_list_set_attributes((GtkBookmarkList*)[self castedGObject], [attributes UTF8String]);
}

- (void)setIoPriority:(int)ioPriority
{
	gtk_bookmark_list_set_io_priority((GtkBookmarkList*)[self castedGObject], ioPriority);
}


@end