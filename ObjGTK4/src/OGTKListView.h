/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListBase.h"

@class OGTKListItemFactory;
@class OGTKWidget;

/**
 * `GtkListView` presents a large dynamic list of items.
 * 
 * `GtkListView` uses its factory to generate one row widget for each visible
 * item and shows them in a linear display, either vertically or horizontally.
 * 
 * The [property@Gtk.ListView:show-separators] property offers a simple way to
 * display separators between the rows.
 * 
 * `GtkListView` allows the user to select items according to the selection
 * characteristics of the model. For models that allow multiple selected items,
 * it is possible to turn on _rubberband selection_, using
 * [property@Gtk.ListView:enable-rubberband].
 * 
 * If you need multiple columns with headers, see [class@Gtk.ColumnView].
 * 
 * To learn more about the list widget framework, see the
 * [overview](section-list-widget.html).
 * 
 * An example of using `GtkListView`:
 * ```c
 * static void
 * setup_listitem_cb (GtkListItemFactory *factory,
 *                    GtkListItem        *list_item)
 * {
 *   GtkWidget *image;
 * 
 *   image = gtk_image_new ();
 *   gtk_image_set_icon_size (GTK_IMAGE (image), GTK_ICON_SIZE_LARGE);
 *   gtk_list_item_set_child (list_item, image);
 * }
 * 
 * static void
 * bind_listitem_cb (GtkListItemFactory *factory,
 *                   GtkListItem        *list_item)
 * {
 *   GtkWidget *image;
 *   GAppInfo *app_info;
 * 
 *   image = gtk_list_item_get_child (list_item);
 *   app_info = gtk_list_item_get_item (list_item);
 *   gtk_image_set_from_gicon (GTK_IMAGE (image), g_app_info_get_icon (app_info));
 * }
 * 
 * static void
 * activate_cb (GtkListView  *list,
 *              guint         position,
 *              gpointer      unused)
 * {
 *   GAppInfo *app_info;
 * 
 *   app_info = g_list_model_get_item (G_LIST_MODEL (gtk_list_view_get_model (list)), position);
 *   g_app_info_launch (app_info, NULL, NULL, NULL);
 *   g_object_unref (app_info);
 * }
 * 
 * ...
 * 
 *   model = create_application_list ();
 * 
 *   factory = gtk_signal_list_item_factory_new ();
 *   g_signal_connect (factory, "setup", G_CALLBACK (setup_listitem_cb), NULL);
 *   g_signal_connect (factory, "bind", G_CALLBACK (bind_listitem_cb), NULL);
 * 
 *   list = gtk_list_view_new (GTK_SELECTION_MODEL (gtk_single_selection_new (model)), factory);
 * 
 *   g_signal_connect (list, "activate", G_CALLBACK (activate_cb), NULL);
 * 
 *   gtk_scrolled_window_set_child (GTK_SCROLLED_WINDOW (sw), list);
 * ```
 * 
 * # CSS nodes
 * 
 * ```
 * listview[.separators][.rich-list][.navigation-sidebar][.data-table]
 * ├── row[.activatable]
 * │
 * ├── row[.activatable]
 * │
 * ┊
 * ╰── [rubberband]
 * ```
 * 
 * `GtkListView` uses a single CSS node named `listview`. It may carry the
 * `.separators` style class, when [property@Gtk.ListView:show-separators]
 * property is set. Each child widget uses a single CSS node named `row`.
 * If the [property@Gtk.ListItem:activatable] property is set, the
 * corresponding row will have the `.activatable` style class. For
 * rubberband selection, a node with name `rubberband` is used.
 * 
 * The main listview node may also carry style classes to select
 * the style of [list presentation](ListContainers.html#list-styles):
 * .rich-list, .navigation-sidebar or .data-table.
 * 
 * # Accessibility
 * 
 * `GtkListView` uses the %GTK_ACCESSIBLE_ROLE_LIST role, and the list
 * items use the %GTK_ACCESSIBLE_ROLE_LIST_ITEM role.
 *
 */
@interface OGTKListView : OGTKListBase
{

}


/**
 * Constructors
 */
- (instancetype)initWithModel:(GtkSelectionModel*)model factory:(OGTKListItemFactory*)factory;

/**
 * Methods
 */

- (GtkListView*)castedGObject;

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
 * Gets the model that's currently used to read the items displayed.
 *
 * @return The model in use
 */
- (GtkSelectionModel*)model;

/**
 * Returns whether the list box should show separators
 * between rows.
 *
 * @return %TRUE if the list box shows separators
 */
- (bool)showSeparators;

/**
 * Returns whether rows will be activated on single click and
 * selected on hover.
 *
 * @return %TRUE if rows are activated on single click
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
 * Sets the model to use.
 * 
 * This must be a [iface@Gtk.SelectionModel] to use.
 *
 * @param model the model to use
 */
- (void)setModel:(GtkSelectionModel*)model;

/**
 * Sets whether the list box should show separators
 * between rows.
 *
 * @param showSeparators %TRUE to show separators
 */
- (void)setShowSeparators:(bool)showSeparators;

/**
 * Sets whether rows should be activated on single click and
 * selected on hover.
 *
 * @param singleClickActivate %TRUE to activate items on single click
 */
- (void)setSingleClickActivate:(bool)singleClickActivate;

@end