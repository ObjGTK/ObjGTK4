/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBox.h"

@class OGTKShortcutsShortcut;

/**
 * A `GtkShortcutsGroup` represents a group of related keyboard shortcuts
 * or gestures.
 * 
 * The group has a title. It may optionally be associated with a view
 * of the application, which can be used to show only relevant shortcuts
 * depending on the application context.
 * 
 * This widget is only meant to be used with [class@Gtk.ShortcutsWindow].
 * 
 * The recommended way to construct a `GtkShortcutsGroup` is with
 * [class@Gtk.Builder], by using the `<child>` tag to populate a
 * `GtkShortcutsGroup` with one or more [class@Gtk.ShortcutsShortcut]
 * instances.
 * 
 * If you need to add a shortcut programmatically, use
 * [method@Gtk.ShortcutsGroup.add_shortcut].
 *
 */
@interface OGTKShortcutsGroup : OGTKBox
{

}


/**
 * Methods
 */

- (GtkShortcutsGroup*)castedGObject;

/**
 * Adds a shortcut to the shortcuts group.
 * 
 * This is the programmatic equivalent to using [class@Gtk.Builder] and a
 * `<child>` tag to add the child. Adding children with other API is not
 * appropriate as `GtkShortcutsGroup` manages its children internally.
 *
 * @param shortcut the `GtkShortcutsShortcut` to add
 */
- (void)addShortcut:(OGTKShortcutsShortcut*)shortcut;

@end