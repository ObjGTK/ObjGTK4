/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGMenuModel;
@class OGTKPopover;

/**
 * The `GtkMenuButton` widget is used to display a popup when clicked.
 * 
 * ![An example GtkMenuButton](menu-button.png)
 * 
 * This popup can be provided either as a `GtkPopover` or as an abstract
 * `GMenuModel`.
 * 
 * The `GtkMenuButton` widget can show either an icon (set with the
 * [property@Gtk.MenuButton:icon-name] property) or a label (set with the
 * [property@Gtk.MenuButton:label] property). If neither is explicitly set,
 * a [class@Gtk.Image] is automatically created, using an arrow image oriented
 * according to [property@Gtk.MenuButton:direction] or the generic
 * “open-menu-symbolic” icon if the direction is not set.
 * 
 * The positioning of the popup is determined by the
 * [property@Gtk.MenuButton:direction] property of the menu button.
 * 
 * For menus, the [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign]
 * properties of the menu are also taken into account. For example, when the
 * direction is %GTK_ARROW_DOWN and the horizontal alignment is %GTK_ALIGN_START,
 * the menu will be positioned below the button, with the starting edge
 * (depending on the text direction) of the menu aligned with the starting
 * edge of the button. If there is not enough space below the button, the
 * menu is popped up above the button instead. If the alignment would move
 * part of the menu offscreen, it is “pushed in”.
 * 
 * |           | start                | center                | end                |
 * | -         | ---                  | ---                   | ---                |
 * | **down**  | ![](down-start.png)  | ![](down-center.png)  | ![](down-end.png)  |
 * | **up**    | ![](up-start.png)    | ![](up-center.png)    | ![](up-end.png)    |
 * | **left**  | ![](left-start.png)  | ![](left-center.png)  | ![](left-end.png)  |
 * | **right** | ![](right-start.png) | ![](right-center.png) | ![](right-end.png) |
 * 
 * # CSS nodes
 * 
 * ```
 * menubutton
 * ╰── button.toggle
 *     ╰── <content>
 *          ╰── [arrow]
 * ```
 * 
 * `GtkMenuButton` has a single CSS node with name `menubutton`
 * which contains a `button` node with a `.toggle` style class.
 * 
 * If the button contains an icon, it will have the `.image-button` style class,
 * if it contains text, it will have `.text-button` style class. If an arrow is
 * visible in addition to an icon, text or a custom child, it will also have
 * `.arrow-button` style class.
 * 
 * Inside the toggle button content, there is an `arrow` node for
 * the indicator, which will carry one of the `.none`, `.up`, `.down`,
 * `.left` or `.right` style classes to indicate the direction that
 * the menu will appear in. The CSS is expected to provide a suitable
 * image for each of these cases using the `-gtk-icon-source` property.
 * 
 * Optionally, the `menubutton` node can carry the `.circular` style class
 * to request a round appearance.
 * 
 * # Accessibility
 * 
 * `GtkMenuButton` uses the %GTK_ACCESSIBLE_ROLE_BUTTON role.
 *
 */
@interface OGTKMenuButton : OGTKWidget
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)menuButton;

/**
 * Methods
 */

- (GtkMenuButton*)castedGObject;

/**
 * Returns whether the menu button is active.
 *
 * @return TRUE if the button is active
 */
- (bool)active;

/**
 * Gets whether to show a dropdown arrow even when using an icon or a custom
 * child.
 *
 * @return whether to show a dropdown arrow even when using an icon or a custom
 * child.
 */
- (bool)alwaysShowArrow;

/**
 * Retrieves whether the button can be smaller than the natural
 * size of its contents.
 *
 * @return true if the button can shrink, and false otherwise
 */
- (bool)canShrink;

/**
 * Gets the child widget of @menu_button.
 *
 * @return the child widget of @menu_button
 */
- (OGTKWidget*)child;

/**
 * Returns the direction the popup will be pointing at when popped up.
 *
 * @return a `GtkArrowType` value
 */
- (GtkArrowType)direction;

/**
 * Returns whether the button has a frame.
 *
 * @return %TRUE if the button has a frame
 */
- (bool)hasFrame;

/**
 * Gets the name of the icon shown in the button.
 *
 * @return the name of the icon shown in the button
 */
- (OFString*)iconName;

/**
 * Gets the label shown in the button
 *
 * @return the label shown in the button
 */
- (OFString*)label;

/**
 * Returns the `GMenuModel` used to generate the popup.
 *
 * @return a `GMenuModel`
 */
- (OGMenuModel*)menuModel;

/**
 * Returns the `GtkPopover` that pops out of the button.
 * 
 * If the button is not using a `GtkPopover`, this function
 * returns %NULL.
 *
 * @return a `GtkPopover` or %NULL
 */
- (OGTKPopover*)popover;

/**
 * Returns whether the menu button acts as a primary menu.
 *
 * @return %TRUE if the button is a primary menu
 */
- (bool)primary;

/**
 * Returns whether an embedded underline in the text indicates a
 * mnemonic.
 *
 * @return %TRUE whether an embedded underline in the text indicates
 *   the mnemonic accelerator keys.
 */
- (bool)useUnderline;

/**
 * Dismiss the menu.
 *
 */
- (void)popdown;

/**
 * Pop up the menu.
 *
 */
- (void)popup;

/**
 * Sets whether the menu button is active.
 *
 * @param active whether the menu button is active
 */
- (void)setActive:(bool)active;

/**
 * Sets whether to show a dropdown arrow even when using an icon or a custom
 * child.
 *
 * @param alwaysShowArrow whether to show a dropdown arrow even when using an icon
 * or a custom child
 */
- (void)setAlwaysShowArrow:(bool)alwaysShowArrow;

/**
 * Sets whether the button size can be smaller than the natural size of
 * its contents.
 * 
 * For text buttons, setting @can_shrink to true will ellipsize the label.
 * 
 * For icon buttons, this function has no effect.
 *
 * @param canShrink whether the button can shrink
 */
- (void)setCanShrink:(bool)canShrink;

/**
 * Sets the child widget of @menu_button.
 * 
 * Setting a child resets [property@Gtk.MenuButton:label] and
 * [property@Gtk.MenuButton:icon-name].
 * 
 * If [property@Gtk.MenuButton:always-show-arrow] is set to `TRUE` and
 * [property@Gtk.MenuButton:direction] is not `GTK_ARROW_NONE`, a dropdown arrow
 * will be shown next to the child.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets @func to be called when a popup is about to be shown.
 * 
 * @func should use one of
 * 
 *  - [method@Gtk.MenuButton.set_popover]
 *  - [method@Gtk.MenuButton.set_menu_model]
 * 
 * to set a popup for @menu_button.
 * If @func is non-%NULL, @menu_button will always be sensitive.
 * 
 * Using this function will not reset the menu widget attached to
 * @menu_button. Instead, this can be done manually in @func.
 *
 * @param func function to call when a popup is about to
 *   be shown, but none has been provided via other means, or %NULL
 *   to reset to default behavior.
 * @param userData user data to pass to @func.
 * @param destroyNotify destroy notify for @user_data
 */
- (void)setCreatePopupFunc:(GtkMenuButtonCreatePopupFunc)func userData:(gpointer)userData destroyNotify:(GDestroyNotify)destroyNotify;

/**
 * Sets the direction in which the popup will be popped up.
 * 
 * If the button is automatically populated with an arrow icon,
 * its direction will be changed to match.
 * 
 * If the does not fit in the available space in the given direction,
 * GTK will its best to keep it inside the screen and fully visible.
 * 
 * If you pass %GTK_ARROW_NONE for a @direction, the popup will behave
 * as if you passed %GTK_ARROW_DOWN (although you won’t see any arrows).
 *
 * @param direction a `GtkArrowType`
 */
- (void)setDirection:(GtkArrowType)direction;

/**
 * Sets the style of the button.
 *
 * @param hasFrame whether the button should have a visible frame
 */
- (void)setHasFrame:(bool)hasFrame;

/**
 * Sets the name of an icon to show inside the menu button.
 * 
 * Setting icon name resets [property@Gtk.MenuButton:label] and
 * [property@Gtk.MenuButton:child].
 * 
 * If [property@Gtk.MenuButton:always-show-arrow] is set to `TRUE` and
 * [property@Gtk.MenuButton:direction] is not `GTK_ARROW_NONE`, a dropdown arrow
 * will be shown next to the icon.
 *
 * @param iconName the icon name
 */
- (void)setIconName:(OFString*)iconName;

/**
 * Sets the label to show inside the menu button.
 * 
 * Setting a label resets [property@Gtk.MenuButton:icon-name] and
 * [property@Gtk.MenuButton:child].
 * 
 * If [property@Gtk.MenuButton:direction] is not `GTK_ARROW_NONE`, a dropdown
 * arrow will be shown next to the label.
 *
 * @param label the label
 */
- (void)setLabel:(OFString*)label;

/**
 * Sets the `GMenuModel` from which the popup will be constructed.
 * 
 * If @menu_model is %NULL, the button is disabled.
 * 
 * A [class@Gtk.Popover] will be created from the menu model with
 * [ctor@Gtk.PopoverMenu.new_from_model]. Actions will be connected
 * as documented for this function.
 * 
 * If [property@Gtk.MenuButton:popover] is already set, it will be
 * dissociated from the @menu_button, and the property is set to %NULL.
 *
 * @param menuModel a `GMenuModel`, or %NULL to unset and disable the
 *   button
 */
- (void)setMenuModel:(OGMenuModel*)menuModel;

/**
 * Sets the `GtkPopover` that will be popped up when the @menu_button is clicked.
 * 
 * If @popover is %NULL, the button is disabled.
 * 
 * If [property@Gtk.MenuButton:menu-model] is set, the menu model is dissociated
 * from the @menu_button, and the property is set to %NULL.
 *
 * @param popover a `GtkPopover`, or %NULL to unset and disable the button
 */
- (void)setPopover:(OGTKWidget*)popover;

/**
 * Sets whether menu button acts as a primary menu.
 * 
 * Primary menus can be opened with the <kbd>F10</kbd> key.
 *
 * @param primary whether the menubutton should act as a primary menu
 */
- (void)setPrimary:(bool)primary;

/**
 * If true, an underline in the text indicates a mnemonic.
 *
 * @param useUnderline %TRUE if underlines in the text indicate mnemonics
 */
- (void)setUseUnderline:(bool)useUnderline;

@end