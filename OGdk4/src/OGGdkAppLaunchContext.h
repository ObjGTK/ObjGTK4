/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGio/OGAppLaunchContext.h>

@class OGGdkDisplay;

/**
 * `GdkAppLaunchContext` handles launching an application in a graphical context.
 * 
 * It is an implementation of `GAppLaunchContext` that provides startup
 * notification and allows to launch applications on a specific workspace.
 * 
 * ## Launching an application
 * 
 * ```c
 * GdkAppLaunchContext *context;
 * 
 * context = gdk_display_get_app_launch_context (display);
 * 
 * gdk_app_launch_context_set_timestamp (gdk_event_get_time (event));
 * 
 * if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
 *   g_warning ("Launching failed: %s\n", error->message);
 * 
 * g_object_unref (context);
 * ```
 *
 */
@interface OGGdkAppLaunchContext : OGAppLaunchContext
{

}


/**
 * Methods
 */

- (GdkAppLaunchContext*)castedGObject;

/**
 * Gets the `GdkDisplay` that @context is for.
 *
 * @return the display of @context
 */
- (OGGdkDisplay*)display;

/**
 * Sets the workspace on which applications will be launched.
 * 
 * This only works when running under a window manager that
 * supports multiple workspaces, as described in the
 * [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
 * Specifically this sets the `_NET_WM_DESKTOP` property described
 * in that spec.
 * 
 * This only works when using the X11 backend.
 * 
 * When the workspace is not specified or @desktop is set to -1,
 * it is up to the window manager to pick one, typically it will
 * be the current workspace.
 *
 * @param desktop the number of a workspace, or -1
 */
- (void)setDesktop:(int)desktop;

/**
 * Sets the icon for applications that are launched with this
 * context.
 * 
 * Window Managers can use this information when displaying startup
 * notification.
 * 
 * See also [method@Gdk.AppLaunchContext.set_icon_name].
 *
 * @param icon a `GIcon`
 */
- (void)setIcon:(GIcon*)icon;

/**
 * Sets the icon for applications that are launched with this context.
 * 
 * The @icon_name will be interpreted in the same way as the Icon field
 * in desktop files. See also [method@Gdk.AppLaunchContext.set_icon].
 * 
 * If both @icon and @icon_name are set, the @icon_name takes priority.
 * If neither @icon or @icon_name is set, the icon is taken from either
 * the file that is passed to launched application or from the `GAppInfo`
 * for the launched application itself.
 *
 * @param iconName an icon name
 */
- (void)setIconName:(OFString*)iconName;

/**
 * Sets the timestamp of @context.
 * 
 * The timestamp should ideally be taken from the event that
 * triggered the launch.
 * 
 * Window managers can use this information to avoid moving the
 * focus to the newly launched application when the user is busy
 * typing in another window. This is also known as 'focus stealing
 * prevention'.
 *
 * @param timestamp a timestamp
 */
- (void)setTimestamp:(guint32)timestamp;

@end