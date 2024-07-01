/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * The `GtkFontChooserWidget` widget lets the user select a font.
 * 
 * It is used in the `GtkFontChooserDialog` widget to provide a
 * dialog for selecting fonts.
 * 
 * To set the font which is initially selected, use
 * [method@Gtk.FontChooser.set_font] or [method@Gtk.FontChooser.set_font_desc].
 * 
 * To get the selected font use [method@Gtk.FontChooser.get_font] or
 * [method@Gtk.FontChooser.get_font_desc].
 * 
 * To change the text which is shown in the preview area, use
 * [method@Gtk.FontChooser.set_preview_text].
 * 
 * # CSS nodes
 * 
 * `GtkFontChooserWidget` has a single CSS node with name fontchooser.
 *
 */
@interface OGTKFontChooserWidget : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkFontChooserWidget*)castedGObject;

@end