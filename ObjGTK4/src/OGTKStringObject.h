/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkStringObject` is the type of items in a `GtkStringList`.
 * 
 * A `GtkStringObject` is a wrapper around a `const char*`; it has
 * a [property@Gtk.StringObject:string] property that can be used
 * for property bindings and expressions.
 *
 */
@interface OGTKStringObject : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)string;

/**
 * Methods
 */

- (GtkStringObject*)castedGObject;

/**
 * Returns the string contained in a `GtkStringObject`.
 *
 * @return the string of @self
 */
- (OFString*)string;

@end