/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

/**
 * `GtkEventControllerFocus` is an event controller to keep track of
 * keyboard focus.
 * 
 * The event controller offers [signal@Gtk.EventControllerFocus::enter]
 * and [signal@Gtk.EventControllerFocus::leave] signals, as well as
 * [property@Gtk.EventControllerFocus:is-focus] and
 * [property@Gtk.EventControllerFocus:contains-focus] properties
 * which are updated to reflect focus changes inside the widget hierarchy
 * that is rooted at the controllers widget.
 *
 */
@interface OGTKEventControllerFocus : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkEventControllerFocus*)castedGObject;

/**
 * Returns %TRUE if focus is within @self or one of its children.
 *
 * @return %TRUE if focus is within @self or one of its children
 */
- (bool)containsFocus;

/**
 * Returns %TRUE if focus is within @self, but not one of its children.
 *
 * @return %TRUE if focus is within @self, but not one of its children
 */
- (bool)isFocus;

@end