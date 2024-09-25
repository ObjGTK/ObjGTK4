/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkLevelBar` is a widget that can be used as a level indicator.
 * 
 * Typical use cases are displaying the strength of a password, or
 * showing the charge level of a battery.
 * 
 * ![An example GtkLevelBar](levelbar.png)
 * 
 * Use [method@Gtk.LevelBar.set_value] to set the current value, and
 * [method@Gtk.LevelBar.add_offset_value] to set the value offsets at which
 * the bar will be considered in a different state. GTK will add a few
 * offsets by default on the level bar: %GTK_LEVEL_BAR_OFFSET_LOW,
 * %GTK_LEVEL_BAR_OFFSET_HIGH and %GTK_LEVEL_BAR_OFFSET_FULL, with
 * values 0.25, 0.75 and 1.0 respectively.
 * 
 * Note that it is your responsibility to update preexisting offsets
 * when changing the minimum or maximum value. GTK will simply clamp
 * them to the new range.
 * 
 * ## Adding a custom offset on the bar
 * 
 * ```c
 * static GtkWidget *
 * create_level_bar (void)
 * {
 *   GtkWidget *widget;
 *   GtkLevelBar *bar;
 * 
 *   widget = gtk_level_bar_new ();
 *   bar = GTK_LEVEL_BAR (widget);
 * 
 *   // This changes the value of the default low offset
 * 
 *   gtk_level_bar_add_offset_value (bar,
 *                                   GTK_LEVEL_BAR_OFFSET_LOW,
 *                                   0.10);
 * 
 *   // This adds a new offset to the bar; the application will
 *   // be able to change its color CSS like this:
 *   //
 *   // levelbar block.my-offset {
 *   //   background-color: magenta;
 *   //   border-style: solid;
 *   //   border-color: black;
 *   //   border-width: 1px;
 *   // }
 * 
 *   gtk_level_bar_add_offset_value (bar, "my-offset", 0.60);
 * 
 *   return widget;
 * }
 * ```
 * 
 * The default interval of values is between zero and one, but it’s possible
 * to modify the interval using [method@Gtk.LevelBar.set_min_value] and
 * [method@Gtk.LevelBar.set_max_value]. The value will be always drawn in
 * proportion to the admissible interval, i.e. a value of 15 with a specified
 * interval between 10 and 20 is equivalent to a value of 0.5 with an interval
 * between 0 and 1. When %GTK_LEVEL_BAR_MODE_DISCRETE is used, the bar level
 * is rendered as a finite number of separated blocks instead of a single one.
 * The number of blocks that will be rendered is equal to the number of units
 * specified by the admissible interval.
 * 
 * For instance, to build a bar rendered with five blocks, it’s sufficient to
 * set the minimum value to 0 and the maximum value to 5 after changing the
 * indicator mode to discrete.
 * 
 * # GtkLevelBar as GtkBuildable
 * 
 * The `GtkLevelBar` implementation of the `GtkBuildable` interface supports a
 * custom `<offsets>` element, which can contain any number of `<offset>` elements,
 * each of which must have "name" and "value" attributes.
 * 
 * # CSS nodes
 * 
 * ```
 * levelbar[.discrete]
 * ╰── trough
 *     ├── block.filled.level-name
 *     ┊
 *     ├── block.empty
 *     ┊
 * ```
 * 
 * `GtkLevelBar` has a main CSS node with name levelbar and one of the style
 * classes .discrete or .continuous and a subnode with name trough. Below the
 * trough node are a number of nodes with name block and style class .filled
 * or .empty. In continuous mode, there is exactly one node of each, in discrete
 * mode, the number of filled and unfilled nodes corresponds to blocks that are
 * drawn. The block.filled nodes also get a style class .level-name corresponding
 * to the level for the current value.
 * 
 * In horizontal orientation, the nodes are always arranged from left to right,
 * regardless of text direction.
 * 
 * # Accessibility
 * 
 * `GtkLevelBar` uses the %GTK_ACCESSIBLE_ROLE_METER role.
 *
 */
@interface OGTKLevelBar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initForIntervalWithMinValue:(double)minValue maxValue:(double)maxValue;

/**
 * Methods
 */

- (GtkLevelBar*)castedGObject;

/**
 * Adds a new offset marker on @self at the position specified by @value.
 * 
 * When the bar value is in the interval topped by @value (or between @value
 * and [property@Gtk.LevelBar:max-value] in case the offset is the last one
 * on the bar) a style class named `level-`@name will be applied
 * when rendering the level bar fill.
 * 
 * If another offset marker named @name exists, its value will be
 * replaced by @value.
 *
 * @param name the name of the new offset
 * @param value the value for the new offset
 */
- (void)addOffsetValueWithName:(OFString*)name value:(double)value;

/**
 * Returns whether the levelbar is inverted.
 *
 * @return %TRUE if the level bar is inverted
 */
- (bool)inverted;

/**
 * Returns the `max-value` of the `GtkLevelBar`.
 *
 * @return a positive value
 */
- (double)maxValue;

/**
 * Returns the `min-value` of the `GtkLevelBar`.
 *
 * @return a positive value
 */
- (double)minValue;

/**
 * Returns the `mode` of the `GtkLevelBar`.
 *
 * @return a `GtkLevelBarMode`
 */
- (GtkLevelBarMode)mode;

/**
 * Fetches the value specified for the offset marker @name in @self.
 *
 * @param name the name of an offset in the bar
 * @param value location where to store the value
 * @return %TRUE if the specified offset is found
 */
- (bool)offsetValueWithName:(OFString*)name value:(double*)value;

/**
 * Returns the `value` of the `GtkLevelBar`.
 *
 * @return a value in the interval between
 *   [property@Gtk.LevelBar:min-value] and [property@Gtk.LevelBar:max-value]
 */
- (double)value;

/**
 * Removes an offset marker from a `GtkLevelBar`.
 * 
 * The marker must have been previously added with
 * [method@Gtk.LevelBar.add_offset_value].
 *
 * @param name the name of an offset in the bar
 */
- (void)removeOffsetValue:(OFString*)name;

/**
 * Sets whether the `GtkLevelBar` is inverted.
 *
 * @param inverted %TRUE to invert the level bar
 */
- (void)setInverted:(bool)inverted;

/**
 * Sets the `max-value` of the `GtkLevelBar`.
 * 
 * You probably want to update preexisting level offsets after calling
 * this function.
 *
 * @param value a positive value
 */
- (void)setMaxValue:(double)value;

/**
 * Sets the `min-value` of the `GtkLevelBar`.
 * 
 * You probably want to update preexisting level offsets after calling
 * this function.
 *
 * @param value a positive value
 */
- (void)setMinValue:(double)value;

/**
 * Sets the `mode` of the `GtkLevelBar`.
 *
 * @param mode a `GtkLevelBarMode`
 */
- (void)setMode:(GtkLevelBarMode)mode;

/**
 * Sets the value of the `GtkLevelBar`.
 *
 * @param value a value in the interval between
 *   [property@Gtk.LevelBar:min-value] and [property@Gtk.LevelBar:max-value]
 */
- (void)setValue:(double)value;

@end