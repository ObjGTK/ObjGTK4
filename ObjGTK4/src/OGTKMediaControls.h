/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKMediaStream;

/**
 * `GtkMediaControls` is a widget to show controls for a video.
 * 
 * ![An example GtkMediaControls](media-controls.png)
 * 
 * Usually, `GtkMediaControls` is used as part of [class@Gtk.Video].
 *
 */
@interface OGTKMediaControls : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGTKMediaStream*)stream;

/**
 * Methods
 */

- (GtkMediaControls*)castedGObject;

/**
 * Gets the media stream managed by @controls or %NULL if none.
 *
 * @return The media stream managed by @controls
 */
- (OGTKMediaStream*)mediaStream;

/**
 * Sets the stream that is controlled by @controls.
 *
 * @param stream a `GtkMediaStream`
 */
- (void)setMediaStream:(OGTKMediaStream*)stream;

@end