/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkCssProvider` is an object implementing the `GtkStyleProvider` interface
 * for CSS.
 * 
 * It is able to parse CSS-like input in order to style widgets.
 * 
 * An application can make GTK parse a specific CSS style sheet by calling
 * [method@Gtk.CssProvider.load_from_file] or
 * [method@Gtk.CssProvider.load_from_resource]
 * and adding the provider with [method@Gtk.StyleContext.add_provider] or
 * [func@Gtk.StyleContext.add_provider_for_display].
 * 
 * In addition, certain files will be read when GTK is initialized.
 * First, the file `$XDG_CONFIG_HOME/gtk-4.0/gtk.css` is loaded if it
 * exists. Then, GTK loads the first existing file among
 * `XDG_DATA_HOME/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
 * `$HOME/.themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
 * `$XDG_DATA_DIRS/themes/THEME/gtk-VERSION/gtk-VARIANT.css` and
 * `DATADIR/share/themes/THEME/gtk-VERSION/gtk-VARIANT.css`,
 * where `THEME` is the name of the current theme (see the
 * [property@Gtk.Settings:gtk-theme-name] setting), `VARIANT` is the
 * variant to load (see the
 * [property@Gtk.Settings:gtk-application-prefer-dark-theme] setting),
 * `DATADIR` is the prefix configured when GTK was compiled (unless
 * overridden by the `GTK_DATA_PREFIX` environment variable), and
 * `VERSION` is the GTK version number. If no file is found for the
 * current version, GTK tries older versions all the way back to 4.0.
 * 
 * To track errors while loading CSS, connect to the
 * [signal@Gtk.CssProvider::parsing-error] signal.
 *
 */
@interface OGTKCssProvider : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCssProvider*)castedGObject;

/**
 * Loads @data into @css_provider.
 * 
 * This clears any previously loaded information.
 *
 * @param data `GBytes` containing the data to load
 */
- (void)loadFromBytes:(GBytes*)data;

/**
 * Loads @data into @css_provider.
 * 
 * This clears any previously loaded information.
 *
 * @param data CSS data to be parsed
 * @param length the length of @data in bytes, or -1 for NUL terminated strings
 */
- (void)loadFromDataWithData:(OFString*)data length:(gssize)length;

/**
 * Loads the data contained in @file into @css_provider.
 * 
 * This clears any previously loaded information.
 *
 * @param file `GFile` pointing to a file to load
 */
- (void)loadFromFile:(GFile*)file;

/**
 * Loads the data contained in @path into @css_provider.
 * 
 * This clears any previously loaded information.
 *
 * @param path the path of a filename to load, in the GLib filename encoding
 */
- (void)loadFromPath:(OFString*)path;

/**
 * Loads the data contained in the resource at @resource_path into
 * the @css_provider.
 * 
 * This clears any previously loaded information.
 *
 * @param resourcePath a `GResource` resource path
 */
- (void)loadFromResource:(OFString*)resourcePath;

/**
 * Loads @string into @css_provider.
 * 
 * This clears any previously loaded information.
 *
 * @param string the CSS to load
 */
- (void)loadFromString:(OFString*)string;

/**
 * Loads a theme from the usual theme paths.
 * 
 * The actual process of finding the theme might change between
 * releases, but it is guaranteed that this function uses the same
 * mechanism to load the theme that GTK uses for loading its own theme.
 *
 * @param name A theme name
 * @param variant variant to load, for example, "dark", or
 *   %NULL for the default
 */
- (void)loadNamedWithName:(OFString*)name variant:(OFString*)variant;

/**
 * Converts the @provider into a string representation in CSS
 * format.
 * 
 * Using [method@Gtk.CssProvider.load_from_string] with the return
 * value from this function on a new provider created with
 * [ctor@Gtk.CssProvider.new] will basically create a duplicate
 * of this @provider.
 *
 * @return a new string representing the @provider.
 */
- (char*)toString;

@end