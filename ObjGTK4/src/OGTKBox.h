/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * The `GtkBox` widget arranges child widgets into a single row or column.
 * 
 * ![An example GtkBox](box.png)
 * 
 * Whether it is a row or column depends on the value of its
 * [property@Gtk.Orientable:orientation] property. Within the other
 * dimension, all children are allocated the same size. Of course, the
 * [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign] properties
 * can be used on the children to influence their allocation.
 * 
 * Use repeated calls to [method@Gtk.Box.append] to pack widgets into a
 * `GtkBox` from start to end. Use [method@Gtk.Box.remove] to remove widgets
 * from the `GtkBox`. [method@Gtk.Box.insert_child_after] can be used to add
 * a child at a particular position.
 * 
 * Use [method@Gtk.Box.set_homogeneous] to specify whether or not all children
 * of the `GtkBox` are forced to get the same amount of space.
 * 
 * Use [method@Gtk.Box.set_spacing] to determine how much space will be minimally
 * placed between all children in the `GtkBox`. Note that spacing is added
 * *between* the children.
 * 
 * Use [method@Gtk.Box.reorder_child_after] to move a child to a different
 * place in the box.
 * 
 * # CSS nodes
 * 
 * `GtkBox` uses a single CSS node with name box.
 * 
 * # Accessibility
 * 
 * Until GTK 4.10, `GtkBox` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Starting from GTK 4.12, `GtkBox` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 *
 */
@interface OGTKBox : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)initWithOrientation:(GtkOrientation)orientation spacing:(int)spacing;

/**
 * Methods
 */

- (GtkBox*)castedGObject;

/**
 * Adds @child as the last child to @box.
 *
 * @param child the `GtkWidget` to append
 */
- (void)append:(OGTKWidget*)child;

/**
 * Gets the value set by gtk_box_set_baseline_child().
 *
 * @return the baseline child
 */
- (int)baselineChild;

/**
 * Gets the value set by gtk_box_set_baseline_position().
 *
 * @return the baseline position
 */
- (GtkBaselinePosition)baselinePosition;

/**
 * Returns whether the box is homogeneous (all children are the
 * same size).
 *
 * @return %TRUE if the box is homogeneous.
 */
- (bool)homogeneous;

/**
 * Gets the value set by gtk_box_set_spacing().
 *
 * @return spacing between children
 */
- (int)spacing;

/**
 * Inserts @child in the position after @sibling in the list
 * of @box children.
 * 
 * If @sibling is %NULL, insert @child at the first position.
 *
 * @param child the `GtkWidget` to insert
 * @param sibling the sibling after which to insert @child
 */
- (void)insertChildAfterWithChild:(OGTKWidget*)child sibling:(OGTKWidget*)sibling;

/**
 * Adds @child as the first child to @box.
 *
 * @param child the `GtkWidget` to prepend
 */
- (void)prepend:(OGTKWidget*)child;

/**
 * Removes a child widget from @box.
 * 
 * The child must have been added before with
 * [method@Gtk.Box.append], [method@Gtk.Box.prepend], or
 * [method@Gtk.Box.insert_child_after].
 *
 * @param child the child to remove
 */
- (void)remove:(OGTKWidget*)child;

/**
 * Moves @child to the position after @sibling in the list
 * of @box children.
 * 
 * If @sibling is %NULL, move @child to the first position.
 *
 * @param child the `GtkWidget` to move, must be a child of @box
 * @param sibling the sibling to move @child after
 */
- (void)reorderChildAfterWithChild:(OGTKWidget*)child sibling:(OGTKWidget*)sibling;

/**
 * Sets the baseline child of a box.
 * 
 * This affects only vertical boxes.
 *
 * @param child a child, or -1
 */
- (void)setBaselineChild:(int)child;

/**
 * Sets the baseline position of a box.
 * 
 * This affects only horizontal boxes with at least one baseline
 * aligned child. If there is more vertical space available than
 * requested, and the baseline is not allocated by the parent then
 * @position is used to allocate the baseline with respect to the
 * extra space available.
 *
 * @param position a `GtkBaselinePosition`
 */
- (void)setBaselinePosition:(GtkBaselinePosition)position;

/**
 * Sets whether or not all children of @box are given equal space
 * in the box.
 *
 * @param homogeneous a boolean value, %TRUE to create equal allotments,
 *   %FALSE for variable allotments
 */
- (void)setHomogeneous:(bool)homogeneous;

/**
 * Sets the number of pixels to place between children of @box.
 *
 * @param spacing the number of pixels to put between children
 */
- (void)setSpacing:(int)spacing;

@end