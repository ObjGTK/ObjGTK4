/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGGdkGLContext;

/**
 * `GtkGLArea` is a widget that allows drawing with OpenGL.
 * 
 * ![An example GtkGLArea](glarea.png)
 * 
 * `GtkGLArea` sets up its own [class@Gdk.GLContext], and creates a custom
 * GL framebuffer that the widget will do GL rendering onto. It also ensures
 * that this framebuffer is the default GL rendering target when rendering.
 * The completed rendering is integrated into the larger GTK scene graph as
 * a texture.
 * 
 * In order to draw, you have to connect to the [signal@Gtk.GLArea::render]
 * signal, or subclass `GtkGLArea` and override the GtkGLAreaClass.render
 * virtual function.
 * 
 * The `GtkGLArea` widget ensures that the `GdkGLContext` is associated with
 * the widget's drawing area, and it is kept updated when the size and
 * position of the drawing area changes.
 * 
 * ## Drawing with GtkGLArea
 * 
 * The simplest way to draw using OpenGL commands in a `GtkGLArea` is to
 * create a widget instance and connect to the [signal@Gtk.GLArea::render] signal:
 * 
 * The `render()` function will be called when the `GtkGLArea` is ready
 * for you to draw its content:
 * 
 * The initial contents of the framebuffer are transparent.
 * 
 * ```c
 * static gboolean
 * render (GtkGLArea *area, GdkGLContext *context)
 * {
 *   // inside this function it's safe to use GL; the given
 *   // GdkGLContext has been made current to the drawable
 *   // surface used by the `GtkGLArea` and the viewport has
 *   // already been set to be the size of the allocation
 * 
 *   // we can start by clearing the buffer
 *   glClearColor (0, 0, 0, 0);
 *   glClear (GL_COLOR_BUFFER_BIT);
 * 
 *   // draw your object
 *   // draw_an_object ();
 * 
 *   // we completed our drawing; the draw commands will be
 *   // flushed at the end of the signal emission chain, and
 *   // the buffers will be drawn on the window
 *   return TRUE;
 * }
 * 
 * void setup_glarea (void)
 * {
 *   // create a GtkGLArea instance
 *   GtkWidget *gl_area = gtk_gl_area_new ();
 * 
 *   // connect to the "render" signal
 *   g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
 * }
 * ```
 * 
 * If you need to initialize OpenGL state, e.g. buffer objects or
 * shaders, you should use the [signal@Gtk.Widget::realize] signal;
 * you can use the [signal@Gtk.Widget::unrealize] signal to clean up.
 * Since the `GdkGLContext` creation and initialization may fail, you
 * will need to check for errors, using [method@Gtk.GLArea.get_error].
 * 
 * An example of how to safely initialize the GL state is:
 * 
 * ```c
 * static void
 * on_realize (GtkGLarea *area)
 * {
 *   // We need to make the context current if we want to
 *   // call GL API
 *   gtk_gl_area_make_current (area);
 * 
 *   // If there were errors during the initialization or
 *   // when trying to make the context current, this
 *   // function will return a GError for you to catch
 *   if (gtk_gl_area_get_error (area) != NULL)
 *     return;
 * 
 *   // You can also use gtk_gl_area_set_error() in order
 *   // to show eventual initialization errors on the
 *   // GtkGLArea widget itself
 *   GError *internal_error = NULL;
 *   init_buffer_objects (&error);
 *   if (error != NULL)
 *     {
 *       gtk_gl_area_set_error (area, error);
 *       g_error_free (error);
 *       return;
 *     }
 * 
 *   init_shaders (&error);
 *   if (error != NULL)
 *     {
 *       gtk_gl_area_set_error (area, error);
 *       g_error_free (error);
 *       return;
 *     }
 * }
 * ```
 * 
 * If you need to change the options for creating the `GdkGLContext`
 * you should use the [signal@Gtk.GLArea::create-context] signal.
 *
 */
@interface OGTKGLArea : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGLArea*)castedGObject;

/**
 * Binds buffers to the framebuffer.
 * 
 * Ensures that the @area framebuffer object is made the current draw
 * and read target, and that all the required buffers for the @area
 * are created and bound to the framebuffer.
 * 
 * This function is automatically called before emitting the
 * [signal@Gtk.GLArea::render] signal, and doesn't normally need to be
 * called by application code.
 *
 */
- (void)attachBuffers;

/**
 * Gets the allowed APIs.
 * 
 * See [method@Gtk.GLArea.set_allowed_apis].
 *
 * @return the allowed APIs
 */
- (GdkGLAPI)allowedApis;

/**
 * Gets the API that is currently in use.
 * 
 * If the GL area has not been realized yet, 0 is returned.
 *
 * @return the currently used API
 */
- (GdkGLAPI)api;

/**
 * Returns whether the area is in auto render mode or not.
 *
 * @return %TRUE if the @area is auto rendering, %FALSE otherwise
 */
- (bool)autoRender;

/**
 * Retrieves the `GdkGLContext` used by @area.
 *
 * @return the `GdkGLContext`
 */
- (OGGdkGLContext*)context;

/**
 * Gets the current error set on the @area.
 *
 * @return the `GError`
 */
- (GError*)error;

/**
 * Returns whether the area has a depth buffer.
 *
 * @return %TRUE if the @area has a depth buffer, %FALSE otherwise
 */
- (bool)hasDepthBuffer;

/**
 * Returns whether the area has a stencil buffer.
 *
 * @return %TRUE if the @area has a stencil buffer, %FALSE otherwise
 */
- (bool)hasStencilBuffer;

/**
 * Retrieves the required version of OpenGL.
 * 
 * See [method@Gtk.GLArea.set_required_version].
 *
 * @param major return location for the required major version
 * @param minor return location for the required minor version
 */
- (void)requiredVersionWithMajor:(int*)major minor:(int*)minor;

/**
 * Returns whether the `GtkGLArea` should use OpenGL ES.
 * 
 * See [method@Gtk.GLArea.set_use_es].
 *
 * @return %TRUE if the `GtkGLArea` should create an OpenGL ES context
 *   and %FALSE otherwise
 */
- (bool)useEs;

/**
 * Ensures that the `GdkGLContext` used by @area is associated with
 * the `GtkGLArea`.
 * 
 * This function is automatically called before emitting the
 * [signal@Gtk.GLArea::render] signal, and doesn't normally need
 * to be called by application code.
 *
 */
- (void)makeCurrent;

/**
 * Marks the currently rendered data (if any) as invalid, and queues
 * a redraw of the widget.
 * 
 * This ensures that the [signal@Gtk.GLArea::render] signal
 * is emitted during the draw.
 * 
 * This is only needed when [method@Gtk.GLArea.set_auto_render] has
 * been called with a %FALSE value. The default behaviour is to
 * emit [signal@Gtk.GLArea::render] on each draw.
 *
 */
- (void)queueRender;

/**
 * Sets the allowed APIs to create a context with.
 * 
 * You should check [property@Gtk.GLArea:api] before drawing
 * with either API.
 * 
 * By default, all APIs are allowed.
 *
 * @param apis the allowed APIs
 */
- (void)setAllowedApis:(GdkGLAPI)apis;

/**
 * Sets whether the `GtkGLArea` is in auto render mode.
 * 
 * If @auto_render is %TRUE the [signal@Gtk.GLArea::render] signal will
 * be emitted every time the widget draws. This is the default and is
 * useful if drawing the widget is faster.
 * 
 * If @auto_render is %FALSE the data from previous rendering is kept
 * around and will be used for drawing the widget the next time,
 * unless the window is resized. In order to force a rendering
 * [method@Gtk.GLArea.queue_render] must be called. This mode is
 * useful when the scene changes seldom, but takes a long time to redraw.
 *
 * @param autoRender a boolean
 */
- (void)setAutoRender:(bool)autoRender;

/**
 * Sets an error on the area which will be shown instead of the
 * GL rendering.
 * 
 * This is useful in the [signal@Gtk.GLArea::create-context]
 * signal if GL context creation fails.
 *
 * @param error a new `GError`, or %NULL to unset the error
 */
- (void)setError:(const GError*)error;

/**
 * Sets whether the `GtkGLArea` should use a depth buffer.
 * 
 * If @has_depth_buffer is %TRUE the widget will allocate and
 * enable a depth buffer for the target framebuffer. Otherwise
 * there will be none.
 *
 * @param hasDepthBuffer %TRUE to add a depth buffer
 */
- (void)setHasDepthBuffer:(bool)hasDepthBuffer;

/**
 * Sets whether the `GtkGLArea` should use a stencil buffer.
 * 
 * If @has_stencil_buffer is %TRUE the widget will allocate and
 * enable a stencil buffer for the target framebuffer. Otherwise
 * there will be none.
 *
 * @param hasStencilBuffer %TRUE to add a stencil buffer
 */
- (void)setHasStencilBuffer:(bool)hasStencilBuffer;

/**
 * Sets the required version of OpenGL to be used when creating
 * the context for the widget.
 * 
 * This function must be called before the area has been realized.
 *
 * @param major the major version
 * @param minor the minor version
 */
- (void)setRequiredVersionWithMajor:(int)major minor:(int)minor;

/**
 * Sets whether the @area should create an OpenGL or an OpenGL ES context.
 * 
 * You should check the capabilities of the `GdkGLContext` before drawing
 * with either API.
 *
 * @param useEs whether to use OpenGL or OpenGL ES
 */
- (void)setUseEs:(bool)useEs;

@end