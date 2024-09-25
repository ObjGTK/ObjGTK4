/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkTexture;

/**
 * `GdkCursor` is used to create and destroy cursors.
 * 
 * Cursors are immutable objects, so once you created them, there is no way
 * to modify them later. You should create a new cursor when you want to change
 * something about it.
 * 
 * Cursors by themselves are not very interesting: they must be bound to a
 * window for users to see them. This is done with [method@Gdk.Surface.set_cursor]
 * or [method@Gdk.Surface.set_device_cursor]. Applications will typically
 * use higher-level GTK functions such as [gtk_widget_set_cursor()](../gtk4/method.Widget.set_cursor.html)
 * instead.
 * 
 * Cursors are not bound to a given [class@Gdk.Display], so they can be shared.
 * However, the appearance of cursors may vary when used on different
 * platforms.
 * 
 * ## Named and texture cursors
 * 
 * There are multiple ways to create cursors. The platform's own cursors
 * can be created with [ctor@Gdk.Cursor.new_from_name]. That function lists
 * the commonly available names that are shared with the CSS specification.
 * Other names may be available, depending on the platform in use. On some
 * platforms, what images are used for named cursors may be influenced by
 * the cursor theme.
 * 
 * Another option to create a cursor is to use [ctor@Gdk.Cursor.new_from_texture]
 * and provide an image to use for the cursor.
 * 
 * To ease work with unsupported cursors, a fallback cursor can be provided.
 * If a [class@Gdk.Surface] cannot use a cursor because of the reasons mentioned
 * above, it will try the fallback cursor. Fallback cursors can themselves have
 * fallback cursors again, so it is possible to provide a chain of progressively
 * easier to support cursors. If none of the provided cursors can be supported,
 * the default cursor will be the ultimate fallback.
 *
 */
@interface OGGdkCursor : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initFromNameWithName:(OFString*)name fallback:(OGGdkCursor*)fallback;
- (instancetype)initFromTextureWithTexture:(OGGdkTexture*)texture hotspotX:(int)hotspotX hotspotY:(int)hotspotY fallback:(OGGdkCursor*)fallback;

/**
 * Methods
 */

- (GdkCursor*)castedGObject;

/**
 * Returns the fallback for this @cursor.
 * 
 * The fallback will be used if this cursor is not available on a given
 * `GdkDisplay`. For named cursors, this can happen when using nonstandard
 * names or when using an incomplete cursor theme. For textured cursors,
 * this can happen when the texture is too large or when the `GdkDisplay`
 * it is used on does not support textured cursors.
 *
 * @return the fallback of the cursor or %NULL
 *   to use the default cursor as fallback
 */
- (OGGdkCursor*)fallback;

/**
 * Returns the horizontal offset of the hotspot.
 * 
 * The hotspot indicates the pixel that will be directly above the cursor.
 * 
 * Note that named cursors may have a nonzero hotspot, but this function
 * will only return the hotspot position for cursors created with
 * [ctor@Gdk.Cursor.new_from_texture].
 *
 * @return the horizontal offset of the hotspot or 0 for named cursors
 */
- (int)hotspotX;

/**
 * Returns the vertical offset of the hotspot.
 * 
 * The hotspot indicates the pixel that will be directly above the cursor.
 * 
 * Note that named cursors may have a nonzero hotspot, but this function
 * will only return the hotspot position for cursors created with
 * [ctor@Gdk.Cursor.new_from_texture].
 *
 * @return the vertical offset of the hotspot or 0 for named cursors
 */
- (int)hotspotY;

/**
 * Returns the name of the cursor.
 * 
 * If the cursor is not a named cursor, %NULL will be returned.
 *
 * @return the name of the cursor or %NULL
 *   if it is not a named cursor
 */
- (OFString*)name;

/**
 * Returns the texture for the cursor.
 * 
 * If the cursor is a named cursor, %NULL will be returned.
 *
 * @return the texture for cursor or %NULL
 *   if it is a named cursor
 */
- (OGGdkTexture*)texture;

@end