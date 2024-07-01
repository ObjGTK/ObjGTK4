/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaFile.h"

#import <OGio/OGInputStream.h>

@implementation OGTKMediaFile

- (instancetype)init
{
	GtkMediaFile* gobjectValue = GTK_MEDIA_FILE(gtk_media_file_new());

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

- (instancetype)initForFile:(GFile*)file
{
	GtkMediaFile* gobjectValue = GTK_MEDIA_FILE(gtk_media_file_new_for_file(file));

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

- (instancetype)initForFilename:(OFString*)filename
{
	GtkMediaFile* gobjectValue = GTK_MEDIA_FILE(gtk_media_file_new_for_filename([filename UTF8String]));

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

- (instancetype)initForInputStream:(OGInputStream*)stream
{
	GtkMediaFile* gobjectValue = GTK_MEDIA_FILE(gtk_media_file_new_for_input_stream([stream castedGObject]));

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

- (instancetype)initForResource:(OFString*)resourcePath
{
	GtkMediaFile* gobjectValue = GTK_MEDIA_FILE(gtk_media_file_new_for_resource([resourcePath UTF8String]));

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

- (GtkMediaFile*)castedGObject
{
	return GTK_MEDIA_FILE([self gObject]);
}

- (void)clear
{
	gtk_media_file_clear([self castedGObject]);
}

- (GFile*)file
{
	GFile* returnValue = gtk_media_file_get_file([self castedGObject]);

	return returnValue;
}

- (OGInputStream*)inputStream
{
	GInputStream* gobjectValue = G_INPUT_STREAM(gtk_media_file_get_input_stream([self castedGObject]));

	OGInputStream* returnValue = [OGInputStream withGObject:gobjectValue];
	return returnValue;
}

- (void)setFile:(GFile*)file
{
	gtk_media_file_set_file([self castedGObject], file);
}

- (void)setFilename:(OFString*)filename
{
	gtk_media_file_set_filename([self castedGObject], [filename UTF8String]);
}

- (void)setInputStream:(OGInputStream*)stream
{
	gtk_media_file_set_input_stream([self castedGObject], [stream castedGObject]);
}

- (void)setResource:(OFString*)resourcePath
{
	gtk_media_file_set_resource([self castedGObject], [resourcePath UTF8String]);
}


@end