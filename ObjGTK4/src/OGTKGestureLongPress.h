/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@class OGTKGesture;

/**
 * `GtkGestureLongPress` is a `GtkGesture` for long presses.
 * 
 * This gesture is also known as “Press and Hold”.
 * 
 * When the timeout is exceeded, the gesture is triggering the
 * [signal@Gtk.GestureLongPress::pressed] signal.
 * 
 * If the touchpoint is lifted before the timeout passes, or if
 * it drifts too far of the initial press point, the
 * [signal@Gtk.GestureLongPress::cancelled] signal will be emitted.
 * 
 * How long the timeout is before the ::pressed signal gets emitted is
 * determined by the [property@Gtk.Settings:gtk-long-press-time] setting.
 * It can be modified by the [property@Gtk.GestureLongPress:delay-factor]
 * property.
 *
 */
@interface OGTKGestureLongPress : OGTKGestureSingle
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGestureLongPress*)castedGObject;

/**
 * Returns the delay factor.
 *
 * @return the delay factor
 */
- (double)delayFactor;

/**
 * Applies the given delay factor.
 * 
 * The default long press time will be multiplied by this value.
 * Valid values are in the range [0.5..2.0].
 *
 * @param delayFactor The delay factor to apply
 */
- (void)setDelayFactor:(double)delayFactor;

@end