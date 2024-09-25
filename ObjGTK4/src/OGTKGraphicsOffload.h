/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * A widget that allows to bypass gsk rendering for its child by passing the content
 * directly to the compositor.
 * 
 * Graphics offload is an optimization to reduce overhead and battery use that is
 * most useful for video content. It only works on some platforms and in certain
 * situations. GTK will automatically fall back to normal rendering if it doesn't.
 * 
 * Graphics offload is most efficient if there are no controls drawn on top of the
 * video content.
 * 
 * You should consider using graphics offload for your main widget if it shows
 * frequently changing content (such as a video, or a VM display) and you provide
 * the content in the form of dmabuf textures (see [class@Gdk.DmabufTextureBuilder]),
 * in particular if it may be fullscreen.
 * 
 * Numerous factors can prohibit graphics offload:
 * 
 * - Unsupported platforms. Currently, graphics offload only works on Linux with Wayland.
 * 
 * - Clipping, such as rounded corners that cause the video content to not be rectangular
 * 
 * - Unsupported dmabuf formats (see [method@Gdk.Display.get_dmabuf_formats])
 * 
 * - Translucent video content (content with an alpha channel, even if it isn't used)
 * 
 * - Transforms that are more complex than translations and scales
 * 
 * - Filters such as opacity, grayscale or similar
 * 
 * To investigate problems related graphics offload, GTK offers debug flags to print
 * out information about graphics offload and dmabuf use:
 * 
 *     GDK_DEBUG=offload
 *     GDK_DEBUG=dmabuf
 * 
 * The GTK inspector provides a visual debugging tool for graphics offload.
 *
 */
@interface OGTKGraphicsOffload : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGTKWidget*)child;

/**
 * Methods
 */

- (GtkGraphicsOffload*)castedGObject;

/**
 * Gets the child of @self.
 *
 * @return the child widget
 */
- (OGTKWidget*)child;

/**
 * Returns whether offload is enabled for @self.
 *
 * @return whether offload is enabled
 */
- (GtkGraphicsOffloadEnabled)enabled;

/**
 * Sets the child of @self.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets whether this GtkGraphicsOffload widget will attempt
 * to offload the content of its child widget.
 *
 * @param enabled whether to enable offload
 */
- (void)setEnabled:(GtkGraphicsOffloadEnabled)enabled;

@end