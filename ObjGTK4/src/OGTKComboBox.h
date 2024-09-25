/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGGdkDevice;

/**
 * A `GtkComboBox` is a widget that allows the user to choose from a list of
 * valid choices.
 * 
 * ![An example GtkComboBox](combo-box.png)
 * 
 * The `GtkComboBox` displays the selected choice; when activated, the
 * `GtkComboBox` displays a popup which allows the user to make a new choice.
 * 
 * The `GtkComboBox` uses the model-view pattern; the list of valid choices
 * is specified in the form of a tree model, and the display of the choices
 * can be adapted to the data in the model by using cell renderers, as you
 * would in a tree view. This is possible since `GtkComboBox` implements the
 * [iface@Gtk.CellLayout] interface. The tree model holding the valid
 * choices is not restricted to a flat list, it can be a real tree, and the
 * popup will reflect the tree structure.
 * 
 * To allow the user to enter values not in the model, the
 * [property@Gtk.ComboBox:has-entry] property allows the `GtkComboBox` to
 * contain a [class@Gtk.Entry]. This entry can be accessed by calling
 * [method@Gtk.ComboBox.get_child] on the combo box.
 * 
 * For a simple list of textual choices, the model-view API of `GtkComboBox`
 * can be a bit overwhelming. In this case, [class@Gtk.ComboBoxText] offers
 * a simple alternative. Both `GtkComboBox` and `GtkComboBoxText` can contain
 * an entry.
 * 
 * ## CSS nodes
 * 
 * ```
 * combobox
 * ├── box.linked
 * │   ╰── button.combo
 * │       ╰── box
 * │           ├── cellview
 * │           ╰── arrow
 * ╰── window.popup
 * ```
 * 
 * A normal combobox contains a box with the .linked class, a button
 * with the .combo class and inside those buttons, there are a cellview and
 * an arrow.
 * 
 * ```
 * combobox
 * ├── box.linked
 * │   ├── entry.combo
 * │   ╰── button.combo
 * │       ╰── box
 * │           ╰── arrow
 * ╰── window.popup
 * ```
 * 
 * A `GtkComboBox` with an entry has a single CSS node with name combobox.
 * It contains a box with the .linked class. That box contains an entry and
 * a button, both with the .combo class added. The button also contains another
 * node with name arrow.
 * 
 * ## Accessibility
 * 
 * `GtkComboBox` uses the %GTK_ACCESSIBLE_ROLE_COMBO_BOX role.
 *
 */
@interface OGTKComboBox : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithEntry;
- (instancetype)initWithModel:(GtkTreeModel*)model;
- (instancetype)initWithModelAndEntry:(GtkTreeModel*)model;

/**
 * Methods
 */

- (GtkComboBox*)castedGObject;

/**
 * Returns the index of the currently active item.
 * 
 * If the model is a non-flat treemodel, and the active item is not
 * an immediate child of the root of the tree, this function returns
 * `gtk_tree_path_get_indices (path)[0]`, where `path` is the
 * [struct@Gtk.TreePath] of the active item.
 *
 * @return An integer which is the index of the currently active item,
 *   or -1 if there’s no active item
 */
- (int)active;

/**
 * Returns the ID of the active row of @combo_box.
 * 
 * This value is taken from the active row and the column specified
 * by the [property@Gtk.ComboBox:id-column] property of @combo_box
 * (see [method@Gtk.ComboBox.set_id_column]).
 * 
 * The returned value is an interned string which means that you can
 * compare the pointer by value to other interned strings and that you
 * must not free it.
 * 
 * If the [property@Gtk.ComboBox:id-column] property of @combo_box is
 * not set, or if no row is active, or if the active row has a %NULL
 * ID value, then %NULL is returned.
 *
 * @return the ID of the active row
 */
- (OFString*)activeId;

/**
 * Sets @iter to point to the currently active item.
 * 
 * If no item is active, @iter is left unchanged.
 *
 * @param iter A `GtkTreeIter`
 * @return %TRUE if @iter was set, %FALSE otherwise
 */
- (bool)activeIter:(GtkTreeIter*)iter;

/**
 * Returns whether the combo box sets the dropdown button
 * sensitive or not when there are no items in the model.
 *
 * @return %GTK_SENSITIVITY_ON if the dropdown button
 *   is sensitive when the model is empty, %GTK_SENSITIVITY_OFF
 *   if the button is always insensitive or %GTK_SENSITIVITY_AUTO
 *   if it is only sensitive as long as the model has one item to
 *   be selected.
 */
- (GtkSensitivityType)buttonSensitivity;

/**
 * Gets the child widget of @combo_box.
 *
 * @return the child widget of @combo_box
 */
- (OGTKWidget*)child;

/**
 * Returns the column which @combo_box is using to get the strings
 * from to display in the internal entry.
 *
 * @return A column in the data source model of @combo_box.
 */
- (int)entryTextColumn;

/**
 * Returns whether the combo box has an entry.
 *
 * @return whether there is an entry in @combo_box.
 */
- (bool)hasEntry;

/**
 * Returns the column which @combo_box is using to get string IDs
 * for values from.
 *
 * @return A column in the data source model of @combo_box.
 */
- (int)idColumn;

/**
 * Returns the `GtkTreeModel` of @combo_box.
 *
 * @return A `GtkTreeModel` which was passed
 *   during construction.
 */
- (GtkTreeModel*)model;

/**
 * Gets whether the popup uses a fixed width.
 *
 * @return %TRUE if the popup uses a fixed width
 */
- (bool)popupFixedWidth;

/**
 * Returns the current row separator function.
 *
 * @return the current row separator function.
 */
- (GtkTreeViewRowSeparatorFunc)rowSeparatorFunc;

/**
 * Hides the menu or dropdown list of @combo_box.
 * 
 * This function is mostly intended for use by accessibility technologies;
 * applications should have little use for it.
 *
 */
- (void)popdown;

/**
 * Pops up the menu or dropdown list of @combo_box.
 * 
 * This function is mostly intended for use by accessibility technologies;
 * applications should have little use for it.
 * 
 * Before calling this, @combo_box must be mapped, or nothing will happen.
 *
 */
- (void)popup;

/**
 * Pops up the menu of @combo_box.
 * 
 * Note that currently this does not do anything with the device, as it was
 * previously only used for list-mode combo boxes, and those were removed
 * in GTK 4. However, it is retained in case similar functionality is added
 * back later.
 *
 * @param device a `GdkDevice`
 */
- (void)popupForDevice:(OGGdkDevice*)device;

/**
 * Sets the active item of @combo_box to be the item at @index.
 *
 * @param index An index in the model passed during construction,
 *   or -1 to have no active item
 */
- (void)setActive:(int)index;

/**
 * Changes the active row of @combo_box to the one that has an ID equal to
 * @active_id.
 * 
 * If @active_id is %NULL, the active row is unset. Rows having
 * a %NULL ID string cannot be made active by this function.
 * 
 * If the [property@Gtk.ComboBox:id-column] property of @combo_box is
 * unset or if no row has the given ID then the function does nothing
 * and returns %FALSE.
 *
 * @param activeId the ID of the row to select
 * @return %TRUE if a row with a matching ID was found. If a %NULL
 *   @active_id was given to unset the active row, the function
 *   always returns %TRUE.
 */
- (bool)setActiveId:(OFString*)activeId;

/**
 * Sets the current active item to be the one referenced by @iter.
 * 
 * If @iter is %NULL, the active item is unset.
 *
 * @param iter The `GtkTreeIter`
 */
- (void)setActiveIter:(GtkTreeIter*)iter;

/**
 * Sets whether the dropdown button of the combo box should update
 * its sensitivity depending on the model contents.
 *
 * @param sensitivity specify the sensitivity of the dropdown button
 */
- (void)setButtonSensitivity:(GtkSensitivityType)sensitivity;

/**
 * Sets the child widget of @combo_box.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets the model column which @combo_box should use to get strings
 * from to be @text_column.
 * 
 * For this column no separate
 * [class@Gtk.CellRenderer] is needed.
 * 
 * The column @text_column in the model of @combo_box must be of
 * type %G_TYPE_STRING.
 * 
 * This is only relevant if @combo_box has been created with
 * [property@Gtk.ComboBox:has-entry] as %TRUE.
 *
 * @param textColumn A column in @model to get the strings from for
 *   the internal entry
 */
- (void)setEntryTextColumn:(int)textColumn;

/**
 * Sets the model column which @combo_box should use to get string IDs
 * for values from.
 * 
 * The column @id_column in the model of @combo_box must be of type
 * %G_TYPE_STRING.
 *
 * @param idColumn A column in @model to get string IDs for values from
 */
- (void)setIdColumn:(int)idColumn;

/**
 * Sets the model used by @combo_box to be @model.
 * 
 * Will unset a previously set model (if applicable). If model is %NULL,
 * then it will unset the model.
 * 
 * Note that this function does not clear the cell renderers, you have to
 * call [method@Gtk.CellLayout.clear] yourself if you need to set up different
 * cell renderers for the new model.
 *
 * @param model A `GtkTreeModel`
 */
- (void)setModel:(GtkTreeModel*)model;

/**
 * Specifies whether the popup’s width should be a fixed width.
 * 
 * If @fixed is %TRUE, the popup's width is set to match the
 * allocated width of the combo box.
 *
 * @param fixed whether to use a fixed popup width
 */
- (void)setPopupFixedWidth:(bool)fixed;

/**
 * Sets the row separator function, which is used to determine
 * whether a row should be drawn as a separator.
 * 
 * If the row separator function is %NULL, no separators are drawn.
 * This is the default value.
 *
 * @param func a `GtkTreeViewRowSeparatorFunc`
 * @param data user data to pass to @func
 * @param destroy destroy notifier for @data
 */
- (void)setRowSeparatorFuncWithFunc:(GtkTreeViewRowSeparatorFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy;

@end