/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@class OGTKGesture;

/**
 * `GtkGestureSwipe` is a `GtkGesture` for swipe gestures.
 * 
 * After a press/move/.../move/release sequence happens, the
 * [signal@Gtk.GestureSwipe::swipe] signal will be emitted,
 * providing the velocity and directionality of the sequence
 * at the time it was lifted.
 * 
 * If the velocity is desired in intermediate points,
 * [method@Gtk.GestureSwipe.get_velocity] can be called in a
 * [signal@Gtk.Gesture::update] handler.
 * 
 * All velocities are reported in pixels/sec units.
 *
 */
@interface OGTKGestureSwipe : OGTKGestureSingle
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGestureSwipe*)castedGObject;

/**
 * Gets the current velocity.
 * 
 * If the gesture is recognized, this function returns %TRUE and fills
 * in @velocity_x and @velocity_y with the recorded velocity, as per the
 * last events processed.
 *
 * @param velocityX return value for the velocity in the X axis, in pixels/sec
 * @param velocityY return value for the velocity in the Y axis, in pixels/sec
 * @return whether velocity could be calculated
 */
- (bool)velocityWithVelocityX:(double*)velocityX velocityY:(double*)velocityY;

@end