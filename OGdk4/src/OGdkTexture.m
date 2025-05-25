/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkTexture.h"

#import <OGdkPixbuf/OGdkPixbuf.h>

@implementation OGdkTexture

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_TEXTURE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_TEXTURE);
	return gObjectClass;
}

+ (instancetype)textureForPixbuf:(OGdkPixbuf*)pixbuf
{
	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_for_pixbuf([pixbuf castedGObject]), GDK_TYPE_TEXTURE, GdkTexture);

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

	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_bytes(bytes, &err), GDK_TYPE_TEXTURE, GdkTexture);

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

	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_file(file, &err), GDK_TYPE_TEXTURE, GdkTexture);

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

+ (instancetype)textureFromFilenameWithPath:(OFString*)path
{
	GError* err = NULL;

	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_filename([path UTF8String], &err), GDK_TYPE_TEXTURE, GdkTexture);

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

+ (instancetype)textureFromResourceWithResourcePath:(OFString*)resourcePath
{
	GdkTexture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_texture_new_from_resource([resourcePath UTF8String]), GDK_TYPE_TEXTURE, GdkTexture);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_TEXTURE, GdkTexture);
}

- (void)downloadWithData:(guchar*)data stride:(gsize)stride
{
	gdk_texture_download((GdkTexture*)[self castedGObject], data, stride);
}

- (GdkMemoryFormat)format
{
	GdkMemoryFormat returnValue = (GdkMemoryFormat)gdk_texture_get_format((GdkTexture*)[self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = (int)gdk_texture_get_height((GdkTexture*)[self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)gdk_texture_get_width((GdkTexture*)[self castedGObject]);

	return returnValue;
}

- (bool)saveToPngWithFilename:(OFString*)filename
{
	bool returnValue = (bool)gdk_texture_save_to_png((GdkTexture*)[self castedGObject], [filename UTF8String]);

	return returnValue;
}

- (GBytes*)saveToPngBytes
{
	GBytes* returnValue = (GBytes*)gdk_texture_save_to_png_bytes((GdkTexture*)[self castedGObject]);

	return returnValue;
}

- (bool)saveToTiffWithFilename:(OFString*)filename
{
	bool returnValue = (bool)gdk_texture_save_to_tiff((GdkTexture*)[self castedGObject], [filename UTF8String]);

	return returnValue;
}

- (GBytes*)saveToTiffBytes
{
	GBytes* returnValue = (GBytes*)gdk_texture_save_to_tiff_bytes((GdkTexture*)[self castedGObject]);

	return returnValue;
}


@end