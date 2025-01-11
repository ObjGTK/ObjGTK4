/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDirectoryList.h"

@implementation OGTKDirectoryList

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DIRECTORY_LIST;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)directoryListWithAttributes:(OFString*)attributes file:(GFile*)file
{
	GtkDirectoryList* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_directory_list_new([attributes UTF8String], file), GtkDirectoryList, GtkDirectoryList);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKDirectoryList* wrapperObject;
	@try {
		wrapperObject = [[OGTKDirectoryList alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDirectoryList*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkDirectoryList, GtkDirectoryList);
}

- (OFString*)attributes
{
	const char* gobjectValue = gtk_directory_list_get_attributes([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const GError*)error
{
	const GError* returnValue = (const GError*)gtk_directory_list_get_error([self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_directory_list_get_file([self castedGObject]);

	return returnValue;
}

- (int)ioPriority
{
	int returnValue = (int)gtk_directory_list_get_io_priority([self castedGObject]);

	return returnValue;
}

- (bool)monitored
{
	bool returnValue = (bool)gtk_directory_list_get_monitored([self castedGObject]);

	return returnValue;
}

- (bool)isLoading
{
	bool returnValue = (bool)gtk_directory_list_is_loading([self castedGObject]);

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