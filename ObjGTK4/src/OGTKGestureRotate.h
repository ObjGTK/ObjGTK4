/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGesture.h"

/**
 * `GtkGestureRotate` is a `GtkGesture` for 2-finger rotations.
 * 
 * Whenever the angle between both handled sequences changes, the
 * [signal@Gtk.GestureRotate::angle-changed] signal is emitted.
 *
 */
@interface OGTKGestureRotate : OGTKGesture
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGestureRotate*)castedGObject;

/**
 * Gets the angle delta in radians.
 * 
 * If @gesture is active, this function returns the angle difference
 * in radians since the gesture was first recognized. If @gesture is
 * not active, 0 is returned.
 *
 * @return the angle delta in radians
 */
- (double)angleDelta;

@end