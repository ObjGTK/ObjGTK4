/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindow.h"

@class OGTKShortcutsSection;

/**
 * A `GtkShortcutsWindow` shows information about the keyboard shortcuts
 * and gestures of an application.
 * 
 * The shortcuts can be grouped, and you can have multiple sections in this
 * window, corresponding to the major modes of your application.
 * 
 * Additionally, the shortcuts can be filtered by the current view, to avoid
 * showing information that is not relevant in the current application context.
 * 
 * The recommended way to construct a `GtkShortcutsWindow` is with
 * [class@Gtk.Builder], by using the `<child>` tag to populate a
 * `GtkShortcutsWindow` with one or more [class@Gtk.ShortcutsSection] objects,
 * which contain one or more [class@Gtk.ShortcutsGroup] instances, which, in turn,
 * contain [class@Gtk.ShortcutsShortcut] instances.
 * 
 * If you need to add a section programmatically, use [method@Gtk.ShortcutsWindow.add_section]
 * instead of [method@Gtk.Window.set_child], as the shortcuts window manages
 * its children directly.
 * 
 * # A simple example:
 * 
 * ![](gedit-shortcuts.png)
 * 
 * This example has as single section. As you can see, the shortcut groups
 * are arranged in columns, and spread across several pages if there are too
 * many to find on a single page.
 * 
 * The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-gedit.ui).
 * 
 * # An example with multiple views:
 * 
 * ![](clocks-shortcuts.png)
 * 
 * This example shows a `GtkShortcutsWindow` that has been configured to show only
 * the shortcuts relevant to the "stopwatch" view.
 * 
 * The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-clocks.ui).
 * 
 * # An example with multiple sections:
 * 
 * ![](builder-shortcuts.png)
 * 
 * This example shows a `GtkShortcutsWindow` with two sections, "Editor Shortcuts"
 * and "Terminal Shortcuts".
 * 
 * The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-builder.ui).
 * 
 * ## CSS nodes
 * 
 * `GtkShortcutsWindow` has a single CSS node with the name `window` and style
 * class `.shortcuts`.
 *
 */
@interface OGTKShortcutsWindow : OGTKWindow
{

}


/**
 * Methods
 */

- (GtkShortcutsWindow*)castedGObject;

/**
 * Adds a section to the shortcuts window.
 * 
 * This is the programmatic equivalent to using [class@Gtk.Builder] and a
 * `<child>` tag to add the child.
 * 
 * Using [method@Gtk.Window.set_child] is not appropriate as the shortcuts
 * window manages its children internally.
 *
 * @param section the `GtkShortcutsSection` to add
 */
- (void)addSection:(OGTKShortcutsSection*)section;

@end