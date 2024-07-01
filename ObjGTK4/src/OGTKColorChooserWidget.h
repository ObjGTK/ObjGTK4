/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * The `GtkColorChooserWidget` widget lets the user select a color.
 * 
 * By default, the chooser presents a predefined palette of colors,
 * plus a small number of settable custom colors. It is also possible
 * to select a different color with the single-color editor.
 * 
 * To enter the single-color editing mode, use the context menu of any
 * color of the palette, or use the '+' button to add a new custom color.
 * 
 * The chooser automatically remembers the last selection, as well
 * as custom colors.
 * 
 * To create a `GtkColorChooserWidget`, use [ctor@Gtk.ColorChooserWidget.new].
 * 
 * To change the initially selected color, use
 * [method@Gtk.ColorChooser.set_rgba]. To get the selected color use
 * [method@Gtk.ColorChooser.get_rgba].
 * 
 * The `GtkColorChooserWidget` is used in the [class@Gtk.ColorChooserDialog]
 * to provide a dialog for selecting colors.
 * 
 * # CSS names
 * 
 * `GtkColorChooserWidget` has a single CSS node with name colorchooser.
 *
 */
@interface OGTKColorChooserWidget : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkColorChooserWidget*)castedGObject;

@end