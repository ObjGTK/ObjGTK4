/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkFileChooserWidget` is a widget for choosing files.
 * 
 * It exposes the [iface@Gtk.FileChooser] interface, and you should
 * use the methods of this interface to interact with the
 * widget.
 * 
 * # CSS nodes
 * 
 * `GtkFileChooserWidget` has a single CSS node with name filechooser.
 *
 */
@interface OGTKFileChooserWidget : OGTKWidget
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)fileChooserWidgetWithAction:(GtkFileChooserAction)action;

/**
 * Methods
 */

- (GtkFileChooserWidget*)castedGObject;

@end