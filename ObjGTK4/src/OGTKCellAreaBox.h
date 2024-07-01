/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellArea.h"

@class OGTKCellRenderer;

/**
 * A cell area that renders GtkCellRenderers into a row or a column
 * 
 * The `GtkCellAreaBox` renders cell renderers into a row or a column
 * depending on its `GtkOrientation`.
 * 
 * GtkCellAreaBox uses a notion of packing. Packing
 * refers to adding cell renderers with reference to a particular position
 * in a `GtkCellAreaBox`. There are two reference positions: the
 * start and the end of the box.
 * When the `GtkCellAreaBox` is oriented in the %GTK_ORIENTATION_VERTICAL
 * orientation, the start is defined as the top of the box and the end is
 * defined as the bottom. In the %GTK_ORIENTATION_HORIZONTAL orientation
 * start is defined as the left side and the end is defined as the right
 * side.
 * 
 * Alignments of `GtkCellRenderer`s rendered in adjacent rows can be
 * configured by configuring the `GtkCellAreaBox` align child cell property
 * with gtk_cell_area_cell_set_property() or by specifying the "align"
 * argument to gtk_cell_area_box_pack_start() and gtk_cell_area_box_pack_end().
 *
 */
@interface OGTKCellAreaBox : OGTKCellArea
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCellAreaBox*)castedGObject;

/**
 * Gets the spacing added between cell renderers.
 *
 * @return the space added between cell renderers in @box.
 */
- (int)spacing;

/**
 * Adds @renderer to @box, packed with reference to the end of @box.
 * 
 * The @renderer is packed after (away from end of) any other
 * `GtkCellRenderer` packed with reference to the end of @box.
 *
 * @param renderer the `GtkCellRenderer` to add
 * @param expand whether @renderer should receive extra space when the area receives
 * more than its natural size
 * @param align whether @renderer should be aligned in adjacent rows
 * @param fixed whether @renderer should have the same size in all rows
 */
- (void)packEndWithRenderer:(OGTKCellRenderer*)renderer expand:(bool)expand align:(bool)align fixed:(bool)fixed;

/**
 * Adds @renderer to @box, packed with reference to the start of @box.
 * 
 * The @renderer is packed after any other `GtkCellRenderer` packed
 * with reference to the start of @box.
 *
 * @param renderer the `GtkCellRenderer` to add
 * @param expand whether @renderer should receive extra space when the area receives
 * more than its natural size
 * @param align whether @renderer should be aligned in adjacent rows
 * @param fixed whether @renderer should have the same size in all rows
 */
- (void)packStartWithRenderer:(OGTKCellRenderer*)renderer expand:(bool)expand align:(bool)align fixed:(bool)fixed;

/**
 * Sets the spacing to add between cell renderers in @box.
 *
 * @param spacing the space to add between `GtkCellRenderer`s
 */
- (void)setSpacing:(int)spacing;

@end