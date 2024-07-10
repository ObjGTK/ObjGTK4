/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkPixbufAnimation.h"

#import <OGio/OGCancellable.h>
#import "OGGdkPixbuf.h"
#import "OGGdkPixbufAnimationIter.h"
#import <OGio/OGInputStream.h>

@implementation OGGdkPixbufAnimation

+ (void)newFromStreamAsyncWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_pixbuf_animation_new_from_stream_async([stream castedGObject], [cancellable castedGObject], callback, userData);
}

- (instancetype)initFromFile:(OFString*)filename
{
	GError* err = NULL;

	GdkPixbufAnimation* gobjectValue = GDK_PIXBUF_ANIMATION(gdk_pixbuf_animation_new_from_file([filename UTF8String], &err));

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
	GError* err = NULL;

	GdkPixbufAnimation* gobjectValue = GDK_PIXBUF_ANIMATION(gdk_pixbuf_animation_new_from_resource([resourcePath UTF8String], &err));

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

- (instancetype)initFromStreamWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GdkPixbufAnimation* gobjectValue = GDK_PIXBUF_ANIMATION(gdk_pixbuf_animation_new_from_stream([stream castedGObject], [cancellable castedGObject], &err));

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

- (instancetype)initFromStreamFinish:(GAsyncResult*)asyncResult
{
	GError* err = NULL;

	GdkPixbufAnimation* gobjectValue = GDK_PIXBUF_ANIMATION(gdk_pixbuf_animation_new_from_stream_finish(asyncResult, &err));

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

- (GdkPixbufAnimation*)castedGObject
{
	return GDK_PIXBUF_ANIMATION([self gObject]);
}

- (int)height
{
	int returnValue = gdk_pixbuf_animation_get_height([self castedGObject]);

	return returnValue;
}

- (OGGdkPixbufAnimationIter*)iter:(const GTimeVal*)startTime
{
	GdkPixbufAnimationIter* gobjectValue = GDK_PIXBUF_ANIMATION_ITER(gdk_pixbuf_animation_get_iter([self castedGObject], startTime));

	OGGdkPixbufAnimationIter* returnValue = [OGGdkPixbufAnimationIter withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGGdkPixbuf*)staticImage
{
	GdkPixbuf* gobjectValue = GDK_PIXBUF(gdk_pixbuf_animation_get_static_image([self castedGObject]));

	OGGdkPixbuf* returnValue = [OGGdkPixbuf withGObject:gobjectValue];
	return returnValue;
}

- (int)width
{
	int returnValue = gdk_pixbuf_animation_get_width([self castedGObject]);

	return returnValue;
}

- (bool)isStaticImage
{
	bool returnValue = gdk_pixbuf_animation_is_static_image([self castedGObject]);

	return returnValue;
}


@end