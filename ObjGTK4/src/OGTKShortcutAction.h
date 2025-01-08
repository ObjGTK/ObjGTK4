/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * `GtkShortcutAction` encodes an action that can be triggered by a
 * keyboard shortcut.
 * 
 * `GtkShortcutActions` contain functions that allow easy presentation
 * to end users as well as being printed for debugging.
 * 
 * All `GtkShortcutActions` are immutable, you can only specify their
 * properties during construction. If you want to change a action, you
 * have to replace it with a new one. If you need to pass arguments to
 * an action, these are specified by the higher-level `GtkShortcut` object.
 * 
 * To activate a `GtkShortcutAction` manually, [method@Gtk.ShortcutAction.activate]
 * can be called.
 * 
 * GTK provides various actions:
 * 
 *  - [class@Gtk.MnemonicAction]: a shortcut action that calls
 *    gtk_widget_mnemonic_activate()
 *  - [class@Gtk.CallbackAction]: a shortcut action that invokes
 *    a given callback
 *  - [class@Gtk.SignalAction]: a shortcut action that emits a
 *    given signal
 *  - [class@Gtk.ActivateAction]: a shortcut action that calls
 *    gtk_widget_activate()
 *  - [class@Gtk.NamedAction]: a shortcut action that calls
 *    gtk_widget_activate_action()
 *  - [class@Gtk.NothingAction]: a shortcut action that does nothing
 *
 */
@interface OGTKShortcutAction : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithStringParseString:(OFString*)string;

/**
 * Methods
 */

- (GtkShortcutAction*)castedGObject;

/**
 * Activates the action on the @widget with the given @args.
 * 
 * Note that some actions ignore the passed in @flags, @widget or @args.
 * 
 * Activation of an action can fail for various reasons. If the action
 * is not supported by the @widget, if the @args don't match the action
 * or if the activation otherwise had no effect, %FALSE will be returned.
 *
 * @param flags flags to activate with
 * @param widget Target of the activation
 * @param args arguments to pass
 * @return %TRUE if this action was activated successfully
 */
- (bool)activateWithFlags:(GtkShortcutActionFlags)flags widget:(OGTKWidget*)widget args:(GVariant*)args;

/**
 * Prints the given action into a string for the developer.
 * 
 * This is meant for debugging and logging.
 * 
 * The form of the representation may change at any time and is
 * not guaranteed to stay identical.
 *
 * @param string a `GString` to print into
 */
- (void)print:(GString*)string;

/**
 * Prints the given action into a human-readable string.
 * 
 * This is a small wrapper around [method@Gtk.ShortcutAction.print]
 * to help when debugging.
 *
 * @return a new string
 */
- (char*)toString;

@end