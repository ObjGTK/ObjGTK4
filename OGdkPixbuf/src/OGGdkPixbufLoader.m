/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkPixbufLoader.h"

#import "OGGdkPixbuf.h"
#import "OGGdkPixbufAnimation.h"

@implementation OGGdkPixbufLoader

- (instancetype)init
{
	GdkPixbufLoader* gobjectValue = GDK_PIXBUF_LOADER(gdk_pixbuf_loader_new());

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

- (instancetype)initWithMimeType:(OFString*)mimeType
{
	GError* err = NULL;

	GdkPixbufLoader* gobjectValue = GDK_PIXBUF_LOADER(gdk_pixbuf_loader_new_with_mime_type([mimeType UTF8String], &err));

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

- (instancetype)initWithType:(OFString*)imageType
{
	GError* err = NULL;

	GdkPixbufLoader* gobjectValue = GDK_PIXBUF_LOADER(gdk_pixbuf_loader_new_with_type([imageType UTF8String], &err));

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

- (GdkPixbufLoader*)castedGObject
{
	return GDK_PIXBUF_LOADER([self gObject]);
}

- (bool)close
{
	GError* err = NULL;

	bool returnValue = gdk_pixbuf_loader_close([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OGGdkPixbufAnimation*)animation
{
	GdkPixbufAnimation* gobjectValue = GDK_PIXBUF_ANIMATION(gdk_pixbuf_loader_get_animation([self castedGObject]));

	OGGdkPixbufAnimation* returnValue = [OGGdkPixbufAnimation withGObject:gobjectValue];
	return returnValue;
}

- (GdkPixbufFormat*)format
{
	GdkPixbufFormat* returnValue = gdk_pixbuf_loader_get_format([self castedGObject]);

	return returnValue;
}

- (OGGdkPixbuf*)pixbuf
{
	GdkPixbuf* gobjectValue = GDK_PIXBUF(gdk_pixbuf_loader_get_pixbuf([self castedGObject]));

	OGGdkPixbuf* returnValue = [OGGdkPixbuf withGObject:gobjectValue];
	return returnValue;
}

- (void)setSizeWithWidth:(int)width height:(int)height
{
	gdk_pixbuf_loader_set_size([self castedGObject], width, height);
}

- (bool)writeWithBuf:(const guchar*)buf count:(gsize)count
{
	GError* err = NULL;

	bool returnValue = gdk_pixbuf_loader_write([self castedGObject], buf, count, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)writeBytes:(GBytes*)buffer
{
	GError* err = NULL;

	bool returnValue = gdk_pixbuf_loader_write_bytes([self castedGObject], buffer, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end