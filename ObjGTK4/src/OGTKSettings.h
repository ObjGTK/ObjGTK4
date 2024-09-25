/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGGdkDisplay;

/**
 * `GtkSettings` provides a mechanism to share global settings between
 * applications.
 * 
 * On the X window system, this sharing is realized by an
 * [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
 * manager that is usually part of the desktop environment, along with
 * utilities that let the user change these settings.
 * 
 * On Wayland, the settings are obtained either via a settings portal,
 * or by reading desktop settings from DConf.
 * 
 * On macOS, the settings are obtained from `NSUserDefaults`.
 * 
 * In the absence of these sharing mechanisms, GTK reads default values for
 * settings from `settings.ini` files in `/etc/gtk-4.0`, `$XDG_CONFIG_DIRS/gtk-4.0`
 * and `$XDG_CONFIG_HOME/gtk-4.0`. These files must be valid key files (see
 * `GKeyFile`), and have a section called Settings. Themes can also provide
 * default values for settings by installing a `settings.ini` file
 * next to their `gtk.css` file.
 * 
 * Applications can override system-wide settings by setting the property
 * of the `GtkSettings` object with g_object_set(). This should be restricted
 * to special cases though; `GtkSettings` are not meant as an application
 * configuration facility.
 * 
 * There is one `GtkSettings` instance per display. It can be obtained with
 * [func@Gtk.Settings.get_for_display], but in many cases, it is more
 * convenient to use [method@Gtk.Widget.get_settings].
 *
 */
@interface OGTKSettings : OGObject
{

}

/**
 * Functions
 */

/**
 * Gets the `GtkSettings` object for the default display, creating
 * it if necessary.
 * 
 * See [func@Gtk.Settings.get_for_display].
 *
 * @return a `GtkSettings` object. If there is
 *   no default display, then returns %NULL.
 */
+ (OGTKSettings*)default;

/**
 * Gets the `GtkSettings` object for @display, creating it if necessary.
 *
 * @param display a `GdkDisplay`
 * @return a `GtkSettings` object
 */
+ (OGTKSettings*)forDisplay:(OGGdkDisplay*)display;

/**
 * Methods
 */

- (GtkSettings*)castedGObject;

/**
 * Undoes the effect of calling g_object_set() to install an
 * application-specific value for a setting.
 * 
 * After this call, the setting will again follow the session-wide
 * value for this setting.
 *
 * @param name the name of the setting to reset
 */
- (void)resetProperty:(OFString*)name;

@end