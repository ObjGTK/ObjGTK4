/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkPopover` is a bubble-like context popup.
 * 
 * ![An example GtkPopover](popover.png)
 * 
 * It is primarily meant to provide context-dependent information
 * or options. Popovers are attached to a parent widget. By default,
 * they point to the whole widget area, although this behavior can be
 * changed with [method@Gtk.Popover.set_pointing_to].
 * 
 * The position of a popover relative to the widget it is attached to
 * can also be changed with [method@Gtk.Popover.set_position]
 * 
 * By default, `GtkPopover` performs a grab, in order to ensure input
 * events get redirected to it while it is shown, and also so the popover
 * is dismissed in the expected situations (clicks outside the popover,
 * or the Escape key being pressed). If no such modal behavior is desired
 * on a popover, [method@Gtk.Popover.set_autohide] may be called on it to
 * tweak its behavior.
 * 
 * ## GtkPopover as menu replacement
 * 
 * `GtkPopover` is often used to replace menus. The best was to do this
 * is to use the [class@Gtk.PopoverMenu] subclass which supports being
 * populated from a `GMenuModel` with [ctor@Gtk.PopoverMenu.new_from_model].
 * 
 * ```xml
 * <section>
 *   <attribute name="display-hint">horizontal-buttons</attribute>
 *   <item>
 *     <attribute name="label">Cut</attribute>
 *     <attribute name="action">app.cut</attribute>
 *     <attribute name="verb-icon">edit-cut-symbolic</attribute>
 *   </item>
 *   <item>
 *     <attribute name="label">Copy</attribute>
 *     <attribute name="action">app.copy</attribute>
 *     <attribute name="verb-icon">edit-copy-symbolic</attribute>
 *   </item>
 *   <item>
 *     <attribute name="label">Paste</attribute>
 *     <attribute name="action">app.paste</attribute>
 *     <attribute name="verb-icon">edit-paste-symbolic</attribute>
 *   </item>
 * </section>
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * popover.background[.menu]
 * ├── arrow
 * ╰── contents
 *     ╰── <child>
 * ```
 * 
 * `GtkPopover` has a main node with name `popover`, an arrow with name `arrow`,
 * and another node for the content named `contents`. The `popover` node always
 * gets the `.background` style class. It also gets the `.menu` style class
 * if the popover is menu-like, e.g. is a [class@Gtk.PopoverMenu].
 * 
 * Particular uses of `GtkPopover`, such as touch selection popups or
 * magnifiers in `GtkEntry` or `GtkTextView` get style classes like
 * `.touch-selection` or `.magnifier` to differentiate from plain popovers.
 * 
 * When styling a popover directly, the `popover` node should usually
 * not have any background. The visible part of the popover can have
 * a shadow. To specify it in CSS, set the box-shadow of the `contents` node.
 * 
 * Note that, in order to accomplish appropriate arrow visuals, `GtkPopover`
 * uses custom drawing for the `arrow` node. This makes it possible for the
 * arrow to change its shape dynamically, but it also limits the possibilities
 * of styling it using CSS. In particular, the `arrow` gets drawn over the
 * `content` node's border and shadow, so they look like one shape, which
 * means that the border width of the `content` node and the `arrow` node should
 * be the same. The arrow also does not support any border shape other than
 * solid, no border-radius, only one border width (border-bottom-width is
 * used) and no box-shadow.
 *
 */
@interface OGTKPopover : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkPopover*)castedGObject;

/**
 * Returns whether the popover is modal.
 * 
 * See [method@Gtk.Popover.set_autohide] for the
 * implications of this.
 *
 * @return %TRUE if @popover is modal
 */
- (bool)autohide;

/**
 * Returns whether the popover will close after a modal child is closed.
 *
 * @return %TRUE if @popover will close after a modal child.
 */
- (bool)cascadePopdown;

/**
 * Gets the child widget of @popover.
 *
 * @return the child widget of @popover
 */
- (OGTKWidget*)child;

/**
 * Gets whether this popover is showing an arrow
 * pointing at the widget that it is relative to.
 *
 * @return whether the popover has an arrow
 */
- (bool)hasArrow;

/**
 * Gets whether mnemonics are visible.
 *
 * @return %TRUE if mnemonics are supposed to be visible
 *   in this popover
 */
- (bool)mnemonicsVisible;

/**
 * Gets the offset previous set with [method@Gtk.Popover.set_offset()].
 *
 * @param xoffset a location for the x_offset
 * @param yoffset a location for the y_offset
 */
- (void)offsetWithXoffset:(int*)xoffset yoffset:(int*)yoffset;

/**
 * Gets the rectangle that the popover points to.
 * 
 * If a rectangle to point to has been set, this function will
 * return %TRUE and fill in @rect with such rectangle, otherwise
 * it will return %FALSE and fill in @rect with the parent
 * widget coordinates.
 *
 * @param rect location to store the rectangle
 * @return %TRUE if a rectangle to point to was set.
 */
- (bool)pointingTo:(GdkRectangle*)rect;

/**
 * Returns the preferred position of @popover.
 *
 * @return The preferred position.
 */
- (GtkPositionType)position;

/**
 * Pops @popover down.
 * 
 * This may have the side-effect of closing a parent popover
 * as well. See [property@Gtk.Popover:cascade-popdown].
 *
 */
- (void)popdown;

/**
 * Pops @popover up.
 *
 */
- (void)popup;

/**
 * Allocate a size for the `GtkPopover`.
 * 
 * This function needs to be called in size-allocate by widgets
 * who have a `GtkPopover` as child. When using a layout manager,
 * this is happening automatically.
 * 
 * To make a popover appear on screen, use [method@Gtk.Popover.popup].
 *
 */
- (void)present;

/**
 * Sets whether @popover is modal.
 * 
 * A modal popover will grab the keyboard focus on it when being
 * displayed. Focus will wrap around within the popover. Clicking
 * outside the popover area or pressing Esc will dismiss the popover.
 * 
 * Called this function on an already showing popup with a new
 * autohide value different from the current one, will cause the
 * popup to be hidden.
 *
 * @param autohide %TRUE to dismiss the popover on outside clicks
 */
- (void)setAutohide:(bool)autohide;

/**
 * If @cascade_popdown is %TRUE, the popover will be
 * closed when a child modal popover is closed.
 * 
 * If %FALSE, @popover will stay visible.
 *
 * @param cascadePopdown %TRUE if the popover should follow a child closing
 */
- (void)setCascadePopdown:(bool)cascadePopdown;

/**
 * Sets the child widget of @popover.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets the default widget of a `GtkPopover`.
 * 
 * The default widget is the widget that’s activated when the user
 * presses Enter in a dialog (for example). This function sets or
 * unsets the default widget for a `GtkPopover`.
 *
 * @param widget a child widget of @popover to set as
 *   the default, or %NULL to unset the default widget for the popover
 */
- (void)setDefaultWidget:(OGTKWidget*)widget;

/**
 * Sets whether this popover should draw an arrow
 * pointing at the widget it is relative to.
 *
 * @param hasArrow %TRUE to draw an arrow
 */
- (void)setHasArrow:(bool)hasArrow;

/**
 * Sets whether mnemonics should be visible.
 *
 * @param mnemonicsVisible the new value
 */
- (void)setMnemonicsVisible:(bool)mnemonicsVisible;

/**
 * Sets the offset to use when calculating the position
 * of the popover.
 * 
 * These values are used when preparing the [struct@Gdk.PopupLayout]
 * for positioning the popover.
 *
 * @param xoffset the x offset to adjust the position by
 * @param yoffset the y offset to adjust the position by
 */
- (void)setOffsetWithXoffset:(int)xoffset yoffset:(int)yoffset;

/**
 * Sets the rectangle that @popover points to.
 * 
 * This is in the coordinate space of the @popover parent.
 *
 * @param rect rectangle to point to
 */
- (void)setPointingTo:(const GdkRectangle*)rect;

/**
 * Sets the preferred position for @popover to appear.
 * 
 * If the @popover is currently visible, it will be immediately
 * updated.
 * 
 * This preference will be respected where possible, although
 * on lack of space (eg. if close to the window edges), the
 * `GtkPopover` may choose to appear on the opposite side.
 *
 * @param position preferred popover position
 */
- (void)setPosition:(GtkPositionType)position;

@end