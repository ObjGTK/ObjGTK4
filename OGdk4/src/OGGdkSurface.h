/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkFrameClock;
@class OGGdkDisplay;
@class OGGdkDevice;
@class OGGdkCairoContext;
@class OGGdkVulkanContext;
@class OGGdkGLContext;
@class OGGdkCursor;

/**
 * A `GdkSurface` is a rectangular region on the screen.
 * 
 * It’s a low-level object, used to implement high-level objects
 * such as [GtkWindow](../gtk4/class.Window.html).
 * 
 * The surfaces you see in practice are either [iface@Gdk.Toplevel] or
 * [iface@Gdk.Popup], and those interfaces provide much of the required
 * API to interact with these surfaces. Other, more specialized surface
 * types exist, but you will rarely interact with them directly.
 *
 */
@interface OGGdkSurface : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initPopupWithParent:(OGGdkSurface*)parent autohide:(bool)autohide;
- (instancetype)initToplevel:(OGGdkDisplay*)display;

/**
 * Methods
 */

- (GdkSurface*)castedGObject;

/**
 * Emits a short beep associated to @surface.
 * 
 * If the display of @surface does not support per-surface beeps,
 * emits a short beep on the display just as [method@Gdk.Display.beep].
 *
 */
- (void)beep;

/**
 * Creates a new `GdkCairoContext` for rendering on @surface.
 *
 * @return the newly created `GdkCairoContext`
 */
- (OGGdkCairoContext*)createCairoContext;

/**
 * Creates a new `GdkGLContext` for the `GdkSurface`.
 * 
 * The context is disconnected from any particular surface or surface.
 * If the creation of the `GdkGLContext` failed, @error will be set.
 * Before using the returned `GdkGLContext`, you will need to
 * call [method@Gdk.GLContext.make_current] or [method@Gdk.GLContext.realize].
 *
 * @return the newly created `GdkGLContext`
 */
- (OGGdkGLContext*)createGlContext;

/**
 * Create a new Cairo surface that is as compatible as possible with the
 * given @surface.
 * 
 * For example the new surface will have the same fallback resolution
 * and font options as @surface. Generally, the new surface will also
 * use the same backend as @surface, unless that is not possible for
 * some reason. The type of the returned surface may be examined with
 * cairo_surface_get_type().
 * 
 * Initially the surface contents are all 0 (transparent if contents
 * have transparency, black otherwise.)
 * 
 * This function always returns a valid pointer, but it will return a
 * pointer to a “nil” surface if @other is already in an error state
 * or any other error occurs.
 *
 * @param content the content for the new surface
 * @param width width of the new surface
 * @param height height of the new surface
 * @return a pointer to the newly allocated surface. The caller
 *   owns the surface and should call cairo_surface_destroy() when done
 *   with it.
 */
- (cairo_surface_t*)createSimilarSurfaceWithContent:(cairo_content_t)content width:(int)width height:(int)height;

/**
 * Sets an error and returns %NULL.
 *
 * @return %NULL
 */
- (OGGdkVulkanContext*)createVulkanContext;

/**
 * Destroys the window system resources associated with @surface and
 * decrements @surface's reference count.
 * 
 * The window system resources for all children of @surface are also
 * destroyed, but the children’s reference counts are not decremented.
 * 
 * Note that a surface will not be destroyed automatically when its
 * reference count reaches zero. You must call this function yourself
 * before that happens.
 *
 */
- (void)destroy;

/**
 * Retrieves a `GdkCursor` pointer for the cursor currently set on the
 * `GdkSurface`.
 * 
 * If the return value is %NULL then there is no custom cursor set on
 * the surface, and it is using the cursor for its parent surface.
 * 
 * Use [method@Gdk.Surface.set_cursor] to unset the cursor of the surface.
 *
 * @return a `GdkCursor`
 */
- (OGGdkCursor*)cursor;

/**
 * Retrieves a `GdkCursor` pointer for the @device currently set on the
 * specified `GdkSurface`.
 * 
 * If the return value is %NULL then there is no custom cursor set on the
 * specified surface, and it is using the cursor for its parent surface.
 * 
 * Use [method@Gdk.Surface.set_cursor] to unset the cursor of the surface.
 *
 * @param device a pointer `GdkDevice`
 * @return a `GdkCursor`
 */
- (OGGdkCursor*)deviceCursor:(OGGdkDevice*)device;

/**
 * Obtains the current device position and modifier state.
 * 
 * The position is given in coordinates relative to the upper
 * left corner of @surface.
 *
 * @param device pointer `GdkDevice` to query to
 * @param x return location for the X coordinate of @device
 * @param y return location for the Y coordinate of @device
 * @param mask return location for the modifier mask
 * @return %TRUE if the device is over the surface
 */
- (bool)devicePositionWithDevice:(OGGdkDevice*)device x:(double*)x y:(double*)y mask:(GdkModifierType*)mask;

/**
 * Gets the `GdkDisplay` associated with a `GdkSurface`.
 *
 * @return the `GdkDisplay` associated with @surface
 */
- (OGGdkDisplay*)display;

/**
 * Gets the frame clock for the surface.
 * 
 * The frame clock for a surface never changes unless the surface is
 * reparented to a new toplevel surface.
 *
 * @return the frame clock
 */
- (OGGdkFrameClock*)frameClock;

/**
 * Returns the height of the given @surface.
 * 
 * Surface size is reported in ”application pixels”, not
 * ”device pixels” (see [method@Gdk.Surface.get_scale_factor]).
 *
 * @return The height of @surface
 */
- (int)height;

/**
 * Checks whether the surface has been mapped.
 * 
 * A surface is mapped with [method@Gdk.Toplevel.present]
 * or [method@Gdk.Popup.present].
 *
 * @return %TRUE if the surface is mapped
 */
- (bool)mapped;

/**
 * Returns the internal scale that maps from surface coordinates
 * to the actual device pixels.
 * 
 * When the scale is bigger than 1, the windowing system prefers to get
 * buffers with a resolution that is bigger than the surface size (e.g.
 * to show the surface on a high-resolution display, or in a magnifier).
 * 
 * Compare with [method@Gdk.Surface.get_scale_factor], which returns the
 * next larger integer.
 * 
 * The scale may change during the lifetime of the surface.
 *
 * @return the scale
 */
- (double)scale;

/**
 * Returns the internal scale factor that maps from surface coordinates
 * to the actual device pixels.
 * 
 * On traditional systems this is 1, but on very high density outputs
 * this can be a higher value (often 2). A higher value means that drawing
 * is automatically scaled up to a higher resolution, so any code doing
 * drawing will automatically look nicer. However, if you are supplying
 * pixel-based data the scale value can be used to determine whether to
 * use a pixel resource with higher resolution data.
 * 
 * The scale factor may change during the lifetime of the surface.
 *
 * @return the scale factor
 */
- (int)scaleFactor;

/**
 * Returns the width of the given @surface.
 * 
 * Surface size is reported in ”application pixels”, not
 * ”device pixels” (see [method@Gdk.Surface.get_scale_factor]).
 *
 * @return The width of @surface
 */
- (int)width;

/**
 * Hide the surface.
 * 
 * For toplevel surfaces, withdraws them, so they will no longer be
 * known to the window manager; for all surfaces, unmaps them, so
 * they won’t be displayed. Normally done automatically as
 * part of [gtk_widget_hide()](../gtk4/method.Widget.hide.html).
 *
 */
- (void)hide;

/**
 * Check to see if a surface is destroyed.
 *
 * @return %TRUE if the surface is destroyed
 */
- (bool)isDestroyed;

/**
 * Forces a [signal@Gdk.Surface::render] signal emission for @surface
 * to be scheduled.
 * 
 * This function is useful for implementations that track invalid
 * regions on their own.
 *
 */
- (void)queueRender;

/**
 * Request a layout phase from the surface's frame clock.
 * 
 * See [method@Gdk.FrameClock.request_phase].
 *
 */
- (void)requestLayout;

/**
 * Sets the default mouse pointer for a `GdkSurface`.
 * 
 * Passing %NULL for the @cursor argument means that @surface will use
 * the cursor of its parent surface. Most surfaces should use this default.
 * Note that @cursor must be for the same display as @surface.
 * 
 * Use [ctor@Gdk.Cursor.new_from_name] or [ctor@Gdk.Cursor.new_from_texture]
 * to create the cursor. To make the cursor invisible, use %GDK_BLANK_CURSOR.
 *
 * @param cursor a `GdkCursor`
 */
- (void)setCursor:(OGGdkCursor*)cursor;

/**
 * Sets a specific `GdkCursor` for a given device when it gets inside @surface.
 * 
 * Passing %NULL for the @cursor argument means that @surface will use the
 * cursor of its parent surface. Most surfaces should use this default.
 * 
 * Use [ctor@Gdk.Cursor.new_from_name] or [ctor@Gdk.Cursor.new_from_texture]
 * to create the cursor. To make the cursor invisible, use %GDK_BLANK_CURSOR.
 *
 * @param device a pointer `GdkDevice`
 * @param cursor a `GdkCursor`
 */
- (void)setDeviceCursorWithDevice:(OGGdkDevice*)device cursor:(OGGdkCursor*)cursor;

/**
 * Apply the region to the surface for the purpose of event
 * handling.
 * 
 * Mouse events which happen while the pointer position corresponds
 * to an unset bit in the mask will be passed on the surface below
 * @surface.
 * 
 * An input region is typically used with RGBA surfaces. The alpha
 * channel of the surface defines which pixels are invisible and
 * allows for nicely antialiased borders, and the input region
 * controls where the surface is “clickable”.
 * 
 * Use [method@Gdk.Display.supports_input_shapes] to find out if
 * a particular backend supports input regions.
 *
 * @param region region of surface to be reactive
 */
- (void)setInputRegion:(cairo_region_t*)region;

/**
 * Marks a region of the `GdkSurface` as opaque.
 * 
 * For optimisation purposes, compositing window managers may
 * like to not draw obscured regions of surfaces, or turn off blending
 * during for these regions. With RGB windows with no transparency,
 * this is just the shape of the window, but with ARGB32 windows, the
 * compositor does not know what regions of the window are transparent
 * or not.
 * 
 * This function only works for toplevel surfaces.
 * 
 * GTK will update this property automatically if the @surface background
 * is opaque, as we know where the opaque regions are. If your surface
 * background is not opaque, please update this property in your
 * [GtkWidgetClass.css_changed](../gtk4/vfunc.Widget.css_changed.html) handler.
 *
 * @param region a region, or %NULL to make the entire
 *   surface opaque
 */
- (void)setOpaqueRegion:(cairo_region_t*)region;

/**
 * Translates coordinates between two surfaces.
 * 
 * Note that this only works if @to and @from are popups or
 * transient-for to the same toplevel (directly or indirectly).
 *
 * @param to the target surface
 * @param x coordinates to translate
 * @param y coordinates to translate
 * @return %TRUE if the coordinates were successfully translated
 */
- (bool)translateCoordinatesWithTo:(OGGdkSurface*)to x:(double*)x y:(double*)y;

@end