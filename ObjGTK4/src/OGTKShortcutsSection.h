/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBox.h"

@class OGTKShortcutsGroup;

/**
 * A `GtkShortcutsSection` collects all the keyboard shortcuts and gestures
 * for a major application mode.
 * 
 * If your application needs multiple sections, you should give each
 * section a unique [property@Gtk.ShortcutsSection:section-name] and
 * a [property@Gtk.ShortcutsSection:title] that can be shown in the
 * section selector of the [class@Gtk.ShortcutsWindow].
 * 
 * The [property@Gtk.ShortcutsSection:max-height] property can be used
 * to influence how the groups in the section are distributed over pages
 * and columns.
 * 
 * This widget is only meant to be used with [class@Gtk.ShortcutsWindow].
 * 
 * The recommended way to construct a `GtkShortcutsSection` is with
 * [class@Gtk.Builder], by using the `<child>` tag to populate a
 * `GtkShortcutsSection` with one or more [class@Gtk.ShortcutsGroup]
 * instances, which in turn contain one or more [class@Gtk.ShortcutsShortcut]
 * objects.
 * 
 * If you need to add a group programmatically, use
 * [method@Gtk.ShortcutsSection.add_group].
 *
 */
@interface OGTKShortcutsSection : OGTKBox
{

}


/**
 * Methods
 */

- (GtkShortcutsSection*)castedGObject;

/**
 * Adds a group to the shortcuts section.
 * 
 * This is the programmatic equivalent to using [class@Gtk.Builder] and a
 * `<child>` tag to add the child.
 * 
 * Adding children with the `GtkBox` API is not appropriate, as
 * `GtkShortcutsSection` manages its children internally.
 *
 * @param group the `GtkShortcutsGroup` to add
 */
- (void)addGroup:(OGTKShortcutsGroup*)group;

@end