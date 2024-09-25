/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkDisplay;

/**
 * A singleton object that offers notification when displays appear or
 * disappear.
 * 
 * You can use [func@Gdk.DisplayManager.get] to obtain the `GdkDisplayManager`
 * singleton, but that should be rarely necessary. Typically, initializing
 * GTK opens a display that you can work with without ever accessing the
 * `GdkDisplayManager`.
 * 
 * The GDK library can be built with support for multiple backends.
 * The `GdkDisplayManager` object determines which backend is used
 * at runtime.
 * 
 * In the rare case that you need to influence which of the backends
 * is being used, you can use [func@Gdk.set_allowed_backends]. Note
 * that you need to call this function before initializing GTK.
 * 
 * ## Backend-specific code
 * 
 * When writing backend-specific code that is supposed to work with
 * multiple GDK backends, you have to consider both compile time and
 * runtime. At compile time, use the `GDK_WINDOWING_X11`, `GDK_WINDOWING_WIN32`
 * macros, etc. to find out which backends are present in the GDK library
 * you are building your application against. At runtime, use type-check
 * macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
 * 
 * ```c
 * #ifdef GDK_WINDOWING_X11
 *   if (GDK_IS_X11_DISPLAY (display))
 *     {
 *       // make X11-specific calls here
 *     }
 *   else
 * #endif
 * #ifdef GDK_WINDOWING_MACOS
 *   if (GDK_IS_MACOS_DISPLAY (display))
 *     {
 *       // make Quartz-specific calls here
 *     }
 *   else
 * #endif
 *   g_error ("Unsupported GDK backend");
 * ```
 *
 */
@interface OGGdkDisplayManager : OGObject
{

}

/**
 * Functions
 */

/**
 * Gets the singleton `GdkDisplayManager` object.
 * 
 * When called for the first time, this function consults the
 * `GDK_BACKEND` environment variable to find out which of the
 * supported GDK backends to use (in case GDK has been compiled
 * with multiple backends).
 * 
 * Applications can use [func@set_allowed_backends] to limit what
 * backends will be used.
 *
 * @return The global `GdkDisplayManager` singleton
 */
+ (OGGdkDisplayManager*)get;

/**
 * Methods
 */

- (GdkDisplayManager*)castedGObject;

/**
 * Gets the default `GdkDisplay`.
 *
 * @return a `GdkDisplay`
 */
- (OGGdkDisplay*)defaultDisplay;

/**
 * List all currently open displays.
 *
 * @return a newly
 *   allocated `GSList` of `GdkDisplay` objects
 */
- (GSList*)listDisplays;

/**
 * Opens a display.
 *
 * @param name the name of the display to open
 * @return a `GdkDisplay`, or %NULL
 *   if the display could not be opened
 */
- (OGGdkDisplay*)openDisplay:(OFString*)name;

/**
 * Sets @display as the default display.
 *
 * @param display a `GdkDisplay`
 */
- (void)setDefaultDisplay:(OGGdkDisplay*)display;

@end