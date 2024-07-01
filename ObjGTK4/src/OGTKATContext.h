/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGGdkDisplay;

/**
 * `GtkATContext` is an abstract class provided by GTK to communicate to
 * platform-specific assistive technologies API.
 * 
 * Each platform supported by GTK implements a `GtkATContext` subclass, and
 * is responsible for updating the accessible state in response to state
 * changes in `GtkAccessible`.
 *
 */
@interface OGTKATContext : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initCreateWithAccessibleRole:(GtkAccessibleRole)accessibleRole accessible:(GtkAccessible*)accessible display:(OGGdkDisplay*)display;

/**
 * Methods
 */

- (GtkATContext*)castedGObject;

/**
 * Retrieves the `GtkAccessible` using this context.
 *
 * @return a `GtkAccessible`
 */
- (GtkAccessible*)accessible;

/**
 * Retrieves the accessible role of this context.
 *
 * @return a `GtkAccessibleRole`
 */
- (GtkAccessibleRole)accessibleRole;

@end