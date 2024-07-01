/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileFilter.h"

@implementation OGTKFileFilter

- (instancetype)init
{
	GtkFileFilter* gobjectValue = GTK_FILE_FILTER(gtk_file_filter_new());

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

- (instancetype)initFromGvariant:(GVariant*)variant
{
	GtkFileFilter* gobjectValue = GTK_FILE_FILTER(gtk_file_filter_new_from_gvariant(variant));

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

- (GtkFileFilter*)castedGObject
{
	return GTK_FILE_FILTER([self gObject]);
}

- (void)addMimeType:(OFString*)mimeType
{
	gtk_file_filter_add_mime_type([self castedGObject], [mimeType UTF8String]);
}

- (void)addPattern:(OFString*)pattern
{
	gtk_file_filter_add_pattern([self castedGObject], [pattern UTF8String]);
}

- (void)addPixbufFormats
{
	gtk_file_filter_add_pixbuf_formats([self castedGObject]);
}

- (void)addSuffix:(OFString*)suffix
{
	gtk_file_filter_add_suffix([self castedGObject], [suffix UTF8String]);
}

- (const char**)attributes
{
	const char** returnValue = gtk_file_filter_get_attributes([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_file_filter_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setName:(OFString*)name
{
	gtk_file_filter_set_name([self castedGObject], [name UTF8String]);
}

- (GVariant*)toGvariant
{
	GVariant* returnValue = gtk_file_filter_to_gvariant([self castedGObject]);

	return returnValue;
}


@end