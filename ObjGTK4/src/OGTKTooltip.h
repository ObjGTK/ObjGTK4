/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * `GtkTooltip` is an object representing a widget tooltip.
 * 
 * Basic tooltips can be realized simply by using
 * [method@Gtk.Widget.set_tooltip_text] or
 * [method@Gtk.Widget.set_tooltip_markup] without
 * any explicit tooltip object.
 * 
 * When you need a tooltip with a little more fancy contents,
 * like adding an image, or you want the tooltip to have different
 * contents per `GtkTreeView` row or cell, you will have to do a
 * little more work:
 * 
 * - Set the [property@Gtk.Widget:has-tooltip] property to %TRUE.
 *   This will make GTK monitor the widget for motion and related events
 *   which are needed to determine when and where to show a tooltip.
 * 
 * - Connect to the [signal@Gtk.Widget::query-tooltip] signal.
 *   This signal will be emitted when a tooltip is supposed to be shown.
 *   One of the arguments passed to the signal handler is a `GtkTooltip`
 *   object. This is the object that we are about to display as a tooltip,
 *   and can be manipulated in your callback using functions like
 *   [method@Gtk.Tooltip.set_icon]. There are functions for setting
 *   the tooltip’s markup, setting an image from a named icon, or even
 *   putting in a custom widget.
 * 
 * - Return %TRUE from your ::query-tooltip handler. This causes the tooltip
 *   to be show. If you return %FALSE, it will not be shown.
 *
 */
@interface OGTKTooltip : OGObject
{

}


/**
 * Methods
 */

- (GtkTooltip*)castedGObject;

/**
 * Replaces the widget packed into the tooltip with
 * @custom_widget. @custom_widget does not get destroyed when the tooltip goes
 * away.
 * By default a box with a `GtkImage` and `GtkLabel` is embedded in
 * the tooltip, which can be configured using gtk_tooltip_set_markup()
 * and gtk_tooltip_set_icon().
 *
 * @param customWidget a `GtkWidget`, or %NULL to unset the old custom widget.
 */
- (void)setCustom:(OGTKWidget*)customWidget;

/**
 * Sets the icon of the tooltip (which is in front of the text) to be
 * @paintable.  If @paintable is %NULL, the image will be hidden.
 *
 * @param paintable a `GdkPaintable`
 */
- (void)setIcon:(GdkPaintable*)paintable;

/**
 * Sets the icon of the tooltip (which is in front of the text)
 * to be the icon indicated by @gicon with the size indicated
 * by @size. If @gicon is %NULL, the image will be hidden.
 *
 * @param gicon a `GIcon` representing the icon
 */
- (void)setIconFromGicon:(GIcon*)gicon;

/**
 * Sets the icon of the tooltip (which is in front of the text) to be
 * the icon indicated by @icon_name with the size indicated
 * by @size.  If @icon_name is %NULL, the image will be hidden.
 *
 * @param iconName an icon name
 */
- (void)setIconFromIconName:(OFString*)iconName;

/**
 * Sets the text of the tooltip to be @markup.
 * 
 * The string must be marked up with Pango markup.
 * If @markup is %NULL, the label will be hidden.
 *
 * @param markup a string with Pango markup or %NLL
 */
- (void)setMarkup:(OFString*)markup;

/**
 * Sets the text of the tooltip to be @text.
 * 
 * If @text is %NULL, the label will be hidden.
 * See also [method@Gtk.Tooltip.set_markup].
 *
 * @param text a text string
 */
- (void)setText:(OFString*)text;

/**
 * Sets the area of the widget, where the contents of this tooltip apply,
 * to be @rect (in widget coordinates).  This is especially useful for
 * properly setting tooltips on `GtkTreeView` rows and cells, `GtkIconViews`,
 * etc.
 * 
 * For setting tooltips on `GtkTreeView`, please refer to the convenience
 * functions for this: gtk_tree_view_set_tooltip_row() and
 * gtk_tree_view_set_tooltip_cell().
 *
 * @param rect a `GdkRectangle`
 */
- (void)setTipArea:(const GdkRectangle*)rect;

@end