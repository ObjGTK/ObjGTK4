/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKAdjustment;

/**
 * A `GtkSpinButton` is an ideal way to allow the user to set the
 * value of some attribute.
 * 
 * ![An example GtkSpinButton](spinbutton.png)
 * 
 * Rather than having to directly type a number into a `GtkEntry`,
 * `GtkSpinButton` allows the user to click on one of two arrows
 * to increment or decrement the displayed value. A value can still be
 * typed in, with the bonus that it can be checked to ensure it is in a
 * given range.
 * 
 * The main properties of a `GtkSpinButton` are through an adjustment.
 * See the [class@Gtk.Adjustment] documentation for more details about
 * an adjustment's properties.
 * 
 * Note that `GtkSpinButton` will by default make its entry large enough
 * to accommodate the lower and upper bounds of the adjustment. If this
 * is not desired, the automatic sizing can be turned off by explicitly
 * setting [property@Gtk.Editable:width-chars] to a value != -1.
 * 
 * ## Using a GtkSpinButton to get an integer
 * 
 * ```c
 * // Provides a function to retrieve an integer value from a GtkSpinButton
 * // and creates a spin button to model percentage values.
 * 
 * int
 * grab_int_value (GtkSpinButton *button,
 *                 gpointer       user_data)
 * {
 *   return gtk_spin_button_get_value_as_int (button);
 * }
 * 
 * void
 * create_integer_spin_button (void)
 * {
 * 
 *   GtkWidget *window, *button;
 *   GtkAdjustment *adjustment;
 * 
 *   adjustment = gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 0.0);
 * 
 *   window = gtk_window_new ();
 * 
 *   // creates the spinbutton, with no decimal places
 *   button = gtk_spin_button_new (adjustment, 1.0, 0);
 *   gtk_window_set_child (GTK_WINDOW (window), button);
 * 
 *   gtk_window_present (GTK_WINDOW (window));
 * }
 * ```
 * 
 * ## Using a GtkSpinButton to get a floating point value
 * 
 * ```c
 * // Provides a function to retrieve a floating point value from a
 * // GtkSpinButton, and creates a high precision spin button.
 * 
 * float
 * grab_float_value (GtkSpinButton *button,
 *                   gpointer       user_data)
 * {
 *   return gtk_spin_button_get_value (button);
 * }
 * 
 * void
 * create_floating_spin_button (void)
 * {
 *   GtkWidget *window, *button;
 *   GtkAdjustment *adjustment;
 * 
 *   adjustment = gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.0);
 * 
 *   window = gtk_window_new ();
 * 
 *   // creates the spinbutton, with three decimal places
 *   button = gtk_spin_button_new (adjustment, 0.001, 3);
 *   gtk_window_set_child (GTK_WINDOW (window), button);
 * 
 *   gtk_window_present (GTK_WINDOW (window));
 * }
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * spinbutton.horizontal
 * ├── text
 * │    ├── undershoot.left
 * │    ╰── undershoot.right
 * ├── button.down
 * ╰── button.up
 * ```
 * 
 * ```
 * spinbutton.vertical
 * ├── button.up
 * ├── text
 * │    ├── undershoot.left
 * │    ╰── undershoot.right
 * ╰── button.down
 * ```
 * 
 * `GtkSpinButton`s main CSS node has the name spinbutton. It creates subnodes
 * for the entry and the two buttons, with these names. The button nodes have
 * the style classes .up and .down. The `GtkText` subnodes (if present) are put
 * below the text node. The orientation of the spin button is reflected in
 * the .vertical or .horizontal style class on the main node.
 * 
 * # Accessibility
 * 
 * `GtkSpinButton` uses the %GTK_ACCESSIBLE_ROLE_SPIN_BUTTON role.
 *
 */
@interface OGTKSpinButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)initWithAdjustment:(OGTKAdjustment*)adjustment climbRate:(double)climbRate digits:(guint)digits;
- (instancetype)initWithRangeWithMin:(double)min max:(double)max step:(double)step;

/**
 * Methods
 */

- (GtkSpinButton*)castedGObject;

/**
 * Changes the properties of an existing spin button.
 * 
 * The adjustment, climb rate, and number of decimal places
 * are updated accordingly.
 *
 * @param adjustment a `GtkAdjustment` to replace the spin button’s
 *   existing adjustment, or %NULL to leave its current adjustment unchanged
 * @param climbRate the new climb rate
 * @param digits the number of decimal places to display in the spin button
 */
- (void)configureWithAdjustment:(OGTKAdjustment*)adjustment climbRate:(double)climbRate digits:(guint)digits;

/**
 * Retrieves the value set by [method@Gtk.SpinButton.set_activates_default].
 *
 * @return %TRUE if the spin button will activate the default widget
 */
- (bool)activatesDefault;

/**
 * Get the adjustment associated with a `GtkSpinButton`.
 *
 * @return the `GtkAdjustment` of @spin_button
 */
- (OGTKAdjustment*)adjustment;

/**
 * Returns the acceleration rate for repeated changes.
 *
 * @return the acceleration rate
 */
- (double)climbRate;

/**
 * Fetches the precision of @spin_button.
 *
 * @return the current precision
 */
- (guint)digits;

/**
 * Gets the current step and page the increments
 * used by @spin_button.
 * 
 * See [method@Gtk.SpinButton.set_increments].
 *
 * @param step location to store step increment
 * @param page location to store page increment
 */
- (void)incrementsWithStep:(double*)step page:(double*)page;

/**
 * Returns whether non-numeric text can be typed into the spin button.
 *
 * @return %TRUE if only numeric text can be entered
 */
- (bool)numeric;

/**
 * Gets the range allowed for @spin_button.
 * 
 * See [method@Gtk.SpinButton.set_range].
 *
 * @param min location to store minimum allowed value
 * @param max location to store maximum allowed value
 */
- (void)rangeWithMin:(double*)min max:(double*)max;

/**
 * Returns whether the values are corrected to the nearest step.
 *
 * @return %TRUE if values are snapped to the nearest step
 */
- (bool)snapToTicks;

/**
 * Gets the update behavior of a spin button.
 * 
 * See [method@Gtk.SpinButton.set_update_policy].
 *
 * @return the current update policy
 */
- (GtkSpinButtonUpdatePolicy)updatePolicy;

/**
 * Get the value in the @spin_button.
 *
 * @return the value of @spin_button
 */
- (double)value;

/**
 * Get the value @spin_button represented as an integer.
 *
 * @return the value of @spin_button
 */
- (int)valueAsInt;

/**
 * Returns whether the spin button’s value wraps around to the
 * opposite limit when the upper or lower limit of the range is
 * exceeded.
 *
 * @return %TRUE if the spin button wraps around
 */
- (bool)wrap;

/**
 * Sets whether activating the spin button will activate the default
 * widget for the window containing the spin button.
 * 
 * See [signal@Gtk.SpinButton::activate] for what counts as activation.
 *
 * @param activatesDefault %TRUE to activate window’s default widget on activation
 */
- (void)setActivatesDefault:(bool)activatesDefault;

/**
 * Replaces the `GtkAdjustment` associated with @spin_button.
 *
 * @param adjustment a `GtkAdjustment` to replace the existing adjustment
 */
- (void)setAdjustment:(OGTKAdjustment*)adjustment;

/**
 * Sets the acceleration rate for repeated changes when you
 * hold down a button or key.
 *
 * @param climbRate the rate of acceleration, must be >= 0
 */
- (void)setClimbRate:(double)climbRate;

/**
 * Set the precision to be displayed by @spin_button.
 * 
 * Up to 20 digit precision is allowed.
 *
 * @param digits the number of digits after the decimal point to be
 *   displayed for the spin button’s value
 */
- (void)setDigits:(guint)digits;

/**
 * Sets the step and page increments for spin_button.
 * 
 * This affects how quickly the value changes when
 * the spin button’s arrows are activated.
 *
 * @param step increment applied for a button 1 press.
 * @param page increment applied for a button 2 press.
 */
- (void)setIncrementsWithStep:(double)step page:(double)page;

/**
 * Sets the flag that determines if non-numeric text can be typed
 * into the spin button.
 *
 * @param numeric flag indicating if only numeric entry is allowed
 */
- (void)setNumeric:(bool)numeric;

/**
 * Sets the minimum and maximum allowable values for @spin_button.
 * 
 * If the current value is outside this range, it will be adjusted
 * to fit within the range, otherwise it will remain unchanged.
 *
 * @param min minimum allowable value
 * @param max maximum allowable value
 */
- (void)setRangeWithMin:(double)min max:(double)max;

/**
 * Sets the policy as to whether values are corrected to the
 * nearest step increment when a spin button is activated after
 * providing an invalid value.
 *
 * @param snapToTicks a flag indicating if invalid values should be corrected
 */
- (void)setSnapToTicks:(bool)snapToTicks;

/**
 * Sets the update behavior of a spin button.
 * 
 * This determines whether the spin button is always
 * updated or only when a valid value is set.
 *
 * @param policy a `GtkSpinButtonUpdatePolicy` value
 */
- (void)setUpdatePolicy:(GtkSpinButtonUpdatePolicy)policy;

/**
 * Sets the value of @spin_button.
 *
 * @param value the new value
 */
- (void)setValue:(double)value;

/**
 * Sets the flag that determines if a spin button value wraps
 * around to the opposite limit when the upper or lower limit
 * of the range is exceeded.
 *
 * @param wrap a flag indicating if wrapping behavior is performed
 */
- (void)setWrap:(bool)wrap;

/**
 * Increment or decrement a spin button’s value in a specified
 * direction by a specified amount.
 *
 * @param direction a `GtkSpinType` indicating the direction to spin
 * @param increment step increment to apply in the specified direction
 */
- (void)spinWithDirection:(GtkSpinType)direction increment:(double)increment;

/**
 * Manually force an update of the spin button.
 *
 */
- (void)update;

@end