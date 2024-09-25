/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkWindowHandle` is a titlebar area widget.
 * 
 * When added into a window, it can be dragged to move the window, and handles
 * right click, double click and middle click as expected of a titlebar.
 * 
 * # CSS nodes
 * 
 * `GtkWindowHandle` has a single CSS node with the name `windowhandle`.
 * 
 * # Accessibility
 * 
 * Until GTK 4.10, `GtkWindowHandle` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Starting from GTK 4.12, `GtkWindowHandle` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 *
 */
@interface OGTKWindowHandle : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkWindowHandle*)castedGObject;

/**
 * Gets the child widget of @self.
 *
 * @return the child widget of @self
 */
- (OGTKWidget*)child;

/**
 * Sets the child widget of @self.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

@end