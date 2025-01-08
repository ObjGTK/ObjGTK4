/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDrawContext.h"

@class OGdkDisplay;
@class OGdkSurface;

/**
 * `GdkGLContext` is an object representing a platform-specific
 * OpenGL draw context.
 * 
 * `GdkGLContext`s are created for a surface using
 * [method@Gdk.Surface.create_gl_context], and the context will match
 * the characteristics of the surface.
 * 
 * A `GdkGLContext` is not tied to any particular normal framebuffer.
 * For instance, it cannot draw to the surface back buffer. The GDK
 * repaint system is in full control of the painting to that. Instead,
 * you can create render buffers or textures and use [func@cairo_draw_from_gl]
 * in the draw function of your widget to draw them. Then GDK will handle
 * the integration of your rendering with that of other widgets.
 * 
 * Support for `GdkGLContext` is platform-specific and context creation
 * can fail, returning %NULL context.
 * 
 * A `GdkGLContext` has to be made "current" in order to start using
 * it, otherwise any OpenGL call will be ignored.
 * 
 * ## Creating a new OpenGL context
 * 
 * In order to create a new `GdkGLContext` instance you need a `GdkSurface`,
 * which you typically get during the realize call of a widget.
 * 
 * A `GdkGLContext` is not realized until either [method@Gdk.GLContext.make_current]
 * or [method@Gdk.GLContext.realize] is called. It is possible to specify
 * details of the GL context like the OpenGL version to be used, or whether
 * the GL context should have extra state validation enabled after calling
 * [method@Gdk.Surface.create_gl_context] by calling [method@Gdk.GLContext.realize].
 * If the realization fails you have the option to change the settings of
 * the `GdkGLContext` and try again.
 * 
 * ## Using a GdkGLContext
 * 
 * You will need to make the `GdkGLContext` the current context before issuing
 * OpenGL calls; the system sends OpenGL commands to whichever context is current.
 * It is possible to have multiple contexts, so you always need to ensure that
 * the one which you want to draw with is the current one before issuing commands:
 * 
 * ```c
 * gdk_gl_context_make_current (context);
 * ```
 * 
 * You can now perform your drawing using OpenGL commands.
 * 
 * You can check which `GdkGLContext` is the current one by using
 * [func@Gdk.GLContext.get_current]; you can also unset any `GdkGLContext`
 * that is currently set by calling [func@Gdk.GLContext.clear_current].
 *
 */
@interface OGdkGLContext : OGdkDrawContext
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Clears the current `GdkGLContext`.
 * 
 * Any OpenGL call after this function returns will be ignored
 * until [method@Gdk.GLContext.make_current] is called.
 *
 */
+ (void)clearCurrent;

/**
 * Retrieves the current `GdkGLContext`.
 *
 * @return the current `GdkGLContext`
 */
+ (OGdkGLContext*)current;

/**
 * Methods
 */

- (GdkGLContext*)castedGObject;

/**
 * Gets the allowed APIs set via gdk_gl_context_set_allowed_apis().
 *
 * @return the allowed APIs
 */
- (GdkGLAPI)allowedApis;

/**
 * Gets the API currently in use.
 * 
 * If the renderer has not been realized yet, 0 is returned.
 *
 * @return the currently used API
 */
- (GdkGLAPI)api;

/**
 * Retrieves whether the context is doing extra validations and runtime checking.
 * 
 * See [method@Gdk.GLContext.set_debug_enabled].
 *
 * @return %TRUE if debugging is enabled
 */
- (bool)debugEnabled;

/**
 * Retrieves the display the @context is created for
 *
 * @return a `GdkDisplay`
 */
- (OGdkDisplay*)display;

/**
 * Retrieves whether the context is forward-compatible.
 * 
 * See [method@Gdk.GLContext.set_forward_compatible].
 *
 * @return %TRUE if the context should be forward-compatible
 */
- (bool)forwardCompatible;

/**
 * Retrieves required OpenGL version set as a requirement for the @context
 * realization. It will not change even if a greater OpenGL version is supported
 * and used after the @context is realized. See
 * [method@Gdk.GLContext.get_version] for the real version in use.
 * 
 * See [method@Gdk.GLContext.set_required_version].
 *
 * @param major return location for the major version to request
 * @param minor return location for the minor version to request
 */
- (void)requiredVersionWithMajor:(int*)major minor:(int*)minor;

/**
 * Used to retrieves the `GdkGLContext` that this @context share data with.
 * 
 * As many contexts can share data now and no single shared context exists
 * anymore, this function has been deprecated and now always returns %NULL.
 *
 * @return %NULL
 */
- (OGdkGLContext*)sharedContext;

/**
 * Retrieves the surface used by the @context.
 *
 * @return a `GdkSurface`
 */
- (OGdkSurface*)surface;

/**
 * Checks whether the @context is using an OpenGL or OpenGL ES profile.
 *
 * @return %TRUE if the `GdkGLContext` is using an OpenGL ES profile;
 * %FALSE if other profile is in use of if the @context has not yet
 * been realized.
 */
- (bool)useEs;

/**
 * Retrieves the OpenGL version of the @context.
 * 
 * The @context must be realized prior to calling this function.
 *
 * @param major return location for the major version
 * @param minor return location for the minor version
 */
- (void)versionWithMajor:(int*)major minor:(int*)minor;

/**
 * Whether the `GdkGLContext` is in legacy mode or not.
 * 
 * The `GdkGLContext` must be realized before calling this function.
 * 
 * When realizing a GL context, GDK will try to use the OpenGL 3.2 core
 * profile; this profile removes all the OpenGL API that was deprecated
 * prior to the 3.2 version of the specification. If the realization is
 * successful, this function will return %FALSE.
 * 
 * If the underlying OpenGL implementation does not support core profiles,
 * GDK will fall back to a pre-3.2 compatibility profile, and this function
 * will return %TRUE.
 * 
 * You can use the value returned by this function to decide which kind
 * of OpenGL API to use, or whether to do extension discovery, or what
 * kind of shader programs to load.
 *
 * @return %TRUE if the GL context is in legacy mode
 */
- (bool)isLegacy;

/**
 * Checks if the two GL contexts can share resources.
 * 
 * When they can, the texture IDs from @other can be used in @self. This
 * is particularly useful when passing `GdkGLTexture` objects between
 * different contexts.
 * 
 * Contexts created for the same display with the same properties will
 * always be compatible, even if they are created for different surfaces.
 * For other contexts it depends on the GL backend.
 * 
 * Both contexts must be realized for this check to succeed. If either one
 * is not, this function will return %FALSE.
 *
 * @param other the `GdkGLContext` that should be compatible with @self
 * @return %TRUE if the two GL contexts are compatible.
 */
- (bool)isShared:(OGdkGLContext*)other;

/**
 * Makes the @context the current one.
 *
 */
- (void)makeCurrent;

/**
 * Realizes the given `GdkGLContext`.
 * 
 * It is safe to call this function on a realized `GdkGLContext`.
 *
 * @return %TRUE if the context is realized
 */
- (bool)realize;

/**
 * Sets the allowed APIs. When gdk_gl_context_realize() is called, only the
 * allowed APIs will be tried. If you set this to 0, realizing will always fail.
 * 
 * If you set it on a realized context, the property will not have any effect.
 * It is only relevant during gdk_gl_context_realize().
 * 
 * By default, all APIs are allowed.
 *
 * @param apis the allowed APIs
 */
- (void)setAllowedApis:(GdkGLAPI)apis;

/**
 * Sets whether the `GdkGLContext` should perform extra validations and
 * runtime checking.
 * 
 * This is useful during development, but has additional overhead.
 * 
 * The `GdkGLContext` must not be realized or made current prior to
 * calling this function.
 *
 * @param enabled whether to enable debugging in the context
 */
- (void)setDebugEnabled:(bool)enabled;

/**
 * Sets whether the `GdkGLContext` should be forward-compatible.
 * 
 * Forward-compatible contexts must not support OpenGL functionality that
 * has been marked as deprecated in the requested version; non-forward
 * compatible contexts, on the other hand, must support both deprecated and
 * non deprecated functionality.
 * 
 * The `GdkGLContext` must not be realized or made current prior to calling
 * this function.
 *
 * @param compatible whether the context should be forward-compatible
 */
- (void)setForwardCompatible:(bool)compatible;

/**
 * Sets the major and minor version of OpenGL to request.
 * 
 * Setting @major and @minor to zero will use the default values.
 * 
 * Setting @major and @minor lower than the minimum versions required
 * by GTK will result in the context choosing the minimum version.
 * 
 * The @context must not be realized or made current prior to calling
 * this function.
 *
 * @param major the major version to request
 * @param minor the minor version to request
 */
- (void)setRequiredVersionWithMajor:(int)major minor:(int)minor;

/**
 * Requests that GDK create an OpenGL ES context instead of an OpenGL one.
 * 
 * Not all platforms support OpenGL ES.
 * 
 * The @context must not have been realized.
 * 
 * By default, GDK will attempt to automatically detect whether the
 * underlying GL implementation is OpenGL or OpenGL ES once the @context
 * is realized.
 * 
 * You should check the return value of [method@Gdk.GLContext.get_use_es]
 * after calling [method@Gdk.GLContext.realize] to decide whether to use
 * the OpenGL or OpenGL ES API, extensions, or shaders.
 *
 * @param useEs whether the context should use OpenGL ES instead of OpenGL,
 *   or -1 to allow auto-detection
 */
- (void)setUseEs:(int)useEs;

@end