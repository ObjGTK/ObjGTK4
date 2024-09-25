/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKAdjustment;

/**
 * `GtkScaleButton` provides a button which pops up a scale widget.
 * 
 * This kind of widget is commonly used for volume controls in multimedia
 * applications, and GTK provides a [class@Gtk.VolumeButton] subclass that
 * is tailored for this use case.
 * 
 * # CSS nodes
 * 
 * ```
 * scalebutton.scale
 * ╰── button.toggle
 *     ╰── <icon>
 * ```
 * 
 * `GtkScaleButton` has a single CSS node with name scalebutton and `.scale`
 * style class, and contains a `button` node with a `.toggle` style class.
 *
 */
@interface OGTKScaleButton : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)initWithMin:(double)min max:(double)max step:(double)step icons:(const char**)icons;

/**
 * Methods
 */

- (GtkScaleButton*)castedGObject;

/**
 * Queries a `GtkScaleButton` and returns its current state.
 * 
 * Returns %TRUE if the scale button is pressed in and %FALSE
 * if it is raised.
 *
 * @return whether the button is pressed
 */
- (bool)active;

/**
 * Gets the `GtkAdjustment` associated with the `GtkScaleButton`’s scale.
 * 
 * See [method@Gtk.Range.get_adjustment] for details.
 *
 * @return the adjustment associated with the scale
 */
- (OGTKAdjustment*)adjustment;

/**
 * Returns whether the button has a frame.
 *
 * @return %TRUE if the button has a frame
 */
- (bool)hasFrame;

/**
 * Retrieves the minus button of the `GtkScaleButton`.
 *
 * @return the minus button
 *   of the `GtkScaleButton`
 */
- (OGTKWidget*)minusButton;

/**
 * Retrieves the plus button of the `GtkScaleButton.`
 *
 * @return the plus button
 *   of the `GtkScaleButton`
 */
- (OGTKWidget*)plusButton;

/**
 * Retrieves the popup of the `GtkScaleButton`.
 *
 * @return the popup of the `GtkScaleButton`
 */
- (OGTKWidget*)popup;

/**
 * Gets the current value of the scale button.
 *
 * @return current value of the scale button
 */
- (double)value;

/**
 * Sets the `GtkAdjustment` to be used as a model
 * for the `GtkScaleButton`’s scale.
 * 
 * See [method@Gtk.Range.set_adjustment] for details.
 *
 * @param adjustment a `GtkAdjustment`
 */
- (void)setAdjustment:(OGTKAdjustment*)adjustment;

/**
 * Sets the style of the button.
 *
 * @param hasFrame whether the button should have a visible frame
 */
- (void)setHasFrame:(bool)hasFrame;

/**
 * Sets the icons to be used by the scale button.
 *
 * @param icons a %NULL-terminated array of icon names
 */
- (void)setIcons:(const char**)icons;

/**
 * Sets the current value of the scale.
 * 
 * If the value is outside the minimum or maximum range values,
 * it will be clamped to fit inside them.
 * 
 * The scale button emits the [signal@Gtk.ScaleButton::value-changed]
 * signal if the value changes.
 *
 * @param value new value of the scale button
 */
- (void)setValue:(double)value;

@end