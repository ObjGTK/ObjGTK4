/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkFlattenListModel` is a list model that concatenates other list models.
 * 
 * `GtkFlattenListModel` takes a list model containing list models, and flattens
 * it into a single model. Each list model becomes a section in the single model.
 *
 */
@interface OGTKFlattenListModel : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(GListModel*)model;

/**
 * Methods
 */

- (GtkFlattenListModel*)castedGObject;

/**
 * Gets the model set via gtk_flatten_list_model_set_model().
 *
 * @return The model flattened by @self
 */
- (GListModel*)model;

/**
 * Returns the model containing the item at the given position.
 *
 * @param position a position
 * @return the model containing the item at @position
 */
- (GListModel*)modelForItem:(guint)position;

/**
 * Sets a new model to be flattened.
 *
 * @param model the new model
 */
- (void)setModel:(GListModel*)model;

@end