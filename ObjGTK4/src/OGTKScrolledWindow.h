/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKAdjustment;

/**
 * `GtkScrolledWindow` is a container that makes its child scrollable.
 * 
 * It does so using either internally added scrollbars or externally
 * associated adjustments, and optionally draws a frame around the child.
 * 
 * Widgets with native scrolling support, i.e. those whose classes implement
 * the [iface@Gtk.Scrollable] interface, are added directly. For other types
 * of widget, the class [class@Gtk.Viewport] acts as an adaptor, giving
 * scrollability to other widgets. [method@Gtk.ScrolledWindow.set_child]
 * intelligently accounts for whether or not the added child is a `GtkScrollable`.
 * If it isn’t, then it wraps the child in a `GtkViewport`. Therefore, you can
 * just add any child widget and not worry about the details.
 * 
 * If [method@Gtk.ScrolledWindow.set_child] has added a `GtkViewport` for you,
 * it will be automatically removed when you unset the child.
 * Unless [property@Gtk.ScrolledWindow:hscrollbar-policy] and
 * [property@Gtk.ScrolledWindow:vscrollbar-policy] are %GTK_POLICY_NEVER or
 * %GTK_POLICY_EXTERNAL, `GtkScrolledWindow` adds internal `GtkScrollbar` widgets
 * around its child. The scroll position of the child, and if applicable the
 * scrollbars, is controlled by the [property@Gtk.ScrolledWindow:hadjustment]
 * and [property@Gtk.ScrolledWindow:vadjustment] that are associated with the
 * `GtkScrolledWindow`. See the docs on [class@Gtk.Scrollbar] for the details,
 * but note that the “step_increment” and “page_increment” fields are only
 * effective if the policy causes scrollbars to be present.
 * 
 * If a `GtkScrolledWindow` doesn’t behave quite as you would like, or
 * doesn’t have exactly the right layout, it’s very possible to set up
 * your own scrolling with `GtkScrollbar` and for example a `GtkGrid`.
 * 
 * # Touch support
 * 
 * `GtkScrolledWindow` has built-in support for touch devices. When a
 * touchscreen is used, swiping will move the scrolled window, and will
 * expose 'kinetic' behavior. This can be turned off with the
 * [property@Gtk.ScrolledWindow:kinetic-scrolling] property if it is undesired.
 * 
 * `GtkScrolledWindow` also displays visual 'overshoot' indication when
 * the content is pulled beyond the end, and this situation can be
 * captured with the [signal@Gtk.ScrolledWindow::edge-overshot] signal.
 * 
 * If no mouse device is present, the scrollbars will overlaid as
 * narrow, auto-hiding indicators over the content. If traditional
 * scrollbars are desired although no mouse is present, this behaviour
 * can be turned off with the [property@Gtk.ScrolledWindow:overlay-scrolling]
 * property.
 * 
 * # CSS nodes
 * 
 * `GtkScrolledWindow` has a main CSS node with name scrolledwindow.
 * It gets a .frame style class added when [property@Gtk.ScrolledWindow:has-frame]
 * is %TRUE.
 * 
 * It uses subnodes with names overshoot and undershoot to draw the overflow
 * and underflow indications. These nodes get the .left, .right, .top or .bottom
 * style class added depending on where the indication is drawn.
 * 
 * `GtkScrolledWindow` also sets the positional style classes (.left, .right,
 * .top, .bottom) and style classes related to overlay scrolling
 * (.overlay-indicator, .dragging, .hovering) on its scrollbars.
 * 
 * If both scrollbars are visible, the area where they meet is drawn
 * with a subnode named junction.
 * 
 * # Accessibility
 * 
 * Until GTK 4.10, `GtkScrolledWindow` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Starting from GTK 4.12, `GtkScrolledWindow` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 *
 */
@interface OGTKScrolledWindow : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkScrolledWindow*)castedGObject;

/**
 * Gets the child widget of @scrolled_window.
 * 
 * If the scrolled window automatically added a [class@Gtk.Viewport], this
 * function will return the viewport widget, and you can retrieve its child
 * using [method@Gtk.Viewport.get_child].
 *
 * @return the child widget of @scrolled_window
 */
- (OGTKWidget*)child;

/**
 * Returns the horizontal scrollbar’s adjustment.
 * 
 * This is the adjustment used to connect the horizontal scrollbar
 * to the child widget’s horizontal scroll functionality.
 *
 * @return the horizontal `GtkAdjustment`
 */
- (OGTKAdjustment*)hadjustment;

/**
 * Gets whether the scrolled window draws a frame.
 *
 * @return %TRUE if the @scrolled_window has a frame
 */
- (bool)hasFrame;

/**
 * Returns the horizontal scrollbar of @scrolled_window.
 *
 * @return the horizontal scrollbar of the scrolled window.
 */
- (OGTKWidget*)hscrollbar;

/**
 * Returns the specified kinetic scrolling behavior.
 *
 * @return the scrolling behavior flags.
 */
- (bool)kineticScrolling;

/**
 * Returns the maximum content height set.
 *
 * @return the maximum content height, or -1
 */
- (int)maxContentHeight;

/**
 * Returns the maximum content width set.
 *
 * @return the maximum content width, or -1
 */
- (int)maxContentWidth;

/**
 * Gets the minimal content height of @scrolled_window.
 *
 * @return the minimal content height
 */
- (int)minContentHeight;

/**
 * Gets the minimum content width of @scrolled_window.
 *
 * @return the minimum content width
 */
- (int)minContentWidth;

/**
 * Returns whether overlay scrolling is enabled for this scrolled window.
 *
 * @return %TRUE if overlay scrolling is enabled
 */
- (bool)overlayScrolling;

/**
 * Gets the placement of the contents with respect to the scrollbars.
 *
 * @return the current placement value.
 */
- (GtkCornerType)placement;

/**
 * Retrieves the current policy values for the horizontal and vertical
 * scrollbars.
 * 
 * See [method@Gtk.ScrolledWindow.set_policy].
 *
 * @param hscrollbarPolicy location to store the policy
 *   for the horizontal scrollbar
 * @param vscrollbarPolicy location to store the policy
 *   for the vertical scrollbar
 */
- (void)policyWithHscrollbarPolicy:(GtkPolicyType*)hscrollbarPolicy vscrollbarPolicy:(GtkPolicyType*)vscrollbarPolicy;

/**
 * Reports whether the natural height of the child will be calculated
 * and propagated through the scrolled window’s requested natural height.
 *
 * @return whether natural height propagation is enabled.
 */
- (bool)propagateNaturalHeight;

/**
 * Reports whether the natural width of the child will be calculated
 * and propagated through the scrolled window’s requested natural width.
 *
 * @return whether natural width propagation is enabled.
 */
- (bool)propagateNaturalWidth;

/**
 * Returns the vertical scrollbar’s adjustment.
 * 
 * This is the adjustment used to connect the vertical
 * scrollbar to the child widget’s vertical scroll functionality.
 *
 * @return the vertical `GtkAdjustment`
 */
- (OGTKAdjustment*)vadjustment;

/**
 * Returns the vertical scrollbar of @scrolled_window.
 *
 * @return the vertical scrollbar of the scrolled window.
 */
- (OGTKWidget*)vscrollbar;

/**
 * Sets the child widget of @scrolled_window.
 * 
 * If @child does not implement the [iface@Gtk.Scrollable] interface,
 * the scrolled window will add @child to a [class@Gtk.Viewport] instance
 * and then add the viewport as its child widget.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets the `GtkAdjustment` for the horizontal scrollbar.
 *
 * @param hadjustment the `GtkAdjustment` to use, or %NULL to create a new one
 */
- (void)setHadjustment:(OGTKAdjustment*)hadjustment;

/**
 * Changes the frame drawn around the contents of @scrolled_window.
 *
 * @param hasFrame whether to draw a frame around scrolled window contents
 */
- (void)setHasFrame:(bool)hasFrame;

/**
 * Turns kinetic scrolling on or off.
 * 
 * Kinetic scrolling only applies to devices with source
 * %GDK_SOURCE_TOUCHSCREEN.
 *
 * @param kineticScrolling %TRUE to enable kinetic scrolling
 */
- (void)setKineticScrolling:(bool)kineticScrolling;

/**
 * Sets the maximum height that @scrolled_window should keep visible.
 * 
 * The @scrolled_window will grow up to this height before it starts
 * scrolling the content.
 * 
 * It is a programming error to set the maximum content height to a value
 * smaller than [property@Gtk.ScrolledWindow:min-content-height].
 *
 * @param height the maximum content height
 */
- (void)setMaxContentHeight:(int)height;

/**
 * Sets the maximum width that @scrolled_window should keep visible.
 * 
 * The @scrolled_window will grow up to this width before it starts
 * scrolling the content.
 * 
 * It is a programming error to set the maximum content width to a
 * value smaller than [property@Gtk.ScrolledWindow:min-content-width].
 *
 * @param width the maximum content width
 */
- (void)setMaxContentWidth:(int)width;

/**
 * Sets the minimum height that @scrolled_window should keep visible.
 * 
 * Note that this can and (usually will) be smaller than the minimum
 * size of the content.
 * 
 * It is a programming error to set the minimum content height to a
 * value greater than [property@Gtk.ScrolledWindow:max-content-height].
 *
 * @param height the minimal content height
 */
- (void)setMinContentHeight:(int)height;

/**
 * Sets the minimum width that @scrolled_window should keep visible.
 * 
 * Note that this can and (usually will) be smaller than the minimum
 * size of the content.
 * 
 * It is a programming error to set the minimum content width to a
 * value greater than [property@Gtk.ScrolledWindow:max-content-width].
 *
 * @param width the minimal content width
 */
- (void)setMinContentWidth:(int)width;

/**
 * Enables or disables overlay scrolling for this scrolled window.
 *
 * @param overlayScrolling whether to enable overlay scrolling
 */
- (void)setOverlayScrolling:(bool)overlayScrolling;

/**
 * Sets the placement of the contents with respect to the scrollbars
 * for the scrolled window.
 * 
 * The default is %GTK_CORNER_TOP_LEFT, meaning the child is
 * in the top left, with the scrollbars underneath and to the right.
 * Other values in [enum@Gtk.CornerType] are %GTK_CORNER_TOP_RIGHT,
 * %GTK_CORNER_BOTTOM_LEFT, and %GTK_CORNER_BOTTOM_RIGHT.
 * 
 * See also [method@Gtk.ScrolledWindow.get_placement] and
 * [method@Gtk.ScrolledWindow.unset_placement].
 *
 * @param windowPlacement position of the child window
 */
- (void)setPlacement:(GtkCornerType)windowPlacement;

/**
 * Sets the scrollbar policy for the horizontal and vertical scrollbars.
 * 
 * The policy determines when the scrollbar should appear; it is a value
 * from the [enum@Gtk.PolicyType] enumeration. If %GTK_POLICY_ALWAYS, the
 * scrollbar is always present; if %GTK_POLICY_NEVER, the scrollbar is
 * never present; if %GTK_POLICY_AUTOMATIC, the scrollbar is present only
 * if needed (that is, if the slider part of the bar would be smaller
 * than the trough — the display is larger than the page size).
 *
 * @param hscrollbarPolicy policy for horizontal bar
 * @param vscrollbarPolicy policy for vertical bar
 */
- (void)setPolicyWithHscrollbarPolicy:(GtkPolicyType)hscrollbarPolicy vscrollbarPolicy:(GtkPolicyType)vscrollbarPolicy;

/**
 * Sets whether the natural height of the child should be calculated
 * and propagated through the scrolled window’s requested natural height.
 *
 * @param propagate whether to propagate natural height
 */
- (void)setPropagateNaturalHeight:(bool)propagate;

/**
 * Sets whether the natural width of the child should be calculated
 * and propagated through the scrolled window’s requested natural width.
 *
 * @param propagate whether to propagate natural width
 */
- (void)setPropagateNaturalWidth:(bool)propagate;

/**
 * Sets the `GtkAdjustment` for the vertical scrollbar.
 *
 * @param vadjustment the `GtkAdjustment` to use, or %NULL to create a new one
 */
- (void)setVadjustment:(OGTKAdjustment*)vadjustment;

/**
 * Unsets the placement of the contents with respect to the scrollbars.
 * 
 * If no window placement is set for a scrolled window,
 * it defaults to %GTK_CORNER_TOP_LEFT.
 *
 */
- (void)unsetPlacement;

@end