/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKVideo.h"

#import "OGTKMediaStream.h"

@implementation OGTKVideo

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_VIDEO;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new(), GtkVideo, GtkVideo);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithFileForFile:(GFile*)file
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_file(file), GtkVideo, GtkVideo);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithFilenameForFilename:(OFString*)filename
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_filename([filename UTF8String]), GtkVideo, GtkVideo);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithStreamForMediaStream:(OGTKMediaStream*)stream
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_media_stream([stream castedGObject]), GtkVideo, GtkVideo);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithResourcePathForResource:(OFString*)resourcePath
{
	GtkVideo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_video_new_for_resource([resourcePath UTF8String]), GtkVideo, GtkVideo);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkVideo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkVideo, GtkVideo);
}

- (bool)autoplay
{
	bool returnValue = (bool)gtk_video_get_autoplay([self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_video_get_file([self castedGObject]);

	return returnValue;
}

- (GtkGraphicsOffloadEnabled)graphicsOffload
{
	GtkGraphicsOffloadEnabled returnValue = (GtkGraphicsOffloadEnabled)gtk_video_get_graphics_offload([self castedGObject]);

	return returnValue;
}

- (bool)loop
{
	bool returnValue = (bool)gtk_video_get_loop([self castedGObject]);

	return returnValue;
}

- (OGTKMediaStream*)mediaStream
{
	GtkMediaStream* gobjectValue = gtk_video_get_media_stream([self castedGObject]);

	OGTKMediaStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setAutoplay:(bool)autoplay
{
	gtk_video_set_autoplay([self castedGObject], autoplay);
}

- (void)setFile:(GFile*)file
{
	gtk_video_set_file([self castedGObject], file);
}

- (void)setFilename:(OFString*)filename
{
	gtk_video_set_filename([self castedGObject], [filename UTF8String]);
}

- (void)setGraphicsOffload:(GtkGraphicsOffloadEnabled)enabled
{
	gtk_video_set_graphics_offload([self castedGObject], enabled);
}

- (void)setLoop:(bool)loop
{
	gtk_video_set_loop([self castedGObject], loop);
}

- (void)setMediaStream:(OGTKMediaStream*)stream
{
	gtk_video_set_media_stream([self castedGObject], [stream castedGObject]);
}

- (void)setResource:(OFString*)resourcePath
{
	gtk_video_set_resource([self castedGObject], [resourcePath UTF8String]);
}


@end