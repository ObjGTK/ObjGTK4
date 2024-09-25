/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkSliceListModel` is a list model that presents a slice of another model.
 * 
 * This is useful when implementing paging by setting the size to the number
 * of elements per page and updating the offset whenever a different page is
 * opened.
 * 
 * `GtkSliceListModel` passes through sections from the underlying model.
 *
 */
@interface OGTKSliceListModel : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithModel:(GListModel*)model offset:(guint)offset size:(guint)size;

/**
 * Methods
 */

- (GtkSliceListModel*)castedGObject;

/**
 * Gets the model that is currently being used or %NULL if none.
 *
 * @return The model in use
 */
- (GListModel*)model;

/**
 * Gets the offset set via gtk_slice_list_model_set_offset().
 *
 * @return The offset
 */
- (guint)offset;

/**
 * Gets the size set via gtk_slice_list_model_set_size().
 *
 * @return The size
 */
- (guint)size;

/**
 * Sets the model to show a slice of.
 * 
 * The model's item type must conform to @self's item type.
 *
 * @param model The model to be sliced
 */
- (void)setModel:(GListModel*)model;

/**
 * Sets the offset into the original model for this slice.
 * 
 * If the offset is too large for the sliced model,
 * @self will end up empty.
 *
 * @param offset the new offset to use
 */
- (void)setOffset:(guint)offset;

/**
 * Sets the maximum size. @self will never have more items
 * than @size.
 * 
 * It can however have fewer items if the offset is too large
 * or the model sliced from doesn't have enough items.
 *
 * @param size the maximum size
 */
- (void)setSize:(guint)size;

@end