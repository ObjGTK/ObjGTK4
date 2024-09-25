/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkTexture.h"

#import <OGdkPixbuf/OGGdkPixbuf.h>

@implementation OGGdkTexture

- (instancetype)initForPixbuf:(OGGdkPixbuf*)pixbuf
{
	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_texture_new_for_pixbuf([pixbuf castedGObject]));

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

- (instancetype)initFromBytes:(GBytes*)bytes
{
	GError* err = NULL;

	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_texture_new_from_bytes(bytes, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (instancetype)initFromFile:(GFile*)file
{
	GError* err = NULL;

	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_texture_new_from_file(file, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (instancetype)initFromFilename:(OFString*)path
{
	GError* err = NULL;

	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_texture_new_from_filename([path UTF8String], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (instancetype)initFromResource:(OFString*)resourcePath
{
	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_texture_new_from_resource([resourcePath UTF8String]));

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

- (GdkTexture*)castedGObject
{
	return GDK_TEXTURE([self gObject]);
}

- (void)downloadWithData:(guchar*)data stride:(gsize)stride
{
	gdk_texture_download([self castedGObject], data, stride);
}

- (GdkMemoryFormat)format
{
	GdkMemoryFormat returnValue = gdk_texture_get_format([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = gdk_texture_get_height([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = gdk_texture_get_width([self castedGObject]);

	return returnValue;
}

- (bool)saveToPng:(OFString*)filename
{
	bool returnValue = gdk_texture_save_to_png([self castedGObject], [filename UTF8String]);

	return returnValue;
}

- (GBytes*)saveToPngBytes
{
	GBytes* returnValue = gdk_texture_save_to_png_bytes([self castedGObject]);

	return returnValue;
}

- (bool)saveToTiff:(OFString*)filename
{
	bool returnValue = gdk_texture_save_to_tiff([self castedGObject], [filename UTF8String]);

	return returnValue;
}

- (GBytes*)saveToTiffBytes
{
	GBytes* returnValue = gdk_texture_save_to_tiff_bytes([self castedGObject]);

	return returnValue;
}


@end