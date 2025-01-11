/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkTexture.h"

#import <OGdkPixbuf/OGdkPixbuf.h>

@implementation OGdkTexture

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_TEXTURE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)textureForPixbuf:(OGdkPixbuf*)pixbuf
{
	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_for_pixbuf([pixbuf castedGObject]), GdkTexture, GdkTexture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkTexture* wrapperObject;
	@try {
		wrapperObject = [[OGdkTexture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)textureFromBytes:(GBytes*)bytes
{
	GError* err = NULL;

	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_bytes(bytes, &err), GdkTexture, GdkTexture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkTexture* wrapperObject;
	@try {
		wrapperObject = [[OGdkTexture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)textureFromFile:(GFile*)file
{
	GError* err = NULL;

	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_file(file, &err), GdkTexture, GdkTexture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkTexture* wrapperObject;
	@try {
		wrapperObject = [[OGdkTexture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)textureFromFilename:(OFString*)path
{
	GError* err = NULL;

	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_filename([path UTF8String], &err), GdkTexture, GdkTexture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkTexture* wrapperObject;
	@try {
		wrapperObject = [[OGdkTexture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)textureFromResource:(OFString*)resourcePath
{
	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_resource([resourcePath UTF8String]), GdkTexture, GdkTexture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkTexture* wrapperObject;
	@try {
		wrapperObject = [[OGdkTexture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkTexture*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkTexture, GdkTexture);
}

- (void)downloadWithData:(guchar*)data stride:(gsize)stride
{
	gdk_texture_download([self castedGObject], data, stride);
}

- (GdkMemoryFormat)format
{
	GdkMemoryFormat returnValue = (GdkMemoryFormat)gdk_texture_get_format([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = (int)gdk_texture_get_height([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)gdk_texture_get_width([self castedGObject]);

	return returnValue;
}

- (bool)saveToPng:(OFString*)filename
{
	bool returnValue = (bool)gdk_texture_save_to_png([self castedGObject], [filename UTF8String]);

	return returnValue;
}

- (GBytes*)saveToPngBytes
{
	GBytes* returnValue = (GBytes*)gdk_texture_save_to_png_bytes([self castedGObject]);

	return returnValue;
}

- (bool)saveToTiff:(OFString*)filename
{
	bool returnValue = (bool)gdk_texture_save_to_tiff([self castedGObject], [filename UTF8String]);

	return returnValue;
}

- (GBytes*)saveToTiffBytes
{
	GBytes* returnValue = (GBytes*)gdk_texture_save_to_tiff_bytes([self castedGObject]);

	return returnValue;
}


@end