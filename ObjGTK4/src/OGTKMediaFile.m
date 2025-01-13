/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaFile.h"

#import <OGio/OGInputStream.h>

@implementation OGTKMediaFile

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MEDIA_FILE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mediaFile
{
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new(), GtkMediaFile, GtkMediaFile);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMediaFile* wrapperObject;
	@try {
		wrapperObject = [[OGTKMediaFile alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)mediaFileForFile:(GFile*)file
{
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_file(file), GtkMediaFile, GtkMediaFile);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMediaFile* wrapperObject;
	@try {
		wrapperObject = [[OGTKMediaFile alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)mediaFileForFilename:(OFString*)filename
{
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_filename([filename UTF8String]), GtkMediaFile, GtkMediaFile);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMediaFile* wrapperObject;
	@try {
		wrapperObject = [[OGTKMediaFile alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)mediaFileForInputStream:(OGInputStream*)stream
{
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_input_stream([stream castedGObject]), GtkMediaFile, GtkMediaFile);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMediaFile* wrapperObject;
	@try {
		wrapperObject = [[OGTKMediaFile alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)mediaFileForResourceWithResourcePath:(OFString*)resourcePath
{
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_resource([resourcePath UTF8String]), GtkMediaFile, GtkMediaFile);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKMediaFile* wrapperObject;
	@try {
		wrapperObject = [[OGTKMediaFile alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkMediaFile*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkMediaFile, GtkMediaFile);
}

- (void)clear
{
	gtk_media_file_clear([self castedGObject]);
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_media_file_get_file([self castedGObject]);

	return returnValue;
}

- (OGInputStream*)inputStream
{
	GInputStream* gobjectValue = gtk_media_file_get_input_stream([self castedGObject]);

	OGInputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
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

- (void)setResourceWithResourcePath:(OFString*)resourcePath
{
	gtk_media_file_set_resource([self castedGObject], [resourcePath UTF8String]);
}


@end