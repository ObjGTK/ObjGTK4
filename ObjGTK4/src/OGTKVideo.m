/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKVideo.h"

#import "OGTKMediaStream.h"

@implementation OGTKVideo

- (instancetype)init
{
	GtkVideo* gobjectValue = GTK_VIDEO(gtk_video_new());

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

- (instancetype)initForFile:(GFile*)file
{
	GtkVideo* gobjectValue = GTK_VIDEO(gtk_video_new_for_file(file));

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

- (instancetype)initForFilename:(OFString*)filename
{
	GtkVideo* gobjectValue = GTK_VIDEO(gtk_video_new_for_filename([filename UTF8String]));

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

- (instancetype)initForMediaStream:(OGTKMediaStream*)stream
{
	GtkVideo* gobjectValue = GTK_VIDEO(gtk_video_new_for_media_stream([stream castedGObject]));

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

- (instancetype)initForResource:(OFString*)resourcePath
{
	GtkVideo* gobjectValue = GTK_VIDEO(gtk_video_new_for_resource([resourcePath UTF8String]));

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
	return GTK_VIDEO([self gObject]);
}

- (bool)autoplay
{
	bool returnValue = gtk_video_get_autoplay([self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = gtk_video_get_file([self castedGObject]);

	return returnValue;
}

- (GtkGraphicsOffloadEnabled)graphicsOffload
{
	GtkGraphicsOffloadEnabled returnValue = gtk_video_get_graphics_offload([self castedGObject]);

	return returnValue;
}

- (bool)loop
{
	bool returnValue = gtk_video_get_loop([self castedGObject]);

	return returnValue;
}

- (OGTKMediaStream*)mediaStream
{
	GtkMediaStream* gobjectValue = GTK_MEDIA_STREAM(gtk_video_get_media_stream([self castedGObject]));

	OGTKMediaStream* returnValue = [OGTKMediaStream withGObject:gobjectValue];
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