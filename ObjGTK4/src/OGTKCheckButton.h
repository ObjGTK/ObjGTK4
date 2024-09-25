/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * A `GtkCheckButton` places a label next to an indicator.
 * 
 * ![Example GtkCheckButtons](check-button.png)
 * 
 * A `GtkCheckButton` is created by calling either [ctor@Gtk.CheckButton.new]
 * or [ctor@Gtk.CheckButton.new_with_label].
 * 
 * The state of a `GtkCheckButton` can be set specifically using
 * [method@Gtk.CheckButton.set_active], and retrieved using
 * [method@Gtk.CheckButton.get_active].
 * 
 * # Inconsistent state
 * 
 * In addition to "on" and "off", check buttons can be an
 * "in between" state that is neither on nor off. This can be used
 * e.g. when the user has selected a range of elements (such as some
 * text or spreadsheet cells) that are affected by a check button,
 * and the current values in that range are inconsistent.
 * 
 * To set a `GtkCheckButton` to inconsistent state, use
 * [method@Gtk.CheckButton.set_inconsistent].
 * 
 * # Grouping
 * 
 * Check buttons can be grouped together, to form mutually exclusive
 * groups - only one of the buttons can be toggled at a time, and toggling
 * another one will switch the currently toggled one off.
 * 
 * Grouped check buttons use a different indicator, and are commonly referred
 * to as *radio buttons*.
 * 
 * ![Example GtkCheckButtons](radio-button.png)
 * 
 * To add a `GtkCheckButton` to a group, use [method@Gtk.CheckButton.set_group].
 * 
 * When the code must keep track of the state of a group of radio buttons, it
 * is recommended to keep track of such state through a stateful
 * `GAction` with a target for each button. Using the `toggled` signals to keep
 * track of the group changes and state is discouraged.
 * 
 * # CSS nodes
 * 
 * ```
 * checkbutton[.text-button]
 * ├── check
 * ╰── [label]
 * ```
 * 
 * A `GtkCheckButton` has a main node with name checkbutton. If the
 * [property@Gtk.CheckButton:label] or [property@Gtk.CheckButton:child]
 * properties are set, it contains a child widget. The indicator node
 * is named check when no group is set, and radio if the checkbutton
 * is grouped together with other checkbuttons.
 * 
 * # Accessibility
 * 
 * `GtkCheckButton` uses the %GTK_ACCESSIBLE_ROLE_CHECKBOX role.
 *
 */
@interface OGTKCheckButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithLabel:(OFString*)label;
- (instancetype)initWithMnemonic:(OFString*)label;

/**
 * Methods
 */

- (GtkCheckButton*)castedGObject;

/**
 * Returns whether the check button is active.
 *
 * @return whether the check button is active
 */
- (bool)active;

/**
 * Gets the child widget of @button or `NULL` if [property@CheckButton:label] is set.
 *
 * @return the child widget of @button
 */
- (OGTKWidget*)child;

/**
 * Returns whether the check button is in an inconsistent state.
 *
 * @return %TRUE if @check_button is currently in an inconsistent state
 */
- (bool)inconsistent;

/**
 * Returns the label of the check button or `NULL` if [property@CheckButton:child] is set.
 *
 * @return The label @self shows next
 *   to the indicator. If no label is shown, %NULL will be returned.
 */
- (OFString*)label;

/**
 * Returns whether underlines in the label indicate mnemonics.
 *
 * @return The value of the [property@Gtk.CheckButton:use-underline] property.
 *   See [method@Gtk.CheckButton.set_use_underline] for details on how to set
 *   a new value.
 */
- (bool)useUnderline;

/**
 * Changes the check buttons active state.
 *
 * @param setting the new value to set
 */
- (void)setActive:(bool)setting;

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
 * Adds @self to the group of @group.
 * 
 * In a group of multiple check buttons, only one button can be active
 * at a time. The behavior of a checkbutton in a group is also commonly
 * known as a *radio button*.
 * 
 * Setting the group of a check button also changes the css name of the
 * indicator widget's CSS node to 'radio'.
 * 
 * Setting up groups in a cycle leads to undefined behavior.
 * 
 * Note that the same effect can be achieved via the [iface@Gtk.Actionable]
 * API, by using the same action with parameter type and state type 's'
 * for all buttons in the group, and giving each button its own target
 * value.
 *
 * @param group another `GtkCheckButton` to
 *   form a group with
 */
- (void)setGroup:(OGTKCheckButton*)group;

/**
 * Sets the `GtkCheckButton` to inconsistent state.
 * 
 * You should turn off the inconsistent state again if the user checks
 * the check button. This has to be done manually.
 *
 * @param inconsistent %TRUE if state is inconsistent
 */
- (void)setInconsistent:(bool)inconsistent;

/**
 * Sets the text of @self.
 * 
 * If [property@Gtk.CheckButton:use-underline] is %TRUE, an underscore
 * in @label is interpreted as mnemonic indicator, see
 * [method@Gtk.CheckButton.set_use_underline] for details on this behavior.
 *
 * @param label The text shown next to the indicator, or %NULL
 *   to show no text
 */
- (void)setLabel:(OFString*)label;

/**
 * Sets whether underlines in the label indicate mnemonics.
 * 
 * If @setting is %TRUE, an underscore character in @self's label
 * indicates a mnemonic accelerator key. This behavior is similar
 * to [property@Gtk.Label:use-underline].
 *
 * @param setting the new value to set
 */
- (void)setUseUnderline:(bool)setting;

@end