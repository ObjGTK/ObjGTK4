/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

/**
 * `GtkEventControllerMotion` is an event controller tracking the pointer
 * position.
 * 
 * The event controller offers [signal@Gtk.EventControllerMotion::enter]
 * and [signal@Gtk.EventControllerMotion::leave] signals, as well as
 * [property@Gtk.EventControllerMotion:is-pointer] and
 * [property@Gtk.EventControllerMotion:contains-pointer] properties
 * which are updated to reflect changes in the pointer position as it
 * moves over the widget.
 *
 */
@interface OGTKEventControllerMotion : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkEventControllerMotion*)castedGObject;

/**
 * Returns if a pointer is within @self or one of its children.
 *
 * @return %TRUE if a pointer is within @self or one of its children
 */
- (bool)containsPointer;

/**
 * Returns if a pointer is within @self, but not one of its children.
 *
 * @return %TRUE if a pointer is within @self but not one of its children
 */
- (bool)isPointer;

@end