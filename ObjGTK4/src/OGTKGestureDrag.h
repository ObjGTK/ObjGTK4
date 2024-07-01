/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@class OGTKGesture;

/**
 * `GtkGestureDrag` is a `GtkGesture` implementation for drags.
 * 
 * The drag operation itself can be tracked throughout the
 * [signal@Gtk.GestureDrag::drag-begin],
 * [signal@Gtk.GestureDrag::drag-update] and
 * [signal@Gtk.GestureDrag::drag-end] signals, and the relevant
 * coordinates can be extracted through
 * [method@Gtk.GestureDrag.get_offset] and
 * [method@Gtk.GestureDrag.get_start_point].
 *
 */
@interface OGTKGestureDrag : OGTKGestureSingle
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGestureDrag*)castedGObject;

/**
 * Gets the offset from the start point.
 * 
 * If the @gesture is active, this function returns %TRUE and
 * fills in @x and @y with the coordinates of the current point,
 * as an offset to the starting drag point.
 *
 * @param x X offset for the current point
 * @param y Y offset for the current point
 * @return %TRUE if the gesture is active
 */
- (bool)offsetWithX:(double*)x y:(double*)y;

/**
 * Gets the point where the drag started.
 * 
 * If the @gesture is active, this function returns %TRUE
 * and fills in @x and @y with the drag start coordinates,
 * in widget-relative coordinates.
 *
 * @param x X coordinate for the drag start point
 * @param y Y coordinate for the drag start point
 * @return %TRUE if the gesture is active
 */
- (bool)startPointWithX:(double*)x y:(double*)y;

@end