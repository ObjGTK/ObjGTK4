/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkCalendar` is a widget that displays a Gregorian calendar, one month
 * at a time.
 * 
 * ![An example GtkCalendar](calendar.png)
 * 
 * A `GtkCalendar` can be created with [ctor@Gtk.Calendar.new].
 * 
 * The date that is currently displayed can be altered with
 * [method@Gtk.Calendar.select_day].
 * 
 * To place a visual marker on a particular day, use
 * [method@Gtk.Calendar.mark_day] and to remove the marker,
 * [method@Gtk.Calendar.unmark_day]. Alternative, all
 * marks can be cleared with [method@Gtk.Calendar.clear_marks].
 * 
 * The selected date can be retrieved from a `GtkCalendar` using
 * [method@Gtk.Calendar.get_date].
 * 
 * Users should be aware that, although the Gregorian calendar is the
 * legal calendar in most countries, it was adopted progressively
 * between 1582 and 1929. Display before these dates is likely to be
 * historically incorrect.
 * 
 * # CSS nodes
 * 
 * ```
 * calendar.view
 * ├── header
 * │   ├── button
 * │   ├── stack.month
 * │   ├── button
 * │   ├── button
 * │   ├── label.year
 * │   ╰── button
 * ╰── grid
 *     ╰── label[.day-name][.week-number][.day-number][.other-month][.today]
 * ```
 * 
 * `GtkCalendar` has a main node with name calendar. It contains a subnode
 * called header containing the widgets for switching between years and months.
 * 
 * The grid subnode contains all day labels, including week numbers on the left
 * (marked with the .week-number css class) and day names on top (marked with the
 * .day-name css class).
 * 
 * Day labels that belong to the previous or next month get the .other-month
 * style class. The label of the current day get the .today style class.
 * 
 * Marked day labels get the :selected state assigned.
 *
 */
@interface OGTKCalendar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCalendar*)castedGObject;

/**
 * Remove all visual markers.
 *
 */
- (void)clearMarks;

/**
 * Returns a `GDateTime` representing the shown
 * year, month and the selected day.
 * 
 * The returned date is in the local time zone.
 *
 * @return the `GDateTime` representing the shown date
 */
- (GDateTime*)date;

/**
 * Gets the day of the selected date.
 *
 * @return the day of the selected date.
 */
- (int)day;

/**
 * Returns if the @day of the @calendar is already marked.
 *
 * @param day the day number between 1 and 31.
 * @return whether the day is marked.
 */
- (bool)dayIsMarked:(guint)day;

/**
 * Gets the month of the selected date.
 *
 * @return The month of the selected date (as a number between 0 and 11).
 */
- (int)month;

/**
 * Returns whether @self is currently showing the names
 * of the week days.
 * 
 * This is the value of the [property@Gtk.Calendar:show-day-names]
 * property.
 *
 * @return Whether the calendar shows day names.
 */
- (bool)showDayNames;

/**
 * Returns whether @self is currently showing the heading.
 * 
 * This is the value of the [property@Gtk.Calendar:show-heading]
 * property.
 *
 * @return Whether the calendar is showing a heading.
 */
- (bool)showHeading;

/**
 * Returns whether @self is showing week numbers right
 * now.
 * 
 * This is the value of the [property@Gtk.Calendar:show-week-numbers]
 * property.
 *
 * @return Whether the calendar is showing week numbers.
 */
- (bool)showWeekNumbers;

/**
 * Gets the year of the selected date.
 *
 * @return the year of the selected date.
 */
- (int)year;

/**
 * Places a visual marker on a particular day of the current month.
 *
 * @param day the day number to mark between 1 and 31.
 */
- (void)markDay:(guint)day;

/**
 * Switches to @date's year and month and select its day.
 *
 * @param date a `GDateTime` representing the day to select
 */
- (void)selectDay:(GDateTime*)date;

/**
 * Sets the day for the selected date.
 * 
 * The new date must be valid. For example, setting 31 for the day when the
 * month is February, fails.
 *
 * @param day The desired day for the selected date (as a number between 1 and 31).
 */
- (void)setDay:(int)day;

/**
 * Sets the month for the selected date.
 * 
 * The new date must be valid. For example, setting 1 (February) for the month
 * when the day is 31, fails.
 *
 * @param month The desired month for the selected date (as a number between 0 and 11).
 */
- (void)setMonth:(int)month;

/**
 * Sets whether the calendar shows day names.
 *
 * @param value Whether to show day names above the day numbers
 */
- (void)setShowDayNames:(bool)value;

/**
 * Sets whether the calendar should show a heading.
 * 
 * The heading contains the current year and month as well as
 * buttons for changing both.
 *
 * @param value Whether to show the heading in the calendar
 */
- (void)setShowHeading:(bool)value;

/**
 * Sets whether week numbers are shown in the calendar.
 *
 * @param value whether to show week numbers on the left of the days
 */
- (void)setShowWeekNumbers:(bool)value;

/**
 * Sets the year for the selected date.
 * 
 * The new date must be valid. For example, setting 2023 for the year when then
 * the date is 2024-02-29, fails.
 *
 * @param year The desired year for the selected date (within [struct@GLib.DateTime]
 *   limits, i.e. from 0001 to 9999).
 */
- (void)setYear:(int)year;

/**
 * Removes the visual marker from a particular day.
 *
 * @param day the day number to unmark between 1 and 31.
 */
- (void)unmarkDay:(guint)day;

@end