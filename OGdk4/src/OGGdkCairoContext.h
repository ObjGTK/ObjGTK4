/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDrawContext.h"

/**
 * `GdkCairoContext` is an object representing the platform-specific
 * draw context.
 * 
 * `GdkCairoContext`s are created for a surface using
 * [method@Gdk.Surface.create_cairo_context], and the context
 * can then be used to draw on that surface.
 *
 */
@interface OGGdkCairoContext : OGGdkDrawContext
{

}


/**
 * Methods
 */

- (GdkCairoContext*)castedGObject;

/**
 * Retrieves a Cairo context to be used to draw on the `GdkSurface`
 * of @context.
 * 
 * A call to [method@Gdk.DrawContext.begin_frame] with this
 * @context must have been done or this function will return %NULL.
 * 
 * The returned context is guaranteed to be valid until
 * [method@Gdk.DrawContext.end_frame] is called.
 *
 * @return a Cairo context
 *   to draw on `GdkSurface
 */
- (cairo_t*)cairoCreate;

@end