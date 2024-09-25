/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkAdjustment` is a model for a numeric value.
 * 
 * The `GtkAdjustment` has an associated lower and upper bound.
 * It also contains step and page increments, and a page size.
 * 
 * Adjustments are used within several GTK widgets, including
 * [class@Gtk.SpinButton], [class@Gtk.Viewport], [class@Gtk.Scrollbar]
 * and [class@Gtk.Scale].
 * 
 * The `GtkAdjustment` object does not update the value itself. Instead
 * it is left up to the owner of the `GtkAdjustment` to control the value.
 *
 */
@interface OGTKAdjustment : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithValue:(double)value lower:(double)lower upper:(double)upper stepIncrement:(double)stepIncrement pageIncrement:(double)pageIncrement pageSize:(double)pageSize;

/**
 * Methods
 */

- (GtkAdjustment*)castedGObject;

/**
 * Updates the value property to ensure that the range
 * between @lower and @upper is in the current page.
 * 
 * The current page goes from `value` to `value` + `page-size`.
 * If the range is larger than the page size, then only the
 * start of it will be in the current page.
 * 
 * A [signal@Gtk.Adjustment::value-changed] signal will be emitted
 * if the value is changed.
 *
 * @param lower the lower value
 * @param upper the upper value
 */
- (void)clampPageWithLower:(double)lower upper:(double)upper;

/**
 * Sets all properties of the adjustment at once.
 * 
 * Use this function to avoid multiple emissions of the
 * [signal@Gtk.Adjustment::changed] signal. See
 * [method@Gtk.Adjustment.set_lower] for an alternative
 * way of compressing multiple emissions of
 * [signal@Gtk.Adjustment::changed] into one.
 *
 * @param value the new value
 * @param lower the new minimum value
 * @param upper the new maximum value
 * @param stepIncrement the new step increment
 * @param pageIncrement the new page increment
 * @param pageSize the new page size
 */
- (void)configureWithValue:(double)value lower:(double)lower upper:(double)upper stepIncrement:(double)stepIncrement pageIncrement:(double)pageIncrement pageSize:(double)pageSize;

/**
 * Retrieves the minimum value of the adjustment.
 *
 * @return The current minimum value of the adjustment
 */
- (double)lower;

/**
 * Gets the smaller of step increment and page increment.
 *
 * @return the minimum increment of @adjustment
 */
- (double)minimumIncrement;

/**
 * Retrieves the page increment of the adjustment.
 *
 * @return The current page increment of the adjustment
 */
- (double)pageIncrement;

/**
 * Retrieves the page size of the adjustment.
 *
 * @return The current page size of the adjustment
 */
- (double)pageSize;

/**
 * Retrieves the step increment of the adjustment.
 *
 * @return The current step increment of the adjustment.
 */
- (double)stepIncrement;

/**
 * Retrieves the maximum value of the adjustment.
 *
 * @return The current maximum value of the adjustment
 */
- (double)upper;

/**
 * Gets the current value of the adjustment.
 *
 * @return The current value of the adjustment
 */
- (double)value;

/**
 * Sets the minimum value of the adjustment.
 * 
 * When setting multiple adjustment properties via their individual
 * setters, multiple [signal@Gtk.Adjustment::changed] signals will
 * be emitted. However, since the emission of the
 * [signal@Gtk.Adjustment::changed] signal is tied to the emission
 * of the ::notify signals of the changed properties, it’s possible
 * to compress the [signal@Gtk.Adjustment::changed] signals into one
 * by calling g_object_freeze_notify() and g_object_thaw_notify()
 * around the calls to the individual setters.
 * 
 * Alternatively, using a single g_object_set() for all the properties
 * to change, or using [method@Gtk.Adjustment.configure] has the same effect.
 *
 * @param lower the new minimum value
 */
- (void)setLower:(double)lower;

/**
 * Sets the page increment of the adjustment.
 * 
 * See [method@Gtk.Adjustment.set_lower] about how to compress
 * multiple emissions of the [signal@Gtk.Adjustment::changed]
 * signal when setting multiple adjustment properties.
 *
 * @param pageIncrement the new page increment
 */
- (void)setPageIncrement:(double)pageIncrement;

/**
 * Sets the page size of the adjustment.
 * 
 * See [method@Gtk.Adjustment.set_lower] about how to compress
 * multiple emissions of the [signal@Gtk.Adjustment::changed]
 * signal when setting multiple adjustment properties.
 *
 * @param pageSize the new page size
 */
- (void)setPageSize:(double)pageSize;

/**
 * Sets the step increment of the adjustment.
 * 
 * See [method@Gtk.Adjustment.set_lower] about how to compress
 * multiple emissions of the [signal@Gtk.Adjustment::changed]
 * signal when setting multiple adjustment properties.
 *
 * @param stepIncrement the new step increment
 */
- (void)setStepIncrement:(double)stepIncrement;

/**
 * Sets the maximum value of the adjustment.
 * 
 * Note that values will be restricted by `upper - page-size`
 * if the page-size property is nonzero.
 * 
 * See [method@Gtk.Adjustment.set_lower] about how to compress
 * multiple emissions of the [signal@Gtk.Adjustment::changed]
 * signal when setting multiple adjustment properties.
 *
 * @param upper the new maximum value
 */
- (void)setUpper:(double)upper;

/**
 * Sets the `GtkAdjustment` value.
 * 
 * The value is clamped to lie between [property@Gtk.Adjustment:lower]
 * and [property@Gtk.Adjustment:upper].
 * 
 * Note that for adjustments which are used in a `GtkScrollbar`,
 * the effective range of allowed values goes from
 * [property@Gtk.Adjustment:lower] to
 * [property@Gtk.Adjustment:upper] - [property@Gtk.Adjustment:page-size].
 *
 * @param value the new value
 */
- (void)setValue:(double)value;

@end