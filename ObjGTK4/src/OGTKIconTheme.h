/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKIconPaintable;
@class OGGdkDisplay;

/**
 * `GtkIconTheme` provides a facility for loading themed icons.
 * 
 * The main reason for using a name rather than simply providing a filename
 * is to allow different icons to be used depending on what “icon theme” is
 * selected by the user. The operation of icon themes on Linux and Unix
 * follows the [Icon Theme Specification](http://www.freedesktop.org/Standards/icon-theme-spec)
 * There is a fallback icon theme, named `hicolor`, where applications
 * should install their icons, but additional icon themes can be installed
 * as operating system vendors and users choose.
 * 
 * In many cases, named themes are used indirectly, via [class@Gtk.Image]
 * rather than directly, but looking up icons directly is also simple. The
 * `GtkIconTheme` object acts as a database of all the icons in the current
 * theme. You can create new `GtkIconTheme` objects, but it’s much more
 * efficient to use the standard icon theme of the `GtkWidget` so that the
 * icon information is shared with other people looking up icons.
 * 
 * ```c
 * GtkIconTheme *icon_theme;
 * GtkIconPaintable *icon;
 * GdkPaintable *paintable;
 * 
 * icon_theme = gtk_icon_theme_get_for_display (gtk_widget_get_display (my_widget));
 * icon = gtk_icon_theme_lookup_icon (icon_theme,
 *                                    "my-icon-name", // icon name
 *                                    48, // icon size
 *                                    1,  // scale
 *                                    0,  // flags);
 * paintable = GDK_PAINTABLE (icon);
 * // Use the paintable
 * g_object_unref (icon);
 * ```
 *
 */
@interface OGTKIconTheme : OGObject
{

}

/**
 * Functions
 */

/**
 * Gets the icon theme object associated with @display.
 * 
 * If this function has not previously been called for the given
 * display, a new icon theme object will be created and associated
 * with the display. Icon theme objects are fairly expensive to create,
 * so using this function is usually a better choice than calling
 * [ctor@Gtk.IconTheme.new] and setting the display yourself; by using
 * this function a single icon theme object will be shared between users.
 *
 * @param display a `GdkDisplay`
 * @return A unique `GtkIconTheme` associated with
 *   the given display. This icon theme is associated with the display
 *   and can be used as long as the display is open. Do not ref or unref it.
 */
+ (OGTKIconTheme*)forDisplay:(OGGdkDisplay*)display;

/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkIconTheme*)castedGObject;

/**
 * Adds a resource path that will be looked at when looking
 * for icons, similar to search paths.
 * 
 * See [method@Gtk.IconTheme.set_resource_path].
 * 
 * This function should be used to make application-specific icons
 * available as part of the icon theme.
 *
 * @param path a resource path
 */
- (void)addResourcePath:(OFString*)path;

/**
 * Appends a directory to the search path.
 * 
 * See [method@Gtk.IconTheme.set_search_path].
 *
 * @param path directory name to append to the icon path
 */
- (void)addSearchPath:(OFString*)path;

/**
 * Returns the display that the `GtkIconTheme` object was
 * created for.
 *
 * @return the display of @icon_theme
 */
- (OGGdkDisplay*)display;

/**
 * Lists the names of icons in the current icon theme.
 *
 * @return a string array
 *   holding the names of all the icons in the theme. You must
 *   free the array using g_strfreev().
 */
- (char**)iconNames;

/**
 * Returns an array of integers describing the sizes at which
 * the icon is available without scaling.
 * 
 * A size of -1 means that the icon is available in a scalable
 * format. The array is zero-terminated.
 *
 * @param iconName the name of an icon
 * @return A newly
 *   allocated array describing the sizes at which the icon is
 *   available. The array should be freed with g_free() when it is no
 *   longer needed.
 */
- (int*)iconSizes:(OFString*)iconName;

/**
 * Gets the current resource path.
 * 
 * See [method@Gtk.IconTheme.set_resource_path].
 *
 * @return A list of resource paths
 */
- (char**)resourcePath;

/**
 * Gets the current search path.
 * 
 * See [method@Gtk.IconTheme.set_search_path].
 *
 * @return a list of icon theme path directories
 */
- (char**)searchPath;

/**
 * Gets the current icon theme name.
 * 
 * Returns (transfer full): the current icon theme name,
 *
 * @return
 */
- (char*)themeName;

/**
 * Checks whether an icon theme includes an icon
 * for a particular `GIcon`.
 *
 * @param gicon a `GIcon`
 * @return %TRUE if @self includes an icon for @gicon
 */
- (bool)hasGicon:(GIcon*)gicon;

/**
 * Checks whether an icon theme includes an icon
 * for a particular name.
 *
 * @param iconName the name of an icon
 * @return %TRUE if @self includes an
 *  icon for @icon_name.
 */
- (bool)hasIcon:(OFString*)iconName;

/**
 * Looks up a icon for a desired size and window scale.
 * 
 * The icon can then be rendered by using it as a `GdkPaintable`,
 * or you can get information such as the filename and size.
 *
 * @param icon the `GIcon` to look up
 * @param size desired icon size
 * @param scale the desired scale
 * @param direction text direction the icon will be displayed in
 * @param flags flags modifying the behavior of the icon lookup
 * @return a `GtkIconPaintable` containing
 *   information about the icon. Unref with g_object_unref()
 */
- (OGTKIconPaintable*)lookupByGiconWithIcon:(GIcon*)icon size:(int)size scale:(int)scale direction:(GtkTextDirection)direction flags:(GtkIconLookupFlags)flags;

/**
 * Looks up a named icon for a desired size and window scale,
 * returning a `GtkIconPaintable`.
 * 
 * The icon can then be rendered by using it as a `GdkPaintable`,
 * or you can get information such as the filename and size.
 * 
 * If the available @icon_name is not available and @fallbacks are
 * provided, they will be tried in order.
 * 
 * If no matching icon is found, then a paintable that renders the
 * "missing icon" icon is returned. If you need to do something else
 * for missing icons you need to use [method@Gtk.IconTheme.has_icon].
 * 
 * Note that you probably want to listen for icon theme changes and
 * update the icon. This is usually done by overriding the
 * GtkWidgetClass.css-changed() function.
 *
 * @param iconName the name of the icon to lookup
 * @param fallbacks
 * @param size desired icon size.
 * @param scale the window scale this will be displayed on
 * @param direction text direction the icon will be displayed in
 * @param flags flags modifying the behavior of the icon lookup
 * @return a `GtkIconPaintable` object
 *   containing the icon.
 */
- (OGTKIconPaintable*)lookupIconWithIconName:(OFString*)iconName fallbacks:(const char**)fallbacks size:(int)size scale:(int)scale direction:(GtkTextDirection)direction flags:(GtkIconLookupFlags)flags;

/**
 * Sets the resource paths that will be looked at when
 * looking for icons, similar to search paths.
 * 
 * The resources are considered as part of the hicolor icon theme
 * and must be located in subdirectories that are defined in the
 * hicolor icon theme, such as `@path/16x16/actions/run.png`
 * or `@path/scalable/actions/run.svg`.
 * 
 * Icons that are directly placed in the resource path instead
 * of a subdirectory are also considered as ultimate fallback,
 * but they are treated like unthemed icons.
 *
 * @param path NULL-terminated array of resource paths
 *   that are searched for icons
 */
- (void)setResourcePath:(const char* const*)path;

/**
 * Sets the search path for the icon theme object.
 * 
 * When looking for an icon theme, GTK will search for a subdirectory
 * of one or more of the directories in @path with the same name
 * as the icon theme containing an index.theme file. (Themes from
 * multiple of the path elements are combined to allow themes to be
 * extended by adding icons in the user’s home directory.)
 * 
 * In addition if an icon found isn’t found either in the current
 * icon theme or the default icon theme, and an image file with
 * the right name is found directly in one of the elements of
 * @path, then that image will be used for the icon name.
 * (This is legacy feature, and new icons should be put
 * into the fallback icon theme, which is called hicolor,
 * rather than directly on the icon path.)
 *
 * @param path NULL-terminated
 *   array of directories that are searched for icon themes
 */
- (void)setSearchPath:(const char* const*)path;

/**
 * Sets the name of the icon theme that the `GtkIconTheme` object uses
 * overriding system configuration.
 * 
 * This function cannot be called on the icon theme objects returned
 * from [func@Gtk.IconTheme.get_for_display].
 *
 * @param themeName name of icon theme to use instead of
 *   configured theme, or %NULL to unset a previously set custom theme
 */
- (void)setThemeName:(OFString*)themeName;

@end