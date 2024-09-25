/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListItem.h"

@class OGTKWidget;

/**
 * `GtkColumnViewCell` is used by [class@Gtk.ColumnViewColumn] to represent items
 * in a cell in [class@Gtk.ColumnView].
 * 
 * The `GtkColumnViewCell`s are managed by the columnview widget (with its factory)
 * and cannot be created by applications, but they need to be populated
 * by application code. This is done by calling [method@Gtk.ColumnViewCell.set_child].
 * 
 * `GtkColumnViewCell`s exist in 2 stages:
 * 
 * 1. The unbound stage where the listitem is not currently connected to
 *    an item in the list. In that case, the [property@Gtk.ColumnViewCell:item]
 *    property is set to %NULL.
 * 
 * 2. The bound stage where the listitem references an item from the list.
 *    The [property@Gtk.ColumnViewCell:item] property is not %NULL.
 *
 */
@interface OGTKColumnViewCell : OGTKListItem
{

}


/**
 * Methods
 */

- (GtkColumnViewCell*)castedGObject;

/**
 * Gets the child previously set via gtk_column_view_cell_set_child() or
 * %NULL if none was set.
 *
 * @return The child
 */
- (OGTKWidget*)child;

/**
 * Checks if a list item has been set to be focusable via
 * gtk_column_view_cell_set_focusable().
 *
 * @return %TRUE if the item is focusable
 */
- (bool)focusable;

/**
 * Gets the model item that associated with @self.
 * 
 * If @self is unbound, this function returns %NULL.
 *
 * @return The item displayed
 */
- (gpointer)item;

/**
 * Gets the position in the model that @self currently displays.
 * 
 * If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
 *
 * @return The position of this item
 */
- (guint)position;

/**
 * Checks if the item is displayed as selected.
 * 
 * The selected state is maintained by the liste widget and its model
 * and cannot be set otherwise.
 *
 * @return %TRUE if the item is selected.
 */
- (bool)selected;

/**
 * Sets the child to be used for this listitem.
 * 
 * This function is typically called by applications when
 * setting up a listitem so that the widget can be reused when
 * binding it multiple times.
 *
 * @param child The list item's child or %NULL to unset
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets @self to be focusable.
 * 
 * If an item is focusable, it can be focused using the keyboard.
 * This works similar to [method@Gtk.Widget.set_focusable].
 * 
 * Note that if items are not focusable, the keyboard cannot be used to activate
 * them and selecting only works if one of the listitem's children is focusable.
 * 
 * By default, list items are focusable.
 *
 * @param focusable if the item should be focusable
 */
- (void)setFocusable:(bool)focusable;

@end