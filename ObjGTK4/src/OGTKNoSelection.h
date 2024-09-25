/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkNoSelection` is a `GtkSelectionModel` that does not allow selecting
 * anything.
 * 
 * This model is meant to be used as a simple wrapper around a `GListModel`
 * when a `GtkSelectionModel` is required.
 * 
 * `GtkNoSelection` passes through sections from the underlying model.
 *
 */
@interface OGTKNoSelection : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(GListModel*)model;

/**
 * Methods
 */

- (GtkNoSelection*)castedGObject;

/**
 * Gets the model that @self is wrapping.
 *
 * @return The model being wrapped
 */
- (GListModel*)model;

/**
 * Sets the model that @self should wrap.
 * 
 * If @model is %NULL, this model will be empty.
 *
 * @param model A `GListModel` to wrap
 */
- (void)setModel:(GListModel*)model;

@end