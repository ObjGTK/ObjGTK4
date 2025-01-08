/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbufAnimation.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>
#import "OGdkPixbuf.h"
#import "OGdkPixbufAnimationIter.h"

@implementation OGdkPixbufAnimation

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_PIXBUF_ANIMATION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (void)newFromStreamAsyncWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_pixbuf_animation_new_from_stream_async([stream castedGObject], [cancellable castedGObject], callback, userData);
}

- (instancetype)initWithFilenameFromFile:(OFString*)filename
{
	GError* err = NULL;

	GdkPixbufAnimation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_animation_new_from_file([filename UTF8String], &err), GdkPixbufAnimation, GdkPixbufAnimation);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (instancetype)initWithResourcePathFromResource:(OFString*)resourcePath
{
	GError* err = NULL;

	GdkPixbufAnimation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_animation_new_from_resource([resourcePath UTF8String], &err), GdkPixbufAnimation, GdkPixbufAnimation);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

	GdkPixbufAnimation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_animation_new_from_stream([stream castedGObject], [cancellable castedGObject], &err), GdkPixbufAnimation, GdkPixbufAnimation);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (instancetype)initWithAsyncResultFromStreamFinish:(GAsyncResult*)asyncResult
{
	GError* err = NULL;

	GdkPixbufAnimation* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_animation_new_from_stream_finish(asyncResult, &err), GdkPixbufAnimation, GdkPixbufAnimation);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkPixbufAnimation, GdkPixbufAnimation);
}

- (int)height
{
	int returnValue = (int)gdk_pixbuf_animation_get_height([self castedGObject]);

	return returnValue;
}

- (OGdkPixbufAnimationIter*)iter:(const GTimeVal*)startTime
{
	GdkPixbufAnimationIter* gobjectValue = gdk_pixbuf_animation_get_iter([self castedGObject], startTime);

	OGdkPixbufAnimationIter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkPixbuf*)staticImage
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_animation_get_static_image([self castedGObject]);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)width
{
	int returnValue = (int)gdk_pixbuf_animation_get_width([self castedGObject]);

	return returnValue;
}

- (bool)isStaticImage
{
	bool returnValue = (bool)gdk_pixbuf_animation_is_static_image([self castedGObject]);

	return returnValue;
}


@end