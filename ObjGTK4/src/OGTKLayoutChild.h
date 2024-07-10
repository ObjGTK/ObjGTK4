/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;
@class OGTKLayoutManager;

/**
 * `GtkLayoutChild` is the base class for objects that are meant to hold
 * layout properties.
 * 
 * If a `GtkLayoutManager` has per-child properties, like their packing type,
 * or the horizontal and vertical span, or the icon name, then the layout
 * manager should use a `GtkLayoutChild` implementation to store those properties.
 * 
 * A `GtkLayoutChild` instance is only ever valid while a widget is part
 * of a layout.
 *
 */
@interface OGTKLayoutChild : OGObject
{

}


/**
 * Methods
 */

- (GtkLayoutChild*)castedGObject;

/**
 * Retrieves the `GtkWidget` associated to the given @layout_child.
 *
 * @return a `GtkWidget`
 */
- (OGTKWidget*)childWidget;

/**
 * Retrieves the `GtkLayoutManager` instance that created the
 * given @layout_child.
 *
 * @return a `GtkLayoutManager`
 */
- (OGTKLayoutManager*)layoutManager;

@end