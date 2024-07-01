/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDialog.h"

@class OGTKWindow;
@class OGTKWidget;

/**
 * A dialog for choosing a color.
 * 
 * ![An example GtkColorChooserDialog](colorchooser.png)
 * 
 * `GtkColorChooserDialog` implements the [iface@Gtk.ColorChooser] interface
 * and does not provide much API of its own.
 * 
 * To create a `GtkColorChooserDialog`, use [ctor@Gtk.ColorChooserDialog.new].
 * 
 * To change the initially selected color, use
 * [method@Gtk.ColorChooser.set_rgba]. To get the selected color use
 * [method@Gtk.ColorChooser.get_rgba].
 *
 */
@interface OGTKColorChooserDialog : OGTKDialog
{

}


/**
 * Constructors
 */
- (instancetype)initWithTitle:(OFString*)title parent:(OGTKWindow*)parent;

/**
 * Methods
 */

- (GtkColorChooserDialog*)castedGObject;

@end