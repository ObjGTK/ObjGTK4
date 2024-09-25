/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKSorter;

/**
 * A `GListModel` that sorts the elements of an underlying model
 * according to a `GtkSorter`.
 * 
 * The model is a stable sort. If two items compare equal according
 * to the sorter, the one that appears first in the original model will
 * also appear first after sorting.
 * Note that if you change the sorter, the previous order will have no
 * influence on the new order. If you want that, consider using a
 * `GtkMultiSorter` and appending the previous sorter to it.
 * 
 * The model can be set up to do incremental sorting, so that
 * sorting long lists doesn't block the UI. See
 * [method@Gtk.SortListModel.set_incremental] for details.
 * 
 * `GtkSortListModel` is a generic model and because of that it
 * cannot take advantage of any external knowledge when sorting.
 * If you run into performance issues with `GtkSortListModel`,
 * it is strongly recommended that you write your own sorting list
 * model.
 * 
 * `GtkSortListModel` allows sorting the items into sections. It
 * implements `GtkSectionModel` and when [property@Gtk.SortListModel:section-sorter]
 * is set, it will sort all items with that sorter and items comparing
 * equal with it will be put into the same section.
 * The [property@Gtk.SortListModel:sorter] will then be used to sort items
 * inside their sections.
 *
 */
@interface OGTKSortListModel : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithModel:(GListModel*)model sorter:(OGTKSorter*)sorter;

/**
 * Methods
 */

- (GtkSortListModel*)castedGObject;

/**
 * Returns whether incremental sorting is enabled.
 * 
 * See [method@Gtk.SortListModel.set_incremental].
 *
 * @return %TRUE if incremental sorting is enabled
 */
- (bool)incremental;

/**
 * Gets the model currently sorted or %NULL if none.
 *
 * @return The model that gets sorted
 */
- (GListModel*)model;

/**
 * Estimates progress of an ongoing sorting operation.
 * 
 * The estimate is the number of items that would still need to be
 * sorted to finish the sorting operation if this was a linear
 * algorithm. So this number is not related to how many items are
 * already correctly sorted.
 * 
 * If you want to estimate the progress, you can use code like this:
 * ```c
 * pending = gtk_sort_list_model_get_pending (self);
 * model = gtk_sort_list_model_get_model (self);
 * progress = 1.0 - pending / (double) MAX (1, g_list_model_get_n_items (model));
 * ```
 * 
 * If no sort operation is ongoing - in particular when
 * [property@Gtk.SortListModel:incremental] is %FALSE - this
 * function returns 0.
 *
 * @return a progress estimate of remaining items to sort
 */
- (guint)pending;

/**
 * Gets the section sorter that is used to sort items of @self into
 * sections.
 *
 * @return the sorter of #self
 */
- (OGTKSorter*)sectionSorter;

/**
 * Gets the sorter that is used to sort @self.
 *
 * @return the sorter of #self
 */
- (OGTKSorter*)sorter;

/**
 * Sets the sort model to do an incremental sort.
 * 
 * When incremental sorting is enabled, the `GtkSortListModel` will not do
 * a complete sort immediately, but will instead queue an idle handler that
 * incrementally sorts the items towards their correct position. This of
 * course means that items do not instantly appear in the right place. It
 * also means that the total sorting time is a lot slower.
 * 
 * When your filter blocks the UI while sorting, you might consider
 * turning this on. Depending on your model and sorters, this may become
 * interesting around 10,000 to 100,000 items.
 * 
 * By default, incremental sorting is disabled.
 * 
 * See [method@Gtk.SortListModel.get_pending] for progress information
 * about an ongoing incremental sorting operation.
 *
 * @param incremental %TRUE to sort incrementally
 */
- (void)setIncremental:(bool)incremental;

/**
 * Sets the model to be sorted.
 * 
 * The @model's item type must conform to the item type of @self.
 *
 * @param model The model to be sorted
 */
- (void)setModel:(GListModel*)model;

/**
 * Sets a new section sorter on @self.
 *
 * @param sorter the `GtkSorter` to sort @model with
 */
- (void)setSectionSorter:(OGTKSorter*)sorter;

/**
 * Sets a new sorter on @self.
 *
 * @param sorter the `GtkSorter` to sort @model with
 */
- (void)setSorter:(OGTKSorter*)sorter;

@end