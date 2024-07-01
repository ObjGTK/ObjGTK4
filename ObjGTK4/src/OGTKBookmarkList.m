/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBookmarkList.h"

@implementation OGTKBookmarkList

- (instancetype)initWithFilename:(OFString*)filename attributes:(OFString*)attributes
{
	GtkBookmarkList* gobjectValue = GTK_BOOKMARK_LIST(gtk_bookmark_list_new([filename UTF8String], [attributes UTF8String]));

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

- (GtkBookmarkList*)castedGObject
{
	return GTK_BOOKMARK_LIST([self gObject]);
}

- (OFString*)attributes
{
	const char* gobjectValue = gtk_bookmark_list_get_attributes([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)filename
{
	const char* gobjectValue = gtk_bookmark_list_get_filename([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)ioPriority
{
	int returnValue = gtk_bookmark_list_get_io_priority([self castedGObject]);

	return returnValue;
}

- (bool)isLoading
{
	bool returnValue = gtk_bookmark_list_is_loading([self castedGObject]);

	return returnValue;
}

- (void)setAttributes:(OFString*)attributes
{
	gtk_bookmark_list_set_attributes([self castedGObject], [attributes UTF8String]);
}

- (void)setIoPriority:(int)ioPriority
{
	gtk_bookmark_list_set_io_priority([self castedGObject], ioPriority);
}


@end