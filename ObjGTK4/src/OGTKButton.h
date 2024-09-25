/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * The `GtkButton` widget is generally used to trigger a callback function that is
 * called when the button is pressed.
 * 
 * ![An example GtkButton](button.png)
 * 
 * The `GtkButton` widget can hold any valid child widget. That is, it can hold
 * almost any other standard `GtkWidget`. The most commonly used child is the
 * `GtkLabel`.
 * 
 * # CSS nodes
 * 
 * `GtkButton` has a single CSS node with name button. The node will get the
 * style classes .image-button or .text-button, if the content is just an
 * image or label, respectively. It may also receive the .flat style class.
 * When activating a button via the keyboard, the button will temporarily
 * gain the .keyboard-activating style class.
 * 
 * Other style classes that are commonly used with `GtkButton` include
 * .suggested-action and .destructive-action. In special cases, buttons
 * can be made round by adding the .circular style class.
 * 
 * Button-like widgets like [class@Gtk.ToggleButton], [class@Gtk.MenuButton],
 * [class@Gtk.VolumeButton], [class@Gtk.LockButton], [class@Gtk.ColorButton]
 * or [class@Gtk.FontButton] use style classes such as .toggle, .popup, .scale,
 * .lock, .color on the button node to differentiate themselves from a plain
 * `GtkButton`.
 * 
 * # Accessibility
 * 
 * `GtkButton` uses the %GTK_ACCESSIBLE_ROLE_BUTTON role.
 *
 */
@interface OGTKButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initFromIconName:(OFString*)iconName;
- (instancetype)initWithLabel:(OFString*)label;
- (instancetype)initWithMnemonic:(OFString*)label;

/**
 * Methods
 */

- (GtkButton*)castedGObject;

/**
 * Retrieves whether the button can be smaller than the natural
 * size of its contents.
 *
 * @return true if the button can shrink, and false otherwise
 */
- (bool)canShrink;

/**
 * Gets the child widget of @button.
 *
 * @return the child widget of @button
 */
- (OGTKWidget*)child;

/**
 * Returns whether the button has a frame.
 *
 * @return %TRUE if the button has a frame
 */
- (bool)hasFrame;

/**
 * Returns the icon name of the button.
 * 
 * If the icon name has not been set with [method@Gtk.Button.set_icon_name]
 * the return value will be %NULL. This will be the case if you create
 * an empty button with [ctor@Gtk.Button.new] to use as a container.
 *
 * @return The icon name set via [method@Gtk.Button.set_icon_name]
 */
- (OFString*)iconName;

/**
 * Fetches the text from the label of the button.
 * 
 * If the label text has not been set with [method@Gtk.Button.set_label]
 * the return value will be %NULL. This will be the case if you create
 * an empty button with [ctor@Gtk.Button.new] to use as a container.
 *
 * @return The text of the label widget. This string is owned
 * by the widget and must not be modified or freed.
 */
- (OFString*)label;

/**
 * gets whether underlines are interpreted as mnemonics.
 * 
 * See [method@Gtk.Button.set_use_underline].
 *
 * @return %TRUE if an embedded underline in the button label
 *   indicates the mnemonic accelerator keys.
 */
- (bool)useUnderline;

/**
 * Sets whether the button size can be smaller than the natural size of
 * its contents.
 * 
 * For text buttons, setting @can_shrink to true will ellipsize the label.
 * 
 * For icons and custom children, this function has no effect.
 *
 * @param canShrink whether the button can shrink
 */
- (void)setCanShrink:(bool)canShrink;

/**
 * Sets the child widget of @button.
 * 
 * Note that by using this API, you take full responsibility for setting
 * up the proper accessibility label and description information for @button.
 * Most likely, you'll either set the accessibility label or description
 * for @button explicitly, or you'll set a labelled-by or described-by
 * relations from @child to @button.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets the style of the button.
 * 
 * Buttons can have a flat appearance or have a frame drawn around them.
 *
 * @param hasFrame whether the button should have a visible frame
 */
- (void)setHasFrame:(bool)hasFrame;

/**
 * Adds a `GtkImage` with the given icon name as a child.
 * 
 * If @button already contains a child widget, that child widget will
 * be removed and replaced with the image.
 *
 * @param iconName An icon name
 */
- (void)setIconName:(OFString*)iconName;

/**
 * Sets the text of the label of the button to @label.
 * 
 * This will also clear any previously set labels.
 *
 * @param label a string
 */
- (void)setLabel:(OFString*)label;

/**
 * Sets whether to use underlines as mnemonics.
 * 
 * If true, an underline in the text of the button label indicates
 * the next character should be used for the mnemonic accelerator key.
 *
 * @param useUnderline %TRUE if underlines in the text indicate mnemonics
 */
- (void)setUseUnderline:(bool)useUnderline;

@end