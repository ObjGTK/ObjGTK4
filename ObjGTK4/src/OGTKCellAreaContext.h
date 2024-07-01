/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKCellArea;

/**
 * Stores geometrical information for a series of rows in a GtkCellArea
 * 
 * The `GtkCellAreaContext` object is created by a given `GtkCellArea`
 * implementation via its `GtkCellAreaClass.create_context()` virtual
 * method and is used to store cell sizes and alignments for a series of
 * `GtkTreeModel` rows that are requested and rendered in the same context.
 * 
 * `GtkCellLayout` widgets can create any number of contexts in which to
 * request and render groups of data rows. However, it’s important that the
 * same context which was used to request sizes for a given `GtkTreeModel`
 * row also be used for the same row when calling other `GtkCellArea` APIs
 * such as gtk_cell_area_render() and gtk_cell_area_event().
 *
 */
@interface OGTKCellAreaContext : OGObject
{

}


/**
 * Methods
 */

- (GtkCellAreaContext*)castedGObject;

/**
 * Allocates a width and/or a height for all rows which are to be
 * rendered with @context.
 * 
 * Usually allocation is performed only horizontally or sometimes
 * vertically since a group of rows are usually rendered side by
 * side vertically or horizontally and share either the same width
 * or the same height. Sometimes they are allocated in both horizontal
 * and vertical orientations producing a homogeneous effect of the
 * rows. This is generally the case for `GtkTreeView` when
 * `GtkTreeView:fixed-height-mode` is enabled.
 *
 * @param width the allocated width for all `GtkTreeModel` rows rendered
 *   with @context, or -1
 * @param height the allocated height for all `GtkTreeModel` rows rendered
 *   with @context, or -1
 */
- (void)allocateWithWidth:(int)width height:(int)height;

/**
 * Fetches the current allocation size for @context.
 * 
 * If the context was not allocated in width or height, or if the
 * context was recently reset with gtk_cell_area_context_reset(),
 * the returned value will be -1.
 *
 * @param width location to store the allocated width
 * @param height location to store the allocated height
 */
- (void)allocationWithWidth:(int*)width height:(int*)height;

/**
 * Fetches the `GtkCellArea` this @context was created by.
 * 
 * This is generally unneeded by layouting widgets; however,
 * it is important for the context implementation itself to
 * fetch information about the area it is being used for.
 * 
 * For instance at `GtkCellAreaContextClass.allocate()` time
 * it’s important to know details about any cell spacing
 * that the `GtkCellArea` is configured with in order to
 * compute a proper allocation.
 *
 * @return the `GtkCellArea` this context was created by.
 */
- (OGTKCellArea*)area;

/**
 * Gets the accumulative preferred height for all rows which have been
 * requested with this context.
 * 
 * After gtk_cell_area_context_reset() is called and/or before ever
 * requesting the size of a `GtkCellArea`, the returned values are 0.
 *
 * @param minimumHeight location to store the minimum height
 * @param naturalHeight location to store the natural height
 */
- (void)preferredHeightWithMinimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight;

/**
 * Gets the accumulative preferred height for @width for all rows
 * which have been requested for the same said @width with this context.
 * 
 * After gtk_cell_area_context_reset() is called and/or before ever
 * requesting the size of a `GtkCellArea`, the returned values are -1.
 *
 * @param width a proposed width for allocation
 * @param minimumHeight location to store the minimum height
 * @param naturalHeight location to store the natural height
 */
- (void)preferredHeightForWidthWithWidth:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight;

/**
 * Gets the accumulative preferred width for all rows which have been
 * requested with this context.
 * 
 * After gtk_cell_area_context_reset() is called and/or before ever
 * requesting the size of a `GtkCellArea`, the returned values are 0.
 *
 * @param minimumWidth location to store the minimum width
 * @param naturalWidth location to store the natural width
 */
- (void)preferredWidthWithMinimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth;

/**
 * Gets the accumulative preferred width for @height for all rows which
 * have been requested for the same said @height with this context.
 * 
 * After gtk_cell_area_context_reset() is called and/or before ever
 * requesting the size of a `GtkCellArea`, the returned values are -1.
 *
 * @param height a proposed height for allocation
 * @param minimumWidth location to store the minimum width
 * @param naturalWidth location to store the natural width
 */
- (void)preferredWidthForHeightWithHeight:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth;

/**
 * Causes the minimum and/or natural height to grow if the new
 * proposed sizes exceed the current minimum and natural height.
 * 
 * This is used by `GtkCellAreaContext` implementations during
 * the request process over a series of `GtkTreeModel` rows to
 * progressively push the requested height over a series of
 * gtk_cell_area_get_preferred_height() requests.
 *
 * @param minimumHeight the proposed new minimum height for @context
 * @param naturalHeight the proposed new natural height for @context
 */
- (void)pushPreferredHeightWithMinimumHeight:(int)minimumHeight naturalHeight:(int)naturalHeight;

/**
 * Causes the minimum and/or natural width to grow if the new
 * proposed sizes exceed the current minimum and natural width.
 * 
 * This is used by `GtkCellAreaContext` implementations during
 * the request process over a series of `GtkTreeModel` rows to
 * progressively push the requested width over a series of
 * gtk_cell_area_get_preferred_width() requests.
 *
 * @param minimumWidth the proposed new minimum width for @context
 * @param naturalWidth the proposed new natural width for @context
 */
- (void)pushPreferredWidthWithMinimumWidth:(int)minimumWidth naturalWidth:(int)naturalWidth;

/**
 * Resets any previously cached request and allocation
 * data.
 * 
 * When underlying `GtkTreeModel` data changes its
 * important to reset the context if the content
 * size is allowed to shrink. If the content size
 * is only allowed to grow (this is usually an option
 * for views rendering large data stores as a measure
 * of optimization), then only the row that changed
 * or was inserted needs to be (re)requested with
 * gtk_cell_area_get_preferred_width().
 * 
 * When the new overall size of the context requires
 * that the allocated size changes (or whenever this
 * allocation changes at all), the variable row
 * sizes need to be re-requested for every row.
 * 
 * For instance, if the rows are displayed all with
 * the same width from top to bottom then a change
 * in the allocated width necessitates a recalculation
 * of all the displayed row heights using
 * gtk_cell_area_get_preferred_height_for_width().
 *
 */
- (void)reset;

@end