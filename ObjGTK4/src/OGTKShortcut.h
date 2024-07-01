/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKShortcutAction;
@class OGTKShortcutTrigger;

/**
 * A `GtkShortcut` describes a keyboard shortcut.
 * 
 * It contains a description of how to trigger the shortcut via a
 * [class@Gtk.ShortcutTrigger] and a way to activate the shortcut
 * on a widget via a [class@Gtk.ShortcutAction].
 * 
 * The actual work is usually done via [class@Gtk.ShortcutController],
 * which decides if and when to activate a shortcut. Using that controller
 * directly however is rarely necessary as various higher level
 * convenience APIs exist on `GtkWidget`s that make it easier to use
 * shortcuts in GTK.
 * 
 * `GtkShortcut` does provide functionality to make it easy for users
 * to work with shortcuts, either by providing informational strings
 * for display purposes or by allowing shortcuts to be configured.
 *
 */
@interface OGTKShortcut : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithTrigger:(OGTKShortcutTrigger*)trigger action:(OGTKShortcutAction*)action;

/**
 * Methods
 */

- (GtkShortcut*)castedGObject;

/**
 * Gets the action that is activated by this shortcut.
 *
 * @return the action
 */
- (OGTKShortcutAction*)action;

/**
 * Gets the arguments that are passed when activating the shortcut.
 *
 * @return the arguments
 */
- (GVariant*)arguments;

/**
 * Gets the trigger used to trigger @self.
 *
 * @return the trigger used
 */
- (OGTKShortcutTrigger*)trigger;

/**
 * Sets the new action for @self to be @action.
 *
 * @param action The new action.
 *   If the @action is %NULL, the nothing action will be used.
 */
- (void)setAction:(OGTKShortcutAction*)action;

/**
 * Sets the arguments to pass when activating the shortcut.
 *
 * @param args arguments to pass when activating @self
 */
- (void)setArguments:(GVariant*)args;

/**
 * Sets the new trigger for @self to be @trigger.
 *
 * @param trigger The new trigger.
 *   If the @trigger is %NULL, the never trigger will be used.
 */
- (void)setTrigger:(OGTKShortcutTrigger*)trigger;

@end