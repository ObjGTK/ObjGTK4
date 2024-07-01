/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@class OGTKGesture;

/**
 * `GtkGestureClick` is a `GtkGesture` implementation for clicks.
 * 
 * It is able to recognize multiple clicks on a nearby zone, which
 * can be listened for through the [signal@Gtk.GestureClick::pressed]
 * signal. Whenever time or distance between clicks exceed the GTK
 * defaults, [signal@Gtk.GestureClick::stopped] is emitted, and the
 * click counter is reset.
 *
 */
@interface OGTKGestureClick : OGTKGestureSingle
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGestureClick*)castedGObject;

@end