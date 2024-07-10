/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

@class OGTKIMContext;
@class OGTKWidget;

/**
 * `GtkEventControllerKey` is an event controller that provides access
 * to key events.
 *
 */
@interface OGTKEventControllerKey : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkEventControllerKey*)castedGObject;

/**
 * Forwards the current event of this @controller to a @widget.
 * 
 * This function can only be used in handlers for the
 * [signal@Gtk.EventControllerKey::key-pressed],
 * [signal@Gtk.EventControllerKey::key-released]
 * or [signal@Gtk.EventControllerKey::modifiers] signals.
 *
 * @param widget a `GtkWidget`
 * @return whether the @widget handled the event
 */
- (bool)forward:(OGTKWidget*)widget;

/**
 * Gets the key group of the current event of this @controller.
 * 
 * See [method@Gdk.KeyEvent.get_layout].
 *
 * @return the key group
 */
- (guint)group;

/**
 * Gets the input method context of the key @controller.
 *
 * @return the `GtkIMContext`
 */
- (OGTKIMContext*)imContext;

/**
 * Sets the input method context of the key @controller.
 *
 * @param imContext a `GtkIMContext`
 */
- (void)setImContext:(OGTKIMContext*)imContext;

@end