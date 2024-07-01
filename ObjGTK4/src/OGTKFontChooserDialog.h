/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDialog.h"

@class OGTKWindow;
@class OGTKWidget;

/**
 * The `GtkFontChooserDialog` widget is a dialog for selecting a font.
 * 
 * ![An example GtkFontChooserDialog](fontchooser.png)
 * 
 * `GtkFontChooserDialog` implements the [iface@Gtk.FontChooser] interface
 * and does not provide much API of its own.
 * 
 * To create a `GtkFontChooserDialog`, use [ctor@Gtk.FontChooserDialog.new].
 * 
 * # GtkFontChooserDialog as GtkBuildable
 * 
 * The `GtkFontChooserDialog` implementation of the `GtkBuildable`
 * interface exposes the buttons with the names “select_button”
 * and “cancel_button”.
 *
 */
@interface OGTKFontChooserDialog : OGTKDialog
{

}


/**
 * Constructors
 */
- (instancetype)initWithTitle:(OFString*)title parent:(OGTKWindow*)parent;

/**
 * Methods
 */

- (GtkFontChooserDialog*)castedGObject;

@end