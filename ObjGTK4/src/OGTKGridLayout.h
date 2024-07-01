/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutManager.h"

/**
 * `GtkGridLayout` is a layout manager which arranges child widgets in
 * rows and columns.
 * 
 * Children have an "attach point" defined by the horizontal and vertical
 * index of the cell they occupy; children can span multiple rows or columns.
 * The layout properties for setting the attach points and spans are set
 * using the [class@Gtk.GridLayoutChild] associated to each child widget.
 * 
 * The behaviour of `GtkGridLayout` when several children occupy the same
 * grid cell is undefined.
 * 
 * `GtkGridLayout` can be used like a `GtkBoxLayout` if all children are
 * attached to the same row or column; however, if you only ever need a
 * single row or column, you should consider using `GtkBoxLayout`.
 *
 */
@interface OGTKGridLayout : OGTKLayoutManager
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkGridLayout*)castedGObject;

/**
 * Retrieves the row set with gtk_grid_layout_set_baseline_row().
 *
 * @return the global baseline row
 */
- (int)baselineRow;

/**
 * Checks whether all columns of @grid should have the same width.
 *
 * @return %TRUE if the columns are homogeneous, and %FALSE otherwise
 */
- (bool)columnHomogeneous;

/**
 * Retrieves the spacing set with gtk_grid_layout_set_column_spacing().
 *
 * @return the spacing between consecutive columns
 */
- (guint)columnSpacing;

/**
 * Returns the baseline position of @row.
 * 
 * If no value has been set with
 * [method@Gtk.GridLayout.set_row_baseline_position],
 * the default value of %GTK_BASELINE_POSITION_CENTER
 * is returned.
 *
 * @param row a row index
 * @return the baseline position of @row
 */
- (GtkBaselinePosition)rowBaselinePosition:(int)row;

/**
 * Checks whether all rows of @grid should have the same height.
 *
 * @return %TRUE if the rows are homogeneous, and %FALSE otherwise
 */
- (bool)rowHomogeneous;

/**
 * Retrieves the spacing set with gtk_grid_layout_set_row_spacing().
 *
 * @return the spacing between consecutive rows
 */
- (guint)rowSpacing;

/**
 * Sets which row defines the global baseline for the entire grid.
 * 
 * Each row in the grid can have its own local baseline, but only
 * one of those is global, meaning it will be the baseline in the
 * parent of the @grid.
 *
 * @param row the row index
 */
- (void)setBaselineRow:(int)row;

/**
 * Sets whether all columns of @grid should have the same width.
 *
 * @param homogeneous %TRUE to make columns homogeneous
 */
- (void)setColumnHomogeneous:(bool)homogeneous;

/**
 * Sets the amount of space to insert between consecutive columns.
 *
 * @param spacing the amount of space between columns, in pixels
 */
- (void)setColumnSpacing:(guint)spacing;

/**
 * Sets how the baseline should be positioned on @row of the
 * grid, in case that row is assigned more space than is requested.
 *
 * @param row a row index
 * @param pos a `GtkBaselinePosition`
 */
- (void)setRowBaselinePositionWithRow:(int)row pos:(GtkBaselinePosition)pos;

/**
 * Sets whether all rows of @grid should have the same height.
 *
 * @param homogeneous %TRUE to make rows homogeneous
 */
- (void)setRowHomogeneous:(bool)homogeneous;

/**
 * Sets the amount of space to insert between consecutive rows.
 *
 * @param spacing the amount of space between rows, in pixels
 */
- (void)setRowSpacing:(guint)spacing;

@end