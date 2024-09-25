/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGGdkDisplay;

/**
 * `GtkStyleContext` stores styling information affecting a widget.
 * 
 * In order to construct the final style information, `GtkStyleContext`
 * queries information from all attached `GtkStyleProviders`. Style
 * providers can be either attached explicitly to the context through
 * [method@Gtk.StyleContext.add_provider], or to the display through
 * [func@Gtk.StyleContext.add_provider_for_display]. The resulting
 * style is a combination of all providers’ information in priority order.
 * 
 * For GTK widgets, any `GtkStyleContext` returned by
 * [method@Gtk.Widget.get_style_context] will already have a `GdkDisplay`
 * and RTL/LTR information set. The style context will also be updated
 * automatically if any of these settings change on the widget.
 * 
 * ## Style Classes
 * 
 * Widgets can add style classes to their context, which can be used to associate
 * different styles by class. The documentation for individual widgets lists
 * which style classes it uses itself, and which style classes may be added by
 * applications to affect their appearance.
 * 
 * # Custom styling in UI libraries and applications
 * 
 * If you are developing a library with custom widgets that render differently
 * than standard components, you may need to add a `GtkStyleProvider` yourself
 * with the %GTK_STYLE_PROVIDER_PRIORITY_FALLBACK priority, either a
 * `GtkCssProvider` or a custom object implementing the `GtkStyleProvider`
 * interface. This way themes may still attempt to style your UI elements in
 * a different way if needed so.
 * 
 * If you are using custom styling on an applications, you probably want then
 * to make your style information prevail to the theme’s, so you must use
 * a `GtkStyleProvider` with the %GTK_STYLE_PROVIDER_PRIORITY_APPLICATION
 * priority, keep in mind that the user settings in
 * `XDG_CONFIG_HOME/gtk-4.0/gtk.css` will
 * still take precedence over your changes, as it uses the
 * %GTK_STYLE_PROVIDER_PRIORITY_USER priority.
 *
 */
@interface OGTKStyleContext : OGObject
{

}

/**
 * Functions
 */

/**
 * Adds a global style provider to @display, which will be used
 * in style construction for all `GtkStyleContexts` under @display.
 * 
 * GTK uses this to make styling information from `GtkSettings`
 * available.
 * 
 * Note: If both priorities are the same, A `GtkStyleProvider`
 * added through [method@Gtk.StyleContext.add_provider] takes
 * precedence over another added through this function.
 *
 * @param display a `GdkDisplay`
 * @param provider a `GtkStyleProvider`
 * @param priority the priority of the style provider. The lower
 *   it is, the earlier it will be used in the style construction.
 *   Typically this will be in the range between
 *   %GTK_STYLE_PROVIDER_PRIORITY_FALLBACK and
 *   %GTK_STYLE_PROVIDER_PRIORITY_USER
 */
+ (void)addProviderForDisplayWithDisplay:(OGGdkDisplay*)display provider:(GtkStyleProvider*)provider priority:(guint)priority;

/**
 * Removes @provider from the global style providers list in @display.
 *
 * @param display a `GdkDisplay`
 * @param provider a `GtkStyleProvider`
 */
+ (void)removeProviderForDisplayWithDisplay:(OGGdkDisplay*)display provider:(GtkStyleProvider*)provider;

/**
 * Methods
 */

- (GtkStyleContext*)castedGObject;

/**
 * Adds a style class to @context, so later uses of the
 * style context will make use of this new class for styling.
 * 
 * In the CSS file format, a `GtkEntry` defining a “search”
 * class, would be matched by:
 * 
 * ```css
 * entry.search { ... }
 * ```
 * 
 * While any widget defining a “search” class would be
 * matched by:
 * ```css
 * .search { ... }
 * ```
 *
 * @param className class name to use in styling
 */
- (void)addClass:(OFString*)className;

/**
 * Adds a style provider to @context, to be used in style construction.
 * 
 * Note that a style provider added by this function only affects
 * the style of the widget to which @context belongs. If you want
 * to affect the style of all widgets, use
 * [func@Gtk.StyleContext.add_provider_for_display].
 * 
 * Note: If both priorities are the same, a `GtkStyleProvider`
 * added through this function takes precedence over another added
 * through [func@Gtk.StyleContext.add_provider_for_display].
 *
 * @param provider a `GtkStyleProvider`
 * @param priority the priority of the style provider. The lower
 *   it is, the earlier it will be used in the style construction.
 *   Typically this will be in the range between
 *   %GTK_STYLE_PROVIDER_PRIORITY_FALLBACK and
 *   %GTK_STYLE_PROVIDER_PRIORITY_USER
 */
- (void)addProviderWithProvider:(GtkStyleProvider*)provider priority:(guint)priority;

/**
 * Gets the border for a given state as a `GtkBorder`.
 *
 * @param border return value for the border settings
 */
- (void)border:(GtkBorder*)border;

/**
 * Gets the foreground color for a given state.
 *
 * @param color return value for the foreground color
 */
- (void)color:(GdkRGBA*)color;

/**
 * Returns the `GdkDisplay` to which @context is attached.
 *
 * @return a `GdkDisplay`.
 */
- (OGGdkDisplay*)display;

/**
 * Gets the margin for a given state as a `GtkBorder`.
 *
 * @param margin return value for the margin settings
 */
- (void)margin:(GtkBorder*)margin;

/**
 * Gets the padding for a given state as a `GtkBorder`.
 *
 * @param padding return value for the padding settings
 */
- (void)padding:(GtkBorder*)padding;

/**
 * Returns the scale used for assets.
 *
 * @return the scale
 */
- (int)scale;

/**
 * Returns the state used for style matching.
 * 
 * This method should only be used to retrieve the `GtkStateFlags`
 * to pass to `GtkStyleContext` methods, like
 * [method@Gtk.StyleContext.get_padding].
 * If you need to retrieve the current state of a `GtkWidget`, use
 * [method@Gtk.Widget.get_state_flags].
 *
 * @return the state flags
 */
- (GtkStateFlags)state;

/**
 * Returns %TRUE if @context currently has defined the
 * given class name.
 *
 * @param className a class name
 * @return %TRUE if @context has @class_name defined
 */
- (bool)hasClass:(OFString*)className;

/**
 * Looks up and resolves a color name in the @context color map.
 *
 * @param colorName color name to lookup
 * @param color Return location for the looked up color
 * @return %TRUE if @color_name was found and resolved, %FALSE otherwise
 */
- (bool)lookupColorWithColorName:(OFString*)colorName color:(GdkRGBA*)color;

/**
 * Removes @class_name from @context.
 *
 * @param className class name to remove
 */
- (void)removeClass:(OFString*)className;

/**
 * Removes @provider from the style providers list in @context.
 *
 * @param provider a `GtkStyleProvider`
 */
- (void)removeProvider:(GtkStyleProvider*)provider;

/**
 * Restores @context state to a previous stage.
 * 
 * See [method@Gtk.StyleContext.save].
 *
 */
- (void)restore;

/**
 * Saves the @context state.
 * 
 * This allows temporary modifications done through
 * [method@Gtk.StyleContext.add_class],
 * [method@Gtk.StyleContext.remove_class],
 * [method@Gtk.StyleContext.set_state] to be quickly
 * reverted in one go through [method@Gtk.StyleContext.restore].
 * 
 * The matching call to [method@Gtk.StyleContext.restore]
 * must be done before GTK returns to the main loop.
 *
 */
- (void)save;

/**
 * Attaches @context to the given display.
 * 
 * The display is used to add style information from “global”
 * style providers, such as the display's `GtkSettings` instance.
 * 
 * If you are using a `GtkStyleContext` returned from
 * [method@Gtk.Widget.get_style_context], you do not need to
 * call this yourself.
 *
 * @param display a `GdkDisplay`
 */
- (void)setDisplay:(OGGdkDisplay*)display;

/**
 * Sets the scale to use when getting image assets for the style.
 *
 * @param scale scale
 */
- (void)setScale:(int)scale;

/**
 * Sets the state to be used for style matching.
 *
 * @param flags state to represent
 */
- (void)setState:(GtkStateFlags)flags;

/**
 * Converts the style context into a string representation.
 * 
 * The string representation always includes information about
 * the name, state, id, visibility and style classes of the CSS
 * node that is backing @context. Depending on the flags, more
 * information may be included.
 * 
 * This function is intended for testing and debugging of the
 * CSS implementation in GTK. There are no guarantees about
 * the format of the returned string, it may change.
 *
 * @param flags Flags that determine what to print
 * @return a newly allocated string representing @context
 */
- (char*)toString:(GtkStyleContextPrintFlags)flags;

@end