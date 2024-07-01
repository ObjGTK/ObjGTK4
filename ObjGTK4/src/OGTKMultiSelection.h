/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkMultiSelection` is a `GtkSelectionModel` that allows selecting multiple
 * elements.
 *
 */
@interface OGTKMultiSelection : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(GListModel*)model;

/**
 * Methods
 */

- (GtkMultiSelection*)castedGObject;

/**
 * Returns the underlying model of @self.
 *
 * @return the underlying model
 */
- (GListModel*)model;

/**
 * Sets the model that @self should wrap.
 * 
 * If @model is %NULL, @self will be empty.
 *
 * @param model A `GListModel` to wrap
 */
- (void)setModel:(GListModel*)model;

@end