/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGMenuModel;

/**
 * `GtkPopoverMenuBar` presents a horizontal bar of items that pop
 * up popover menus when clicked.
 * 
 * ![An example GtkPopoverMenuBar](menubar.png)
 * 
 * The only way to create instances of `GtkPopoverMenuBar` is
 * from a `GMenuModel`.
 * 
 * # CSS nodes
 * 
 * ```
 * menubar
 * ├── item[.active]
 * ┊   ╰── popover
 * ╰── item
 *     ╰── popover
 * ```
 * 
 * `GtkPopoverMenuBar` has a single CSS node with name menubar, below which
 * each item has its CSS node, and below that the corresponding popover.
 * 
 * The item whose popover is currently open gets the .active
 * style class.
 * 
 * # Accessibility
 * 
 * `GtkPopoverMenuBar` uses the %GTK_ACCESSIBLE_ROLE_MENU_BAR role,
 * the menu items use the %GTK_ACCESSIBLE_ROLE_MENU_ITEM role and
 * the menus use the %GTK_ACCESSIBLE_ROLE_MENU role.
 *
 */
@interface OGTKPopoverMenuBar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)initFromModel:(OGMenuModel*)model;

/**
 * Methods
 */

- (GtkPopoverMenuBar*)castedGObject;

/**
 * Adds a custom widget to a generated menubar.
 * 
 * For this to work, the menu model of @bar must have an
 * item with a `custom` attribute that matches @id.
 *
 * @param child the `GtkWidget` to add
 * @param id the ID to insert @child at
 * @return %TRUE if @id was found and the widget added
 */
- (bool)addChildWithChild:(OGTKWidget*)child id:(OFString*)id;

/**
 * Returns the model from which the contents of @bar are taken.
 *
 * @return a `GMenuModel`
 */
- (OGMenuModel*)menuModel;

/**
 * Removes a widget that has previously been added with
 * gtk_popover_menu_bar_add_child().
 *
 * @param child the `GtkWidget` to remove
 * @return %TRUE if the widget was removed
 */
- (bool)removeChild:(OGTKWidget*)child;

/**
 * Sets a menu model from which @bar should take
 * its contents.
 *
 * @param model a `GMenuModel`
 */
- (void)setMenuModel:(OGMenuModel*)model;

@end