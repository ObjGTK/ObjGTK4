/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKVideo.h"

#import "OGTKMediaStream.h"

@implementation OGTKVideo

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_VIDEO;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_VIDEO);
	return gObjectClass;
}

+ (instancetype)video
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new(), GTK_TYPE_VIDEO, GtkVideo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKVideo* wrapperObject;
	@try {
		wrapperObject = [[OGTKVideo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)videoForFile:(GFile*)file
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_file(file), GTK_TYPE_VIDEO, GtkVideo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKVideo* wrapperObject;
	@try {
		wrapperObject = [[OGTKVideo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)videoForFilename:(OFString*)filename
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_filename([filename UTF8String]), GTK_TYPE_VIDEO, GtkVideo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKVideo* wrapperObject;
	@try {
		wrapperObject = [[OGTKVideo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)videoForMediaStream:(OGTKMediaStream*)stream
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_media_stream([stream castedGObject]), GTK_TYPE_VIDEO, GtkVideo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKVideo* wrapperObject;
	@try {
		wrapperObject = [[OGTKVideo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)videoForResourceWithResourcePath:(OFString*)resourcePath
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_resource([resourcePath UTF8String]), GTK_TYPE_VIDEO, GtkVideo);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKVideo* wrapperObject;
	@try {
		wrapperObject = [[OGTKVideo alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkVideo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_VIDEO, GtkVideo);
}

- (bool)autoplay
{
	bool returnValue = (bool)gtk_video_get_autoplay((GtkVideo*)[self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_video_get_file((GtkVideo*)[self castedGObject]);

	return returnValue;
}

- (GtkGraphicsOffloadEnabled)graphicsOffload
{
	GtkGraphicsOffloadEnabled returnValue = (GtkGraphicsOffloadEnabled)gtk_video_get_graphics_offload((GtkVideo*)[self castedGObject]);

	return returnValue;
}

- (bool)loop
{
	bool returnValue = (bool)gtk_video_get_loop((GtkVideo*)[self castedGObject]);

	return returnValue;
}

- (OGTKMediaStream*)mediaStream
{
	GtkMediaStream* gobjectValue = gtk_video_get_media_stream((GtkVideo*)[self castedGObject]);

	OGTKMediaStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setAutoplay:(bool)autoplay
{
	gtk_video_set_autoplay((GtkVideo*)[self castedGObject], autoplay);
}

- (void)setFile:(GFile*)file
{
	gtk_video_set_file((GtkVideo*)[self castedGObject], file);
}

- (void)setFilename:(OFString*)filename
{
	gtk_video_set_filename((GtkVideo*)[self castedGObject], [filename UTF8String]);
}

- (void)setGraphicsOffloadWithEnabled:(GtkGraphicsOffloadEnabled)enabled
{
	gtk_video_set_graphics_offload((GtkVideo*)[self castedGObject], enabled);
}

- (void)setLoop:(bool)loop
{
	gtk_video_set_loop((GtkVideo*)[self castedGObject], loop);
}

- (void)setMediaStream:(OGTKMediaStream*)stream
{
	gtk_video_set_media_stream((GtkVideo*)[self castedGObject], [stream castedGObject]);
}

- (void)setResourceWithResourcePath:(OFString*)resourcePath
{
	gtk_video_set_resource((GtkVideo*)[self castedGObject], [resourcePath UTF8String]);
}


@end