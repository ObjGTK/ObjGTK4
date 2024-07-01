/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkSelectionFilterModel` is a list model that presents the selection from
 * a `GtkSelectionModel`.
 *
 */
@interface OGTKSelectionFilterModel : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkSelectionModel*)model;

/**
 * Methods
 */

- (GtkSelectionFilterModel*)castedGObject;

/**
 * Gets the model currently filtered or %NULL if none.
 *
 * @return The model that gets filtered
 */
- (GtkSelectionModel*)model;

/**
 * Sets the model to be filtered.
 * 
 * Note that GTK makes no effort to ensure that @model conforms to
 * the item type of @self. It assumes that the caller knows what they
 * are doing and have set up an appropriate filter to ensure that item
 * types match.
 *
 * @param model The model to be filtered
 */
- (void)setModel:(GtkSelectionModel*)model;

@end