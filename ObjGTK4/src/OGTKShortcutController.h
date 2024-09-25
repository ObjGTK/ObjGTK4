/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

@class OGTKShortcut;

/**
 * `GtkShortcutController` is an event controller that manages shortcuts.
 * 
 * Most common shortcuts are using this controller implicitly, e.g. by
 * adding a mnemonic underline to a [class@Gtk.Label], or by installing a key
 * binding using [method@Gtk.WidgetClass.add_binding], or by adding accelerators
 * to global actions using [method@Gtk.Application.set_accels_for_action].
 * 
 * But it is possible to create your own shortcut controller, and add
 * shortcuts to it.
 * 
 * `GtkShortcutController` implements [iface@Gio.ListModel] for querying the
 * shortcuts that have been added to it.
 * 
 * # GtkShortcutController as GtkBuildable
 * 
 * `GtkShortcutController`s can be created in [class@Gtk.Builder] ui files, to set up
 * shortcuts in the same place as the widgets.
 * 
 * An example of a UI definition fragment with `GtkShortcutController`:
 * ```xml
 *   <object class='GtkButton'>
 *     <child>
 *       <object class='GtkShortcutController'>
 *         <property name='scope'>managed</property>
 *         <child>
 *           <object class='GtkShortcut'>
 *             <property name='trigger'>&lt;Control&gt;k</property>
 *             <property name='action'>activate</property>
 *           </object>
 *         </child>
 *       </object>
 *     </child>
 *   </object>
 * ```
 * 
 * This example creates a [class@Gtk.ActivateAction] for triggering the
 * `activate` signal of the [class@Gtk.Button]. See [ctor@Gtk.ShortcutAction.parse_string]
 * for the syntax for other kinds of [class@Gtk.ShortcutAction]. See
 * [ctor@Gtk.ShortcutTrigger.parse_string] to learn more about the syntax
 * for triggers.
 *
 */
@interface OGTKShortcutController : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initForModel:(GListModel*)model;

/**
 * Methods
 */

- (GtkShortcutController*)castedGObject;

/**
 * Adds @shortcut to the list of shortcuts handled by @self.
 * 
 * If this controller uses an external shortcut list, this
 * function does nothing.
 *
 * @param shortcut a `GtkShortcut`
 */
- (void)addShortcut:(OGTKShortcut*)shortcut;

/**
 * Gets the mnemonics modifiers for when this controller activates its shortcuts.
 *
 * @return the controller's mnemonics modifiers
 */
- (GdkModifierType)mnemonicsModifiers;

/**
 * Gets the scope for when this controller activates its shortcuts.
 * 
 * See [method@Gtk.ShortcutController.set_scope] for details.
 *
 * @return the controller's scope
 */
- (GtkShortcutScope)scope;

/**
 * Removes @shortcut from the list of shortcuts handled by @self.
 * 
 * If @shortcut had not been added to @controller or this controller
 * uses an external shortcut list, this function does nothing.
 *
 * @param shortcut a `GtkShortcut`
 */
- (void)removeShortcut:(OGTKShortcut*)shortcut;

/**
 * Sets the controller to use the given modifier for mnemonics.
 * 
 * The mnemonics modifiers determines which modifiers need to be pressed to allow
 * activation of shortcuts with mnemonics triggers.
 * 
 * GTK normally uses the Alt modifier for mnemonics, except in `GtkPopoverMenu`s,
 * where mnemonics can be triggered without any modifiers. It should be very
 * rarely necessary to change this, and doing so is likely to interfere with
 * other shortcuts.
 * 
 * This value is only relevant for local shortcut controllers. Global and managed
 * shortcut controllers will have their shortcuts activated from other places which
 * have their own modifiers for activating mnemonics.
 *
 * @param modifiers the new mnemonics_modifiers to use
 */
- (void)setMnemonicsModifiers:(GdkModifierType)modifiers;

/**
 * Sets the controller to have the given @scope.
 * 
 * The scope allows shortcuts to be activated outside of the normal
 * event propagation. In particular, it allows installing global
 * keyboard shortcuts that can be activated even when a widget does
 * not have focus.
 * 
 * With %GTK_SHORTCUT_SCOPE_LOCAL, shortcuts will only be activated
 * when the widget has focus.
 *
 * @param scope the new scope to use
 */
- (void)setScope:(GtkShortcutScope)scope;

@end