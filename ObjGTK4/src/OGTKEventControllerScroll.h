/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

/**
 * `GtkEventControllerScroll` is an event controller that handles scroll
 * events.
 * 
 * It is capable of handling both discrete and continuous scroll
 * events from mice or touchpads, abstracting them both with the
 * [signal@Gtk.EventControllerScroll::scroll] signal. Deltas in
 * the discrete case are multiples of 1.
 * 
 * In the case of continuous scroll events, `GtkEventControllerScroll`
 * encloses all [signal@Gtk.EventControllerScroll::scroll] emissions
 * between two [signal@Gtk.EventControllerScroll::scroll-begin] and
 * [signal@Gtk.EventControllerScroll::scroll-end] signals.
 * 
 * The behavior of the event controller can be modified by the flags
 * given at creation time, or modified at a later point through
 * [method@Gtk.EventControllerScroll.set_flags] (e.g. because the scrolling
 * conditions of the widget changed).
 * 
 * The controller can be set up to emit motion for either/both vertical
 * and horizontal scroll events through %GTK_EVENT_CONTROLLER_SCROLL_VERTICAL,
 * %GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL and %GTK_EVENT_CONTROLLER_SCROLL_BOTH_AXES.
 * If any axis is disabled, the respective [signal@Gtk.EventControllerScroll::scroll]
 * delta will be 0. Vertical scroll events will be translated to horizontal
 * motion for the devices incapable of horizontal scrolling.
 * 
 * The event controller can also be forced to emit discrete events on all
 * devices through %GTK_EVENT_CONTROLLER_SCROLL_DISCRETE. This can be used
 * to implement discrete actions triggered through scroll events (e.g.
 * switching across combobox options).
 * 
 * The %GTK_EVENT_CONTROLLER_SCROLL_KINETIC flag toggles the emission of the
 * [signal@Gtk.EventControllerScroll::decelerate] signal, emitted at the end
 * of scrolling with two X/Y velocity arguments that are consistent with the
 * motion that was received.
 *
 */
@interface OGTKEventControllerScroll : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkEventControllerScrollFlags)flags;

/**
 * Methods
 */

- (GtkEventControllerScroll*)castedGObject;

/**
 * Gets the flags conditioning the scroll controller behavior.
 *
 * @return the controller flags.
 */
- (GtkEventControllerScrollFlags)flags;

/**
 * Gets the scroll unit of the last
 * [signal@Gtk.EventControllerScroll::scroll] signal received.
 * 
 * Always returns %GDK_SCROLL_UNIT_WHEEL if the
 * %GTK_EVENT_CONTROLLER_SCROLL_DISCRETE flag is set.
 *
 * @return the scroll unit.
 */
- (GdkScrollUnit)unit;

/**
 * Sets the flags conditioning scroll controller behavior.
 *
 * @param flags flags affecting the controller behavior
 */
- (void)setFlags:(GtkEventControllerScrollFlags)flags;

@end