/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBox.h"

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
 */
@interface OGTKShortcutsSection : OGTKBox
{

}


/**
 * Methods
 */

- (GtkShortcutsSection*)castedGObject;

@end