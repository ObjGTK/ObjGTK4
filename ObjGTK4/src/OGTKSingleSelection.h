/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkSingleSelection` is a `GtkSelectionModel` that allows selecting a single
 * item.
 * 
 * Note that the selection is *persistent* -- if the selected item is removed
 * and re-added in the same [signal@Gio.ListModel::items-changed] emission, it
 * stays selected. In particular, this means that changing the sort order of an
 * underlying sort model will preserve the selection.
 *
 */
@interface OGTKSingleSelection : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(GListModel*)model;

/**
 * Methods
 */

- (GtkSingleSelection*)castedGObject;

/**
 * Checks if autoselect has been enabled or disabled via
 * gtk_single_selection_set_autoselect().
 *
 * @return %TRUE if autoselect is enabled
 */
- (bool)autoselect;

/**
 * If %TRUE, gtk_selection_model_unselect_item() is supported and allows
 * unselecting the selected item.
 *
 * @return %TRUE to support unselecting
 */
- (bool)canUnselect;

/**
 * Gets the model that @self is wrapping.
 *
 * @return The model being wrapped
 */
- (GListModel*)model;

/**
 * Gets the position of the selected item.
 * 
 * If no item is selected, %GTK_INVALID_LIST_POSITION is returned.
 *
 * @return The position of the selected item
 */
- (guint)selected;

/**
 * Gets the selected item.
 * 
 * If no item is selected, %NULL is returned.
 *
 * @return The selected item
 */
- (gpointer)selectedItem;

/**
 * Enables or disables autoselect.
 * 
 * If @autoselect is %TRUE, @self will enforce that an item is always
 * selected. It will select a new item when the currently selected
 * item is deleted and it will disallow unselecting the current item.
 *
 * @param autoselect %TRUE to always select an item
 */
- (void)setAutoselect:(bool)autoselect;

/**
 * If %TRUE, unselecting the current item via
 * gtk_selection_model_unselect_item() is supported.
 * 
 * Note that setting [property@Gtk.SingleSelection:autoselect] will
 * cause unselecting to not work, so it practically makes no sense
 * to set both at the same time the same time.
 *
 * @param canUnselect %TRUE to allow unselecting
 */
- (void)setCanUnselect:(bool)canUnselect;

/**
 * Sets the model that @self should wrap.
 * 
 * If @model is %NULL, @self will be empty.
 *
 * @param model A `GListModel` to wrap
 */
- (void)setModel:(GListModel*)model;

/**
 * Selects the item at the given position.
 * 
 * If the list does not have an item at @position or
 * %GTK_INVALID_LIST_POSITION is given, the behavior depends on the
 * value of the [property@Gtk.SingleSelection:autoselect] property:
 * If it is set, no change will occur and the old item will stay
 * selected. If it is unset, the selection will be unset and no item
 * will be selected.
 *
 * @param position the item to select or %GTK_INVALID_LIST_POSITION
 */
- (void)setSelected:(guint)position;

@end