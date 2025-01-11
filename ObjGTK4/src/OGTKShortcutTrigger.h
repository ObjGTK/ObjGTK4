/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGdkDisplay;

/**
 * `GtkShortcutTrigger` tracks how a `GtkShortcut` should be activated.
 * 
 * To find out if a `GtkShortcutTrigger` triggers, you can call
 * [method@Gtk.ShortcutTrigger.trigger] on a `GdkEvent`.
 * 
 * `GtkShortcutTriggers` contain functions that allow easy presentation
 * to end users as well as being printed for debugging.
 * 
 * All `GtkShortcutTriggers` are immutable, you can only specify their
 * properties during construction. If you want to change a trigger, you
 * have to replace it with a new one.
 *
 */
@interface OGTKShortcutTrigger : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)shortcutTriggerParseString:(OFString*)string;

/**
 * Methods
 */

- (GtkShortcutTrigger*)castedGObject;

/**
 * The types of @trigger1 and @trigger2 are `gconstpointer` only to allow
 * use of this function as a `GCompareFunc`.
 * 
 * They must each be a `GtkShortcutTrigger`.
 *
 * @param trigger2 a `GtkShortcutTrigger`
 * @return An integer less than, equal to, or greater than zero if
 *   @trigger1 is found, respectively, to be less than, to match,
 *   or be greater than @trigger2.
 */
- (int)compare:(gconstpointer)trigger2;

/**
 * Checks if @trigger1 and @trigger2 trigger under the same conditions.
 * 
 * The types of @one and @two are `gconstpointer` only to allow use of this
 * function with `GHashTable`. They must each be a `GtkShortcutTrigger`.
 *
 * @param trigger2 a `GtkShortcutTrigger`
 * @return %TRUE if @trigger1 and @trigger2 are equal
 */
- (bool)equal:(gconstpointer)trigger2;

/**
 * Generates a hash value for a `GtkShortcutTrigger`.
 * 
 * The output of this function is guaranteed to be the same for a given
 * value only per-process. It may change between different processor
 * architectures or even different versions of GTK. Do not use this
 * function as a basis for building protocols or file formats.
 * 
 * The types of @trigger is `gconstpointer` only to allow use of this
 * function with `GHashTable`. They must each be a `GtkShortcutTrigger`.
 *
 * @return a hash value corresponding to @trigger
 */
- (guint)hash;

/**
 * Prints the given trigger into a string for the developer.
 * This is meant for debugging and logging.
 * 
 * The form of the representation may change at any time
 * and is not guaranteed to stay identical.
 *
 * @param string a `GString` to print into
 */
- (void)print:(GString*)string;

/**
 * Prints the given trigger into a string.
 * 
 * This function is returning a translated string for presentation
 * to end users for example in menu items or in help texts.
 * 
 * The @display in use may influence the resulting string in
 * various forms, such as resolving hardware keycodes or by
 * causing display-specific modifier names.
 * 
 * The form of the representation may change at any time and is
 * not guaranteed to stay identical.
 *
 * @param display `GdkDisplay` to print for
 * @param string a `GString` to print into
 * @return %TRUE if something was printed or %FALSE if the
 *   trigger did not have a textual representation suitable
 *   for end users.
 */
- (bool)printLabelWithDisplay:(OGdkDisplay*)display string:(GString*)string;

/**
 * Gets textual representation for the given trigger.
 * 
 * This function is returning a translated string for
 * presentation to end users for example in menu items
 * or in help texts.
 * 
 * The @display in use may influence the resulting string in
 * various forms, such as resolving hardware keycodes or by
 * causing display-specific modifier names.
 * 
 * The form of the representation may change at any time and is
 * not guaranteed to stay identical.
 *
 * @param display `GdkDisplay` to print for
 * @return a new string
 */
- (char*)toLabel:(OGdkDisplay*)display;

/**
 * Prints the given trigger into a human-readable string.
 * 
 * This is a small wrapper around [method@Gtk.ShortcutTrigger.print]
 * to help when debugging.
 *
 * @return a new string
 */
- (char*)toString;

/**
 * Checks if the given @event triggers @self.
 *
 * @param event the event to check
 * @param enableMnemonics %TRUE if mnemonics should trigger. Usually the
 *   value of this property is determined by checking that the passed
 *   in @event is a Key event and has the right modifiers set.
 * @return Whether the event triggered the shortcut
 */
- (GdkKeyMatch)triggerWithEvent:(GdkEvent*)event enableMnemonics:(bool)enableMnemonics;

@end