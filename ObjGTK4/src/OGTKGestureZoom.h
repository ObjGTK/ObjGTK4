/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGesture.h"

/**
 * `GtkGestureZoom` is a `GtkGesture` for 2-finger pinch/zoom gestures.
 * 
 * Whenever the distance between both tracked sequences changes, the
 * [signal@Gtk.GestureZoom::scale-changed] signal is emitted to report
 * the scale factor.
 *
 */
@interface OGTKGestureZoom : OGTKGesture
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGestureZoom*)castedGObject;

/**
 * Gets the scale delta.
 * 
 * If @gesture is active, this function returns the zooming
 * difference since the gesture was recognized (hence the
 * starting point is considered 1:1). If @gesture is not
 * active, 1 is returned.
 *
 * @return the scale delta
 */
- (double)scaleDelta;

@end