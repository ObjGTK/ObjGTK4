/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkFlowBoxChild` is the kind of widget that can be added to a `GtkFlowBox`.
 *
 */
@interface OGTKFlowBoxChild : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkFlowBoxChild*)castedGObject;

/**
 * Marks @child as changed, causing any state that depends on this
 * to be updated.
 * 
 * This affects sorting and filtering.
 * 
 * Note that calls to this method must be in sync with the data
 * used for the sorting and filtering functions. For instance, if
 * the list is mirroring some external data set, and *two* children
 * changed in the external data set when you call
 * gtk_flow_box_child_changed() on the first child, the sort function
 * must only read the new data for the first of the two changed
 * children, otherwise the resorting of the children will be wrong.
 * 
 * This generally means that if you don’t fully control the data
 * model, you have to duplicate the data that affects the sorting
 * and filtering functions into the widgets themselves.
 * 
 * Another alternative is to call [method@Gtk.FlowBox.invalidate_sort]
 * on any model change, but that is more expensive.
 *
 */
- (void)changed;

/**
 * Gets the child widget of @self.
 *
 * @return the child widget of @self
 */
- (OGTKWidget*)child;

/**
 * Gets the current index of the @child in its `GtkFlowBox` container.
 *
 * @return the index of the @child, or -1 if the @child is not
 *   in a flow box
 */
- (int)index;

/**
 * Returns whether the @child is currently selected in its
 * `GtkFlowBox` container.
 *
 * @return %TRUE if @child is selected
 */
- (bool)isSelected;

/**
 * Sets the child widget of @self.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

@end