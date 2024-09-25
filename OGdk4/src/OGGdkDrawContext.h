/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkSurface;
@class OGGdkDisplay;

/**
 * Base class for objects implementing different rendering methods.
 * 
 * `GdkDrawContext` is the base object used by contexts implementing different
 * rendering methods, such as [class@Gdk.CairoContext] or [class@Gdk.GLContext].
 * It provides shared functionality between those contexts.
 * 
 * You will always interact with one of those subclasses.
 * 
 * A `GdkDrawContext` is always associated with a single toplevel surface.
 *
 */
@interface OGGdkDrawContext : OGObject
{

}


/**
 * Methods
 */

- (GdkDrawContext*)castedGObject;

/**
 * Indicates that you are beginning the process of redrawing @region
 * on the @context's surface.
 * 
 * Calling this function begins a drawing operation using @context on the
 * surface that @context was created from. The actual requirements and
 * guarantees for the drawing operation vary for different implementations
 * of drawing, so a [class@Gdk.CairoContext] and a [class@Gdk.GLContext]
 * need to be treated differently.
 * 
 * A call to this function is a requirement for drawing and must be
 * followed by a call to [method@Gdk.DrawContext.end_frame], which will
 * complete the drawing operation and ensure the contents become visible
 * on screen.
 * 
 * Note that the @region passed to this function is the minimum region that
 * needs to be drawn and depending on implementation, windowing system and
 * hardware in use, it might be necessary to draw a larger region. Drawing
 * implementation must use [method@Gdk.DrawContext.get_frame_region] to
 * query the region that must be drawn.
 * 
 * When using GTK, the widget system automatically places calls to
 * gdk_draw_context_begin_frame() and gdk_draw_context_end_frame() via the
 * use of [GskRenderer](../gsk4/class.Renderer.html)s, so application code
 * does not need to call these functions explicitly.
 *
 * @param region minimum region that should be drawn
 */
- (void)beginFrame:(const cairo_region_t*)region;

/**
 * Ends a drawing operation started with gdk_draw_context_begin_frame().
 * 
 * This makes the drawing available on screen.
 * See [method@Gdk.DrawContext.begin_frame] for more details about drawing.
 * 
 * When using a [class@Gdk.GLContext], this function may call `glFlush()`
 * implicitly before returning; it is not recommended to call `glFlush()`
 * explicitly before calling this function.
 *
 */
- (void)endFrame;

/**
 * Retrieves the `GdkDisplay` the @context is created for
 *
 * @return the `GdkDisplay`
 */
- (OGGdkDisplay*)display;

/**
 * Retrieves the region that is currently being repainted.
 * 
 * After a call to [method@Gdk.DrawContext.begin_frame] this function will
 * return a union of the region passed to that function and the area of the
 * surface that the @context determined needs to be repainted.
 * 
 * If @context is not in between calls to [method@Gdk.DrawContext.begin_frame]
 * and [method@Gdk.DrawContext.end_frame], %NULL will be returned.
 *
 * @return a Cairo region
 */
- (const cairo_region_t*)frameRegion;

/**
 * Retrieves the surface that @context is bound to.
 *
 * @return a `GdkSurface`
 */
- (OGGdkSurface*)surface;

/**
 * Returns %TRUE if @context is in the process of drawing to its surface.
 * 
 * This is the case between calls to [method@Gdk.DrawContext.begin_frame]
 * and [method@Gdk.DrawContext.end_frame]. In this situation, drawing commands
 * may be effecting the contents of the @context's surface.
 *
 * @return %TRUE if the context is between [method@Gdk.DrawContext.begin_frame]
 *   and [method@Gdk.DrawContext.end_frame] calls.
 */
- (bool)isInFrame;

@end