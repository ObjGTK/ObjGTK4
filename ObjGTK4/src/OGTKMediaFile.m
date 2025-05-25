/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaFile.h"

#import <OGio/OGInputStream.h>

@implementation OGTKMediaFile

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MEDIA_FILE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MEDIA_FILE);
	return gObjectClass;
}

+ (instancetype)mediaFile
{
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new(), GTK_TYPE_MEDIA_FILE, GtkMediaFile);

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
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_file(file), GTK_TYPE_MEDIA_FILE, GtkMediaFile);

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
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_filename([filename UTF8String]), GTK_TYPE_MEDIA_FILE, GtkMediaFile);

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
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_input_stream([stream castedGObject]), GTK_TYPE_MEDIA_FILE, GtkMediaFile);

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
	GtkMediaFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_media_file_new_for_resource([resourcePath UTF8String]), GTK_TYPE_MEDIA_FILE, GtkMediaFile);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MEDIA_FILE, GtkMediaFile);
}

- (void)clear
{
	gtk_media_file_clear((GtkMediaFile*)[self castedGObject]);
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_media_file_get_file((GtkMediaFile*)[self castedGObject]);

	return returnValue;
}

- (OGInputStream*)inputStream
{
	GInputStream* gobjectValue = gtk_media_file_get_input_stream((GtkMediaFile*)[self castedGObject]);

	OGInputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setFile:(GFile*)file
{
	gtk_media_file_set_file((GtkMediaFile*)[self castedGObject], file);
}

- (void)setFilename:(OFString*)filename
{
	gtk_media_file_set_filename((GtkMediaFile*)[self castedGObject], [filename UTF8String]);
}

- (void)setInputStream:(OGInputStream*)stream
{
	gtk_media_file_set_input_stream((GtkMediaFile*)[self castedGObject], [stream castedGObject]);
}

- (void)setResourceWithResourcePath:(OFString*)resourcePath
{
	gtk_media_file_set_resource((GtkMediaFile*)[self castedGObject], [resourcePath UTF8String]);
}


@end