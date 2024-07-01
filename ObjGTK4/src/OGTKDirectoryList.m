/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDirectoryList.h"

@implementation OGTKDirectoryList

- (instancetype)initWithAttributes:(OFString*)attributes file:(GFile*)file
{
	GtkDirectoryList* gobjectValue = GTK_DIRECTORY_LIST(gtk_directory_list_new([attributes UTF8String], file));

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

- (GtkDirectoryList*)castedGObject
{
	return GTK_DIRECTORY_LIST([self gObject]);
}

- (OFString*)attributes
{
	const char* gobjectValue = gtk_directory_list_get_attributes([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const GError*)error
{
	const GError* returnValue = gtk_directory_list_get_error([self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = gtk_directory_list_get_file([self castedGObject]);

	return returnValue;
}

- (int)ioPriority
{
	int returnValue = gtk_directory_list_get_io_priority([self castedGObject]);

	return returnValue;
}

- (bool)monitored
{
	bool returnValue = gtk_directory_list_get_monitored([self castedGObject]);

	return returnValue;
}

- (bool)isLoading
{
	bool returnValue = gtk_directory_list_is_loading([self castedGObject]);

	return returnValue;
}

- (void)setAttributes:(OFString*)attributes
{
	gtk_directory_list_set_attributes([self castedGObject], [attributes UTF8String]);
}

- (void)setFile:(GFile*)file
{
	gtk_directory_list_set_file([self castedGObject], file);
}

- (void)setIoPriority:(int)ioPriority
{
	gtk_directory_list_set_io_priority([self castedGObject], ioPriority);
}

- (void)setMonitored:(bool)monitored
{
	gtk_directory_list_set_monitored([self castedGObject], monitored);
}


@end