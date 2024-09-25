/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKFilter;

/**
 * `GtkFilterListModel` is a list model that filters the elements of
 * the underlying model according to a `GtkFilter`.
 * 
 * It hides some elements from the other model according to
 * criteria given by a `GtkFilter`.
 * 
 * The model can be set up to do incremental filtering, so that
 * filtering long lists doesn't block the UI. See
 * [method@Gtk.FilterListModel.set_incremental] for details.
 * 
 * `GtkFilterListModel` passes through sections from the underlying model.
 *
 */
@interface OGTKFilterListModel : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithModel:(GListModel*)model filter:(OGTKFilter*)filter;

/**
 * Methods
 */

- (GtkFilterListModel*)castedGObject;

/**
 * Gets the `GtkFilter` currently set on @self.
 *
 * @return The filter currently in use
 */
- (OGTKFilter*)filter;

/**
 * Returns whether incremental filtering is enabled.
 * 
 * See [method@Gtk.FilterListModel.set_incremental].
 *
 * @return %TRUE if incremental filtering is enabled
 */
- (bool)incremental;

/**
 * Gets the model currently filtered or %NULL if none.
 *
 * @return The model that gets filtered
 */
- (GListModel*)model;

/**
 * Returns the number of items that have not been filtered yet.
 * 
 * You can use this value to check if @self is busy filtering by
 * comparing the return value to 0 or you can compute the percentage
 * of the filter remaining by dividing the return value by the total
 * number of items in the underlying model:
 * 
 * ```c
 * pending = gtk_filter_list_model_get_pending (self);
 * model = gtk_filter_list_model_get_model (self);
 * percentage = pending / (double) g_list_model_get_n_items (model);
 * ```
 * 
 * If no filter operation is ongoing - in particular when
 * [property@Gtk.FilterListModel:incremental] is %FALSE - this
 * function returns 0.
 *
 * @return The number of items not yet filtered
 */
- (guint)pending;

/**
 * Sets the filter used to filter items.
 *
 * @param filter filter to use
 */
- (void)setFilter:(OGTKFilter*)filter;

/**
 * Sets the filter model to do an incremental sort.
 * 
 * When incremental filtering is enabled, the `GtkFilterListModel` will not
 * run filters immediately, but will instead queue an idle handler that
 * incrementally filters the items and adds them to the list. This of course
 * means that items are not instantly added to the list, but only appear
 * incrementally.
 * 
 * When your filter blocks the UI while filtering, you might consider
 * turning this on. Depending on your model and filters, this may become
 * interesting around 10,000 to 100,000 items.
 * 
 * By default, incremental filtering is disabled.
 * 
 * See [method@Gtk.FilterListModel.get_pending] for progress information
 * about an ongoing incremental filtering operation.
 *
 * @param incremental %TRUE to enable incremental filtering
 */
- (void)setIncremental:(bool)incremental;

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
- (void)setModel:(GListModel*)model;

@end