/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKListItemFactory;

/**
 * `GtkDropDown` is a widget that allows the user to choose an item
 * from a list of options.
 * 
 * ![An example GtkDropDown](drop-down.png)
 * 
 * The `GtkDropDown` displays the [selected][property@Gtk.DropDown:selected]
 * choice.
 * 
 * The options are given to `GtkDropDown` in the form of `GListModel`
 * and how the individual options are represented is determined by
 * a [class@Gtk.ListItemFactory]. The default factory displays simple strings,
 * and adds a checkmark to the selected item in the popup.
 * 
 * To set your own factory, use [method@Gtk.DropDown.set_factory]. It is
 * possible to use a separate factory for the items in the popup, with
 * [method@Gtk.DropDown.set_list_factory].
 * 
 * `GtkDropDown` knows how to obtain strings from the items in a
 * [class@Gtk.StringList]; for other models, you have to provide an expression
 * to find the strings via [method@Gtk.DropDown.set_expression].
 * 
 * `GtkDropDown` can optionally allow search in the popup, which is
 * useful if the list of options is long. To enable the search entry,
 * use [method@Gtk.DropDown.set_enable_search].
 * 
 * Here is a UI definition example for `GtkDropDown` with a simple model:
 * 
 * ```xml
 * <object class="GtkDropDown">
 *   <property name="model">
 *     <object class="GtkStringList">
 *       <items>
 *         <item translatable="yes">Factory</item>
 *         <item translatable="yes">Home</item>
 *         <item translatable="yes">Subway</item>
 *       </items>
 *     </object>
 *   </property>
 * </object>
 * ```
 * 
 * If a `GtkDropDown` is created in this manner, or with
 * [ctor@Gtk.DropDown.new_from_strings], for instance, the object returned from
 * [method@Gtk.DropDown.get_selected_item] will be a [class@Gtk.StringObject].
 * 
 * To learn more about the list widget framework, see the
 * [overview](section-list-widget.html).
 * 
 * ## CSS nodes
 * 
 * `GtkDropDown` has a single CSS node with name dropdown,
 * with the button and popover nodes as children.
 * 
 * ## Accessibility
 * 
 * `GtkDropDown` uses the %GTK_ACCESSIBLE_ROLE_COMBO_BOX role.
 *
 */
@interface OGTKDropDown : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)initWithModel:(GListModel*)model expression:(GtkExpression*)expression;
- (instancetype)initFromStrings:(const char* const*)strings;

/**
 * Methods
 */

- (GtkDropDown*)castedGObject;

/**
 * Returns whether search is enabled.
 *
 * @return %TRUE if the popup includes a search entry
 */
- (bool)enableSearch;

/**
 * Gets the expression set that is used to obtain strings from items.
 * 
 * See [method@Gtk.DropDown.set_expression].
 *
 * @return a `GtkExpression`
 */
- (GtkExpression*)expression;

/**
 * Gets the factory that's currently used to populate list items.
 * 
 * The factory returned by this function is always used for the
 * item in the button. It is also used for items in the popup
 * if [property@Gtk.DropDown:list-factory] is not set.
 *
 * @return The factory in use
 */
- (OGTKListItemFactory*)factory;

/**
 * Gets the factory that's currently used to create header widgets for the popup.
 *
 * @return The factory in use
 */
- (OGTKListItemFactory*)headerFactory;

/**
 * Gets the factory that's currently used to populate list items in the popup.
 *
 * @return The factory in use
 */
- (OGTKListItemFactory*)listFactory;

/**
 * Gets the model that provides the displayed items.
 *
 * @return The model in use
 */
- (GListModel*)model;

/**
 * Returns the match mode that the search filter is using.
 *
 * @return the match mode of the search filter
 */
- (GtkStringFilterMatchMode)searchMatchMode;

/**
 * Gets the position of the selected item.
 *
 * @return the position of the selected item, or %GTK_INVALID_LIST_POSITION
 *   if not item is selected
 */
- (guint)selected;

/**
 * Gets the selected item. If no item is selected, %NULL is returned.
 *
 * @return The selected item
 */
- (gpointer)selectedItem;

/**
 * Returns whether to show an arrow within the widget.
 *
 * @return %TRUE if an arrow will be shown.
 */
- (bool)showArrow;

/**
 * Sets whether a search entry will be shown in the popup that
 * allows to search for items in the list.
 * 
 * Note that [property@Gtk.DropDown:expression] must be set for
 * search to work.
 *
 * @param enableSearch whether to enable search
 */
- (void)setEnableSearch:(bool)enableSearch;

/**
 * Sets the expression that gets evaluated to obtain strings from items.
 * 
 * This is used for search in the popup. The expression must have
 * a value type of %G_TYPE_STRING.
 *
 * @param expression a `GtkExpression`
 */
- (void)setExpression:(GtkExpression*)expression;

/**
 * Sets the `GtkListItemFactory` to use for populating list items.
 *
 * @param factory the factory to use
 */
- (void)setFactory:(OGTKListItemFactory*)factory;

/**
 * Sets the `GtkListItemFactory` to use for creating header widgets for the popup.
 *
 * @param factory the factory to use
 */
- (void)setHeaderFactory:(OGTKListItemFactory*)factory;

/**
 * Sets the `GtkListItemFactory` to use for populating list items in the popup.
 *
 * @param factory the factory to use
 */
- (void)setListFactory:(OGTKListItemFactory*)factory;

/**
 * Sets the `GListModel` to use.
 *
 * @param model the model to use
 */
- (void)setModel:(GListModel*)model;

/**
 * Sets the match mode for the search filter.
 *
 * @param searchMatchMode the new match mode
 */
- (void)setSearchMatchMode:(GtkStringFilterMatchMode)searchMatchMode;

/**
 * Selects the item at the given position.
 *
 * @param position the position of the item to select, or %GTK_INVALID_LIST_POSITION
 */
- (void)setSelected:(guint)position;

/**
 * Sets whether an arrow will be displayed within the widget.
 *
 * @param showArrow whether to show an arrow within the widget
 */
- (void)setShowArrow:(bool)showArrow;

@end