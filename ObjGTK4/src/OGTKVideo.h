/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKMediaStream;

/**
 * `GtkVideo` is a widget to show a `GtkMediaStream` with media controls.
 * 
 * ![An example GtkVideo](video.png)
 * 
 * The controls are available separately as [class@Gtk.MediaControls].
 * If you just want to display a video without controls, you can treat it
 * like any other paintable and for example put it into a [class@Gtk.Picture].
 * 
 * `GtkVideo` aims to cover use cases such as previews, embedded animations,
 * etc. It supports autoplay, looping, and simple media controls. It does
 * not have support for video overlays, multichannel audio, device
 * selection, or input. If you are writing a full-fledged video player,
 * you may want to use the [iface@Gdk.Paintable] API and a media framework
 * such as Gstreamer directly.
 *
 */
@interface OGTKVideo : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initForFile:(GFile*)file;
- (instancetype)initForFilename:(OFString*)filename;
- (instancetype)initForMediaStream:(OGTKMediaStream*)stream;
- (instancetype)initForResource:(OFString*)resourcePath;

/**
 * Methods
 */

- (GtkVideo*)castedGObject;

/**
 * Returns %TRUE if videos have been set to loop.
 *
 * @return %TRUE if streams should autoplay
 */
- (bool)autoplay;

/**
 * Gets the file played by @self or %NULL if not playing back
 * a file.
 *
 * @return The file played by @self
 */
- (GFile*)file;

/**
 * Returns whether graphics offload is enabled.
 * 
 * See [class@Gtk.GraphicsOffload] for more information on graphics offload.
 *
 * @return the graphics offload status
 */
- (GtkGraphicsOffloadEnabled)graphicsOffload;

/**
 * Returns %TRUE if videos have been set to loop.
 *
 * @return %TRUE if streams should loop
 */
- (bool)loop;

/**
 * Gets the media stream managed by @self or %NULL if none.
 *
 * @return The media stream managed by @self
 */
- (OGTKMediaStream*)mediaStream;

/**
 * Sets whether @self automatically starts playback when it
 * becomes visible or when a new file gets loaded.
 *
 * @param autoplay whether media streams should autoplay
 */
- (void)setAutoplay:(bool)autoplay;

/**
 * Makes @self play the given @file.
 *
 * @param file the file to play
 */
- (void)setFile:(GFile*)file;

/**
 * Makes @self play the given @filename.
 * 
 * This is a utility function that calls gtk_video_set_file(),
 *
 * @param filename the filename to play
 */
- (void)setFilename:(OFString*)filename;

/**
 * Sets whether to enable graphics offload.
 * 
 * See [class@Gtk.GraphicsOffload] for more information on graphics offload.
 *
 * @param enabled the new graphics offload status
 */
- (void)setGraphicsOffload:(GtkGraphicsOffloadEnabled)enabled;

/**
 * Sets whether new files loaded by @self should be set to loop.
 *
 * @param loop whether media streams should loop
 */
- (void)setLoop:(bool)loop;

/**
 * Sets the media stream to be played back.
 * 
 * @self will take full control of managing the media stream. If you
 * want to manage a media stream yourself, consider using a
 * [class@Gtk.Picture] for display.
 * 
 * If you want to display a file, consider using [method@Gtk.Video.set_file]
 * instead.
 *
 * @param stream The media stream to play or %NULL to unset
 */
- (void)setMediaStream:(OGTKMediaStream*)stream;

/**
 * Makes @self play the resource at the given @resource_path.
 * 
 * This is a utility function that calls [method@Gtk.Video.set_file].
 *
 * @param resourcePath the resource to set
 */
- (void)setResource:(OFString*)resourcePath;

@end