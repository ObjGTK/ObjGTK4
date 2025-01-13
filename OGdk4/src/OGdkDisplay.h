/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGdkAppLaunchContext;
@class OGdkClipboard;
@class OGdkDevice;
@class OGdkGLContext;
@class OGdkMonitor;
@class OGdkSeat;
@class OGdkSurface;

/**
 * `GdkDisplay` objects are the GDK representation of a workstation.
 * 
 * Their purpose are two-fold:
 * 
 * - To manage and provide information about input devices (pointers, keyboards, etc)
 * - To manage and provide information about output devices (monitors, projectors, etc)
 * 
 * Most of the input device handling has been factored out into separate
 * [class@Gdk.Seat] objects. Every display has a one or more seats, which
 * can be accessed with [method@Gdk.Display.get_default_seat] and
 * [method@Gdk.Display.list_seats].
 * 
 * Output devices are represented by [class@Gdk.Monitor] objects, which can
 * be accessed with [method@Gdk.Display.get_monitor_at_surface] and similar APIs.
 *
 */
@interface OGdkDisplay : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Gets the default `GdkDisplay`.
 * 
 * This is a convenience function for:
 * 
 *     gdk_display_manager_get_default_display (gdk_display_manager_get ())
 *
 * @return a `GdkDisplay`, or %NULL if
 *   there is no default display
 */
+ (OGdkDisplay*)default;

/**
 * Opens a display.
 * 
 * If opening the display fails, `NULL` is returned.
 *
 * @param displayName the name of the display to open
 * @return a `GdkDisplay`
 */
+ (OGdkDisplay*)openWithDisplayName:(OFString*)displayName;

/**
 * Methods
 */

- (GdkDisplay*)castedGObject;

/**
 * Emits a short beep on @display
 *
 */
- (void)beep;

/**
 * Closes the connection to the windowing system for the given display.
 * 
 * This cleans up associated resources.
 *
 */
- (void)close;

/**
 * Creates a new `GdkGLContext` for the `GdkDisplay`.
 * 
 * The context is disconnected from any particular surface or surface
 * and cannot be used to draw to any surface. It can only be used to
 * draw to non-surface framebuffers like textures.
 * 
 * If the creation of the `GdkGLContext` failed, @error will be set.
 * Before using the returned `GdkGLContext`, you will need to
 * call [method@Gdk.GLContext.make_current] or [method@Gdk.GLContext.realize].
 *
 * @return the newly created `GdkGLContext`
 */
- (OGdkGLContext*)createGlContext;

/**
 * Returns %TRUE if there is an ongoing grab on @device for @display.
 *
 * @param device a `GdkDevice`
 * @return %TRUE if there is a grab in effect for @device.
 */
- (bool)deviceIsGrabbedWithDevice:(OGdkDevice*)device;

/**
 * Flushes any requests queued for the windowing system.
 * 
 * This happens automatically when the main loop blocks waiting for new events,
 * but if your application is drawing without returning control to the main loop,
 * you may need to call this function explicitly. A common case where this function
 * needs to be called is when an application is executing drawing commands
 * from a thread other than the thread where the main loop is running.
 * 
 * This is most useful for X11. On windowing systems where requests are
 * handled synchronously, this function will do nothing.
 *
 */
- (void)flush;

/**
 * Returns a `GdkAppLaunchContext` suitable for launching
 * applications on the given display.
 *
 * @return a new `GdkAppLaunchContext` for @display
 */
- (OGdkAppLaunchContext*)appLaunchContext;

/**
 * Gets the clipboard used for copy/paste operations.
 *
 * @return the display's clipboard
 */
- (OGdkClipboard*)clipboard;

/**
 * Returns the default `GdkSeat` for this display.
 * 
 * Note that a display may not have a seat. In this case,
 * this function will return %NULL.
 *
 * @return the default seat.
 */
- (OGdkSeat*)defaultSeat;

/**
 * Returns the dma-buf formats that are supported on this display.
 * 
 * GTK may use OpenGL or Vulkan to support some formats.
 * Calling this function will then initialize them if they aren't yet.
 * 
 * The formats returned by this function can be used for negotiating
 * buffer formats with producers such as v4l, pipewire or GStreamer.
 * 
 * To learn more about dma-bufs, see [class@Gdk.DmabufTextureBuilder].
 *
 * @return a `GdkDmabufFormats` object
 */
- (GdkDmabufFormats*)dmabufFormats;

/**
 * Gets the monitor in which the largest area of @surface
 * resides.
 *
 * @param surface a `GdkSurface`
 * @return the monitor with the largest
 *   overlap with @surface
 */
- (OGdkMonitor*)monitorAtSurface:(OGdkSurface*)surface;

/**
 * Gets the list of monitors associated with this display.
 * 
 * Subsequent calls to this function will always return the
 * same list for the same display.
 * 
 * You can listen to the GListModel::items-changed signal on
 * this list to monitor changes to the monitor of this display.
 *
 * @return a `GListModel` of `GdkMonitor`
 */
- (GListModel*)monitors;

/**
 * Gets the name of the display.
 *
 * @return a string representing the display name. This string is owned
 *   by GDK and should not be modified or freed.
 */
- (OFString*)name;

/**
 * Gets the clipboard used for the primary selection.
 * 
 * On backends where the primary clipboard is not supported natively,
 * GDK emulates this clipboard locally.
 *
 * @return the primary clipboard
 */
- (OGdkClipboard*)primaryClipboard;

/**
 * Retrieves a desktop-wide setting such as double-click time
 * for the @display.
 *
 * @param name the name of the setting
 * @param value location to store the value of the setting
 * @return %TRUE if the setting existed and a value was stored
 *   in @value, %FALSE otherwise
 */
- (bool)settingWithName:(OFString*)name value:(GValue*)value;

/**
 * Gets the startup notification ID for a Wayland display, or %NULL
 * if no ID has been defined.
 *
 * @return the startup notification ID for @display
 */
- (OFString*)startupNotificationId;

/**
 * Finds out if the display has been closed.
 *
 * @return %TRUE if the display is closed.
 */
- (bool)isClosed;

/**
 * Returns whether surfaces can reasonably be expected to have
 * their alpha channel drawn correctly on the screen.
 * 
 * Check [method@Gdk.Display.is_rgba] for whether the display
 * supports an alpha channel.
 * 
 * On X11 this function returns whether a compositing manager is
 * compositing on @display.
 * 
 * On modern displays, this value is always %TRUE.
 *
 * @return Whether surfaces with RGBA visuals can reasonably
 *   be expected to have their alpha channels drawn correctly
 *   on the screen.
 */
- (bool)isComposited;

/**
 * Returns whether surfaces on this @display are created with an
 * alpha channel.
 * 
 * Even if a %TRUE is returned, it is possible that the
 * surface’s alpha channel won’t be honored when displaying the
 * surface on the screen: in particular, for X an appropriate
 * windowing manager and compositing manager must be running to
 * provide appropriate display. Use [method@Gdk.Display.is_composited]
 * to check if that is the case.
 * 
 * On modern displays, this value is always %TRUE.
 *
 * @return %TRUE if surfaces are created with an alpha channel or
 *   %FALSE if the display does not support this functionality.
 */
- (bool)isRgba;

/**
 * Returns the list of seats known to @display.
 *
 * @return the
 *   list of seats known to the `GdkDisplay`
 */
- (GList*)listSeats;

/**
 * Returns the keyvals bound to @keycode.
 * 
 * The Nth `GdkKeymapKey` in @keys is bound to the Nth keyval in @keyvals.
 * 
 * When a keycode is pressed by the user, the keyval from
 * this list of entries is selected by considering the effective
 * keyboard group and level.
 * 
 * Free the returned arrays with g_free().
 *
 * @param keycode a keycode
 * @param keys return
 *   location for array of `GdkKeymapKey`
 * @param keyvals return
 *   location for array of keyvals
 * @param nentries length of @keys and @keyvals
 * @return %TRUE if there were any entries
 */
- (bool)mapKeycode:(guint)keycode keys:(GdkKeymapKey**)keys keyvals:(guint**)keyvals nentries:(int*)nentries;

/**
 * Obtains a list of keycode/group/level combinations that will
 * generate @keyval.
 * 
 * Groups and levels are two kinds of keyboard mode; in general, the level
 * determines whether the top or bottom symbol on a key is used, and the
 * group determines whether the left or right symbol is used.
 * 
 * On US keyboards, the shift key changes the keyboard level, and there
 * are no groups. A group switch key might convert a keyboard between
 * Hebrew to English modes, for example.
 * 
 * `GdkEventKey` contains a %group field that indicates the active
 * keyboard group. The level is computed from the modifier mask.
 * 
 * The returned array should be freed with g_free().
 *
 * @param keyval a keyval, such as %GDK_KEY_a, %GDK_KEY_Up, %GDK_KEY_Return, etc.
 * @param keys return location
 *   for an array of `GdkKeymapKey`
 * @param nkeys return location for number of elements in returned array
 * @return %TRUE if keys were found and returned
 */
- (bool)mapKeyval:(guint)keyval keys:(GdkKeymapKey**)keys nkeys:(int*)nkeys;

/**
 * Indicates to the GUI environment that the application has
 * finished loading, using a given identifier.
 * 
 * GTK will call this function automatically for [GtkWindow](../gtk4/class.Window.html)
 * with custom startup-notification identifier unless
 * [gtk_window_set_auto_startup_notification()](../gtk4/method.Window.set_auto_startup_notification.html)
 * is called to disable that feature.
 *
 * @param startupId a startup-notification identifier, for which
 *   notification process should be completed
 */
- (void)notifyStartupCompleteWithStartupId:(OFString*)startupId;

/**
 * Checks that OpenGL is available for @self and ensures that it is
 * properly initialized.
 * When this fails, an @error will be set describing the error and this
 * function returns %FALSE.
 * 
 * Note that even if this function succeeds, creating a `GdkGLContext`
 * may still fail.
 * 
 * This function is idempotent. Calling it multiple times will just
 * return the same value or error.
 * 
 * You never need to call this function, GDK will call it automatically
 * as needed. But you can use it as a check when setting up code that
 * might make use of OpenGL.
 *
 * @return %TRUE if the display supports OpenGL
 */
- (bool)prepareGl;

/**
 * Adds the given event to the event queue for @display.
 *
 * @param event a `GdkEvent`
 */
- (void)putEvent:(GdkEvent*)event;

/**
 * Returns %TRUE if the display supports input shapes.
 * 
 * This means that [method@Gdk.Surface.set_input_region] can
 * be used to modify the input shape of surfaces on @display.
 * 
 * On modern displays, this value is always %TRUE.
 *
 * @return %TRUE if surfaces with modified input shape are supported
 */
- (bool)supportsInputShapes;

/**
 * Returns whether it's possible for a surface to draw outside of the window area.
 * 
 * If %TRUE is returned the application decides if it wants to draw shadows.
 * If %FALSE is returned, the compositor decides if it wants to draw shadows.
 *
 * @return %TRUE if surfaces can draw shadows or
 *   %FALSE if the display does not support this functionality.
 */
- (bool)supportsShadowWidth;

/**
 * Flushes any requests queued for the windowing system and waits until all
 * requests have been handled.
 * 
 * This is often used for making sure that the display is synchronized
 * with the current state of the program. Calling [method@Gdk.Display.sync]
 * before [method@GdkX11.Display.error_trap_pop] makes sure that any errors
 * generated from earlier requests are handled before the error trap is removed.
 * 
 * This is most useful for X11. On windowing systems where requests are
 * handled synchronously, this function will do nothing.
 *
 */
- (void)sync;

/**
 * Translates the contents of a `GdkEventKey` into a keyval, effective group,
 * and level.
 * 
 * Modifiers that affected the translation and are thus unavailable for
 * application use are returned in @consumed_modifiers.
 * 
 * The @effective_group is the group that was actually used for the
 * translation; some keys such as Enter are not affected by the active
 * keyboard group. The @level is derived from @state.
 * 
 * @consumed_modifiers gives modifiers that should be masked out
 * from @state when comparing this key press to a keyboard shortcut.
 * For instance, on a US keyboard, the `plus` symbol is shifted, so
 * when comparing a key press to a `<Control>plus` accelerator `<Shift>`
 * should be masked out.
 * 
 * This function should rarely be needed, since `GdkEventKey` already
 * contains the translated keyval. It is exported for the benefit of
 * virtualized test environments.
 *
 * @param keycode a keycode
 * @param state a modifier state
 * @param group active keyboard group
 * @param keyval return location for keyval
 * @param effectiveGroup return location for effective group
 * @param level return location for level
 * @param consumed return location for modifiers that were used
 *   to determine the group or level
 * @return %TRUE if there was a keyval bound to keycode/state/group.
 */
- (bool)translateKeyWithKeycode:(guint)keycode state:(GdkModifierType)state group:(int)group keyval:(guint*)keyval effectiveGroup:(int*)effectiveGroup level:(int*)level consumed:(GdkModifierType*)consumed;

@end