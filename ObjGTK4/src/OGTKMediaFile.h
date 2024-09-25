/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaStream.h"

@class OGInputStream;

/**
 * `GtkMediaFile` implements `GtkMediaStream` for files.
 * 
 * This provides a simple way to play back video files with GTK.
 * 
 * GTK provides a GIO extension point for `GtkMediaFile` implementations
 * to allow for external implementations using various media frameworks.
 * 
 * GTK itself includes an implementation using GStreamer.
 *
 */
@interface OGTKMediaFile : OGTKMediaStream
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initForFile:(GFile*)file;
- (instancetype)initForFilename:(OFString*)filename;
- (instancetype)initForInputStream:(OGInputStream*)stream;
- (instancetype)initForResource:(OFString*)resourcePath;

/**
 * Methods
 */

- (GtkMediaFile*)castedGObject;

/**
 * Resets the media file to be empty.
 *
 */
- (void)clear;

/**
 * Returns the file that @self is currently playing from.
 * 
 * When @self is not playing or not playing from a file,
 * %NULL is returned.
 *
 * @return The currently playing file
 */
- (GFile*)file;

/**
 * Returns the stream that @self is currently playing from.
 * 
 * When @self is not playing or not playing from a stream,
 * %NULL is returned.
 *
 * @return The currently playing stream
 */
- (OGInputStream*)inputStream;

/**
 * Sets the `GtkMediaFile` to play the given file.
 * 
 * If any file is still playing, stop playing it.
 *
 * @param file the file to play
 */
- (void)setFile:(GFile*)file;

/**
 * Sets the `GtkMediaFile to play the given file.
 * 
 * This is a utility function that converts the given @filename
 * to a `GFile` and calls [method@Gtk.MediaFile.set_file].
 *
 * @param filename name of file to play
 */
- (void)setFilename:(OFString*)filename;

/**
 * Sets the `GtkMediaFile` to play the given stream.
 * 
 * If anything is still playing, stop playing it.
 * 
 * Full control about the @stream is assumed for the duration of
 * playback. The stream will not be closed.
 *
 * @param stream the stream to play from
 */
- (void)setInputStream:(OGInputStream*)stream;

/**
 * Sets the `GtkMediaFile to play the given resource.
 * 
 * This is a utility function that converts the given @resource_path
 * to a `GFile` and calls [method@Gtk.MediaFile.set_file].
 *
 * @param resourcePath path to resource to play
 */
- (void)setResource:(OFString*)resourcePath;

@end