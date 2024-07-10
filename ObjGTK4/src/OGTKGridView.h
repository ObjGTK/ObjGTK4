/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListBase.h"

@class OGTKWidget;
@class OGTKListItemFactory;

/**
 * `GtkGridView` presents a large dynamic grid of items.
 * 
 * `GtkGridView` uses its factory to generate one child widget for each
 * visible item and shows them in a grid. The orientation of the grid view
 * determines if the grid reflows vertically or horizontally.
 * 
 * `GtkGridView` allows the user to select items according to the selection
 * characteristics of the model. For models that allow multiple selected items,
 * it is possible to turn on _rubberband selection_, using
 * [property@Gtk.GridView:enable-rubberband].
 * 
 * To learn more about the list widget framework, see the
 * [overview](section-list-widget.html).
 * 
 * # CSS nodes
 * 
 * ```
 * gridview
 * ├── child[.activatable]
 * │
 * ├── child[.activatable]
 * │
 * ┊
 * ╰── [rubberband]
 * ```
 * 
 * `GtkGridView` uses a single CSS node with name `gridview`. Each child uses
 * a single CSS node with name `child`. If the [property@Gtk.ListItem:activatable]
 * property is set, the corresponding row will have the `.activatable` style
 * class. For rubberband selection, a subnode with name `rubberband` is used.
 * 
 * # Accessibility
 * 
 * `GtkGridView` uses the %GTK_ACCESSIBLE_ROLE_GRID role, and the items
 * use the %GTK_ACCESSIBLE_ROLE_GRID_CELL role.
 *
 */
@interface OGTKGridView : OGTKListBase
{

}


/**
 * Constructors
 */
- (instancetype)initWithModel:(GtkSelectionModel*)model factory:(OGTKListItemFactory*)factory;

/**
 * Methods
 */

- (GtkGridView*)castedGObject;

/**
 * Returns whether rows can be selected by dragging with the mouse.
 *
 * @return %TRUE if rubberband selection is enabled
 */
- (bool)enableRubberband;

/**
 * Gets the factory that's currently used to populate list items.
 *
 * @return The factory in use
 */
- (OGTKListItemFactory*)factory;

/**
 * Gets the maximum number of columns that the grid will use.
 *
 * @return The maximum number of columns
 */
- (guint)maxColumns;

/**
 * Gets the minimum number of columns that the grid will use.
 *
 * @return The minimum number of columns
 */
- (guint)minColumns;

/**
 * Gets the model that's currently used to read the items displayed.
 *
 * @return The model in use
 */
- (GtkSelectionModel*)model;

/**
 * Returns whether items will be activated on single click and
 * selected on hover.
 *
 * @return %TRUE if items are activated on single click
 */
- (bool)singleClickActivate;

/**
 * Sets whether selections can be changed by dragging with the mouse.
 *
 * @param enableRubberband %TRUE to enable rubberband selection
 */
- (void)setEnableRubberband:(bool)enableRubberband;

/**
 * Sets the `GtkListItemFactory` to use for populating list items.
 *
 * @param factory the factory to use
 */
- (void)setFactory:(OGTKListItemFactory*)factory;

/**
 * Sets the maximum number of columns to use.
 * 
 * This number must be at least 1.
 * 
 * If @max_columns is smaller than the minimum set via
 * [method@Gtk.GridView.set_min_columns], that value is used instead.
 *
 * @param maxColumns The maximum number of columns
 */
- (void)setMaxColumns:(guint)maxColumns;

/**
 * Sets the minimum number of columns to use.
 * 
 * This number must be at least 1.
 * 
 * If @min_columns is smaller than the minimum set via
 * [method@Gtk.GridView.set_max_columns], that value is ignored.
 *
 * @param minColumns The minimum number of columns
 */
- (void)setMinColumns:(guint)minColumns;

/**
 * Sets the imodel to use.
 * 
 * This must be a [iface@Gtk.SelectionModel].
 *
 * @param model the model to use
 */
- (void)setModel:(GtkSelectionModel*)model;

/**
 * Sets whether items should be activated on single click and
 * selected on hover.
 *
 * @param singleClickActivate %TRUE to activate items on single click
 */
- (void)setSingleClickActivate:(bool)singleClickActivate;

@end