/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@class OGGdkDeviceTool;
@class OGTKGesture;

/**
 * `GtkGestureStylus` is a `GtkGesture` specific to stylus input.
 * 
 * The provided signals just relay the basic information of the
 * stylus events.
 *
 */
@interface OGTKGestureStylus : OGTKGestureSingle
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGestureStylus*)castedGObject;

/**
 * Returns the current values for the requested @axes.
 * 
 * This function must be called from the handler of one of the
 * [signal@Gtk.GestureStylus::down], [signal@Gtk.GestureStylus::motion],
 * [signal@Gtk.GestureStylus::up] or [signal@Gtk.GestureStylus::proximity]
 * signals.
 *
 * @param axes array of requested axes, terminated with %GDK_AXIS_IGNORE
 * @param values return location for the axis values
 * @return %TRUE if there is a current value for the axes
 */
- (bool)axesWithAxes:(GdkAxisUse*)axes values:(double**)values;

/**
 * Returns the current value for the requested @axis.
 * 
 * This function must be called from the handler of one of the
 * [signal@Gtk.GestureStylus::down], [signal@Gtk.GestureStylus::motion],
 * [signal@Gtk.GestureStylus::up] or [signal@Gtk.GestureStylus::proximity]
 * signals.
 *
 * @param axis requested device axis
 * @param value return location for the axis value
 * @return %TRUE if there is a current value for the axis
 */
- (bool)axisWithAxis:(GdkAxisUse)axis value:(double*)value;

/**
 * Returns the accumulated backlog of tracking information.
 * 
 * By default, GTK will limit rate of input events. On stylus input
 * where accuracy of strokes is paramount, this function returns the
 * accumulated coordinate/timing state before the emission of the
 * current [Gtk.GestureStylus::motion] signal.
 * 
 * This function may only be called within a [signal@Gtk.GestureStylus::motion]
 * signal handler, the state given in this signal and obtainable through
 * [method@Gtk.GestureStylus.get_axis] express the latest (most up-to-date)
 * state in motion history.
 * 
 * The @backlog is provided in chronological order.
 *
 * @param backlog coordinates and times for the backlog events
 * @param nelems return location for the number of elements
 * @return %TRUE if there is a backlog to unfold in the current state.
 */
- (bool)backlogWithBacklog:(GdkTimeCoord**)backlog nelems:(guint*)nelems;

/**
 * Returns the `GdkDeviceTool` currently driving input through this gesture.
 * 
 * This function must be called from the handler of one of the
 * [signal@Gtk.GestureStylus::down], [signal@Gtk.GestureStylus::motion],
 * [signal@Gtk.GestureStylus::up] or [signal@Gtk.GestureStylus::proximity]
 * signals.
 *
 * @return The current stylus tool
 */
- (OGGdkDeviceTool*)deviceTool;

/**
 * Checks whether the gesture is for styluses only.
 * 
 * Stylus-only gestures will signal events exclusively from stylus
 * input devices.
 *
 * @return %TRUE if the gesture is only for stylus events
 */
- (bool)stylusOnly;

/**
 * Sets the state of stylus-only
 * 
 * If true, the gesture will exclusively handle events from stylus input devices,
 * otherwise it'll handle events from any pointing device.
 *
 * @param stylusOnly whether the gesture is used exclusively for stylus events
 */
- (void)setStylusOnly:(bool)stylusOnly;

@end