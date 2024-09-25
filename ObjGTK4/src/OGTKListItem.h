/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * `GtkListItem` is used by list widgets to represent items in a
 * [iface@Gio.ListModel].
 * 
 * `GtkListItem` objects are managed by the list widget (with its factory)
 * and cannot be created by applications, but they need to be populated
 * by application code. This is done by calling [method@Gtk.ListItem.set_child].
 * 
 * `GtkListItem` objects exist in 2 stages:
 * 
 * 1. The unbound stage where the listitem is not currently connected to
 *    an item in the list. In that case, the [property@Gtk.ListItem:item]
 *    property is set to %NULL.
 * 
 * 2. The bound stage where the listitem references an item from the list.
 *    The [property@Gtk.ListItem:item] property is not %NULL.
 *
 */
@interface OGTKListItem : OGObject
{

}


/**
 * Methods
 */

- (GtkListItem*)castedGObject;

/**
 * Gets the accessible description of @self.
 *
 * @return the accessible description
 */
- (OFString*)accessibleDescription;

/**
 * Gets the accessible label of @self.
 *
 * @return the accessible label
 */
- (OFString*)accessibleLabel;

/**
 * Checks if a list item has been set to be activatable via
 * gtk_list_item_set_activatable().
 *
 * @return %TRUE if the item is activatable
 */
- (bool)activatable;

/**
 * Gets the child previously set via gtk_list_item_set_child() or
 * %NULL if none was set.
 *
 * @return The child
 */
- (OGTKWidget*)child;

/**
 * Checks if a list item has been set to be focusable via
 * gtk_list_item_set_focusable().
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
 * Checks if a list item has been set to be selectable via
 * gtk_list_item_set_selectable().
 * 
 * Do not confuse this function with [method@Gtk.ListItem.get_selected].
 *
 * @return %TRUE if the item is selectable
 */
- (bool)selectable;

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
 * Sets the accessible description for the list item,
 * which may be used by e.g. screen readers.
 *
 * @param description the description
 */
- (void)setAccessibleDescription:(OFString*)description;

/**
 * Sets the accessible label for the list item,
 * which may be used by e.g. screen readers.
 *
 * @param label the label
 */
- (void)setAccessibleLabel:(OFString*)label;

/**
 * Sets @self to be activatable.
 * 
 * If an item is activatable, double-clicking on the item, using
 * the Return key or calling gtk_widget_activate() will activate
 * the item. Activating instructs the containing view to handle
 * activation. `GtkListView` for example will be emitting the
 * [signal@Gtk.ListView::activate] signal.
 * 
 * By default, list items are activatable.
 *
 * @param activatable if the item should be activatable
 */
- (void)setActivatable:(bool)activatable;

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

/**
 * Sets @self to be selectable.
 * 
 * If an item is selectable, clicking on the item or using the keyboard
 * will try to select or unselect the item. If this succeeds is up to
 * the model to determine, as it is managing the selected state.
 * 
 * Note that this means that making an item non-selectable has no
 * influence on the selected state at all. A non-selectable item
 * may still be selected.
 * 
 * By default, list items are selectable. When rebinding them to
 * a new item, they will also be reset to be selectable by GTK.
 *
 * @param selectable if the item should be selectable
 */
- (void)setSelectable:(bool)selectable;

@end