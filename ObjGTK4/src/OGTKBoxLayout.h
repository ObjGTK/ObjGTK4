/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutManager.h"

/**
 * `GtkBoxLayout` is a layout manager that arranges children in a single
 * row or column.
 * 
 * Whether it is a row or column depends on the value of its
 * [property@Gtk.Orientable:orientation] property. Within the other dimension
 * all children all allocated the same size. The `GtkBoxLayout` will respect
 * the [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign]
 * properties of each child widget.
 * 
 * If you want all children to be assigned the same size, you can use
 * the [property@Gtk.BoxLayout:homogeneous] property.
 * 
 * If you want to specify the amount of space placed between each child,
 * you can use the [property@Gtk.BoxLayout:spacing] property.
 *
 */
@interface OGTKBoxLayout : OGTKLayoutManager
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkOrientation)orientation;

/**
 * Methods
 */

- (GtkBoxLayout*)castedGObject;

/**
 * Gets the value set by gtk_box_layout_set_baseline_child().
 *
 * @return the index of the child that determines the baseline
 *     in vertical layout, or -1
 */
- (int)baselineChild;

/**
 * Gets the value set by gtk_box_layout_set_baseline_position().
 *
 * @return the baseline position
 */
- (GtkBaselinePosition)baselinePosition;

/**
 * Returns whether the layout is set to be homogeneous.
 *
 * @return %TRUE if the layout is homogeneous
 */
- (bool)homogeneous;

/**
 * Returns the space that @box_layout puts between children.
 *
 * @return the spacing of the layout
 */
- (guint)spacing;

/**
 * Sets the index of the child that determines the baseline
 * in vertical layout.
 *
 * @param child the child position, or -1
 */
- (void)setBaselineChild:(int)child;

/**
 * Sets the baseline position of a box layout.
 * 
 * The baseline position affects only horizontal boxes with at least one
 * baseline aligned child. If there is more vertical space available than
 * requested, and the baseline is not allocated by the parent then the
 * given @position is used to allocate the baseline within the extra
 * space available.
 *
 * @param position a `GtkBaselinePosition`
 */
- (void)setBaselinePosition:(GtkBaselinePosition)position;

/**
 * Sets whether the box layout will allocate the same
 * size to all children.
 *
 * @param homogeneous %TRUE to set the box layout as homogeneous
 */
- (void)setHomogeneous:(bool)homogeneous;

/**
 * Sets how much spacing to put between children.
 *
 * @param spacing the spacing to apply between children
 */
- (void)setSpacing:(guint)spacing;

@end