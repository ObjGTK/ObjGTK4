/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBox.h"

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
 */
@interface OGTKShortcutsGroup : OGTKBox
{

}


/**
 * Methods
 */

- (GtkShortcutsGroup*)castedGObject;

@end