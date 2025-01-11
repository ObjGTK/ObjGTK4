/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKAdjustment;
@class OGTKListBoxRow;

/**
 * `GtkListBox` is a vertical list.
 * 
 * A `GtkListBox` only contains `GtkListBoxRow` children. These rows can
 * by dynamically sorted and filtered, and headers can be added dynamically
 * depending on the row content. It also allows keyboard and mouse navigation
 * and selection like a typical list.
 * 
 * Using `GtkListBox` is often an alternative to `GtkTreeView`, especially
 * when the list contents has a more complicated layout than what is allowed
 * by a `GtkCellRenderer`, or when the contents is interactive (i.e. has a
 * button in it).
 * 
 * Although a `GtkListBox` must have only `GtkListBoxRow` children, you can
 * add any kind of widget to it via [method@Gtk.ListBox.prepend],
 * [method@Gtk.ListBox.append] and [method@Gtk.ListBox.insert] and a
 * `GtkListBoxRow` widget will automatically be inserted between the list
 * and the widget.
 * 
 * `GtkListBoxRows` can be marked as activatable or selectable. If a row is
 * activatable, [signal@Gtk.ListBox::row-activated] will be emitted for it when
 * the user tries to activate it. If it is selectable, the row will be marked
 * as selected when the user tries to select it.
 * 
 * # GtkListBox as GtkBuildable
 * 
 * The `GtkListBox` implementation of the `GtkBuildable` interface supports
 * setting a child as the placeholder by specifying “placeholder” as the “type”
 * attribute of a `<child>` element. See [method@Gtk.ListBox.set_placeholder]
 * for info.
 * 
 * # CSS nodes
 * 
 * |[<!-- language="plain" -->
 * list[.separators][.rich-list][.navigation-sidebar][.boxed-list]
 * ╰── row[.activatable]
 * ]|
 * 
 * `GtkListBox` uses a single CSS node named list. It may carry the .separators
 * style class, when the [property@Gtk.ListBox:show-separators] property is set.
 * Each `GtkListBoxRow` uses a single CSS node named row. The row nodes get the
 * .activatable style class added when appropriate.
 * 
 * It may also carry the .boxed-list style class. In this case, the list will be
 * automatically surrounded by a frame and have separators.
 * 
 * The main list node may also carry style classes to select
 * the style of [list presentation](section-list-widget.html#list-styles):
 * .rich-list, .navigation-sidebar or .data-table.
 * 
 * # Accessibility
 * 
 * `GtkListBox` uses the %GTK_ACCESSIBLE_ROLE_LIST role and `GtkListBoxRow` uses
 * the %GTK_ACCESSIBLE_ROLE_LIST_ITEM role.
 *
 */
@interface OGTKListBox : OGTKWidget
{

}


/**
 * Constructors
 */
+ (instancetype)listBox;

/**
 * Methods
 */

- (GtkListBox*)castedGObject;

/**
 * Append a widget to the list.
 * 
 * If a sort function is set, the widget will
 * actually be inserted at the calculated position.
 *
 * @param child the `GtkWidget` to add
 */
- (void)append:(OGTKWidget*)child;

/**
 * Binds @model to @box.
 * 
 * If @box was already bound to a model, that previous binding is
 * destroyed.
 * 
 * The contents of @box are cleared and then filled with widgets that
 * represent items from @model. @box is updated whenever @model changes.
 * If @model is %NULL, @box is left empty.
 * 
 * It is undefined to add or remove widgets directly (for example, with
 * [method@Gtk.ListBox.insert]) while @box is bound to a model.
 * 
 * Note that using a model is incompatible with the filtering and sorting
 * functionality in `GtkListBox`. When using a model, filtering and sorting
 * should be implemented by the model.
 *
 * @param model the `GListModel` to be bound to @box
 * @param createWidgetFunc a function that creates widgets for items
 *   or %NULL in case you also passed %NULL as @model
 * @param userData user data passed to @create_widget_func
 * @param userDataFreeFunc function for freeing @user_data
 */
- (void)bindModelWithModel:(GListModel*)model createWidgetFunc:(GtkListBoxCreateWidgetFunc)createWidgetFunc userData:(gpointer)userData userDataFreeFunc:(GDestroyNotify)userDataFreeFunc;

/**
 * Add a drag highlight to a row.
 * 
 * This is a helper function for implementing DnD onto a `GtkListBox`.
 * The passed in @row will be highlighted by setting the
 * %GTK_STATE_FLAG_DROP_ACTIVE state and any previously highlighted
 * row will be unhighlighted.
 * 
 * The row will also be unhighlighted when the widget gets
 * a drag leave event.
 *
 * @param row a `GtkListBoxRow`
 */
- (void)dragHighlightRow:(OGTKListBoxRow*)row;

/**
 * If a row has previously been highlighted via gtk_list_box_drag_highlight_row(),
 * it will have the highlight removed.
 *
 */
- (void)dragUnhighlightRow;

/**
 * Returns whether rows activate on single clicks.
 *
 * @return %TRUE if rows are activated on single click, %FALSE otherwise
 */
- (bool)activateOnSingleClick;

/**
 * Gets the adjustment (if any) that the widget uses to
 * for vertical scrolling.
 *
 * @return the adjustment
 */
- (OGTKAdjustment*)adjustment;

/**
 * Gets the n-th child in the list (not counting headers).
 * 
 * If @index_ is negative or larger than the number of items in the
 * list, %NULL is returned.
 *
 * @param index the index of the row
 * @return the child `GtkWidget`
 */
- (OGTKListBoxRow*)rowAtIndex:(int)index;

/**
 * Gets the row at the @y position.
 *
 * @param y position
 * @return the row
 */
- (OGTKListBoxRow*)rowAtY:(int)y;

/**
 * Gets the selected row, or %NULL if no rows are selected.
 * 
 * Note that the box may allow multiple selection, in which
 * case you should use [method@Gtk.ListBox.selected_foreach] to
 * find all selected rows.
 *
 * @return the selected row
 */
- (OGTKListBoxRow*)selectedRow;

/**
 * Creates a list of all selected children.
 *
 * @return A `GList` containing the `GtkWidget` for each selected child.
 *   Free with g_list_free() when done.
 */
- (GList*)selectedRows;

/**
 * Gets the selection mode of the listbox.
 *
 * @return a `GtkSelectionMode`
 */
- (GtkSelectionMode)selectionMode;

/**
 * Returns whether the list box should show separators
 * between rows.
 *
 * @return %TRUE if the list box shows separators
 */
- (bool)showSeparators;

/**
 * Insert the @child into the @box at @position.
 * 
 * If a sort function is
 * set, the widget will actually be inserted at the calculated position.
 * 
 * If @position is -1, or larger than the total number of items in the
 * @box, then the @child will be appended to the end.
 *
 * @param child the `GtkWidget` to add
 * @param position the position to insert @child in
 */
- (void)insertWithChild:(OGTKWidget*)child position:(int)position;

/**
 * Update the filtering for all rows.
 * 
 * Call this when result
 * of the filter function on the @box is changed due
 * to an external factor. For instance, this would be used
 * if the filter function just looked for a specific search
 * string and the entry with the search string has changed.
 *
 */
- (void)invalidateFilter;

/**
 * Update the separators for all rows.
 * 
 * Call this when result
 * of the header function on the @box is changed due
 * to an external factor.
 *
 */
- (void)invalidateHeaders;

/**
 * Update the sorting for all rows.
 * 
 * Call this when result
 * of the sort function on the @box is changed due
 * to an external factor.
 *
 */
- (void)invalidateSort;

/**
 * Prepend a widget to the list.
 * 
 * If a sort function is set, the widget will
 * actually be inserted at the calculated position.
 *
 * @param child the `GtkWidget` to add
 */
- (void)prepend:(OGTKWidget*)child;

/**
 * Removes a child from @box.
 *
 * @param child the child to remove
 */
- (void)remove:(OGTKWidget*)child;

/**
 * Removes all rows from @box.
 * 
 * This function does nothing if @box is backed by a model.
 *
 */
- (void)removeAll;

/**
 * Select all children of @box, if the selection mode allows it.
 *
 */
- (void)selectAll;

/**
 * Make @row the currently selected row.
 *
 * @param row The row to select
 */
- (void)selectRow:(OGTKListBoxRow*)row;

/**
 * Calls a function for each selected child.
 * 
 * Note that the selection cannot be modified from within this function.
 *
 * @param func the function to call for each selected child
 * @param data user data to pass to the function
 */
- (void)selectedForeachWithFunc:(GtkListBoxForeachFunc)func data:(gpointer)data;

/**
 * If @single is %TRUE, rows will be activated when you click on them,
 * otherwise you need to double-click.
 *
 * @param single a boolean
 */
- (void)setActivateOnSingleClick:(bool)single;

/**
 * Sets the adjustment (if any) that the widget uses to
 * for vertical scrolling.
 * 
 * For instance, this is used to get the page size for
 * PageUp/Down key handling.
 * 
 * In the normal case when the @box is packed inside
 * a `GtkScrolledWindow` the adjustment from that will
 * be picked up automatically, so there is no need
 * to manually do that.
 *
 * @param adjustment the adjustment
 */
- (void)setAdjustment:(OGTKAdjustment*)adjustment;

/**
 * By setting a filter function on the @box one can decide dynamically which
 * of the rows to show.
 * 
 * For instance, to implement a search function on a list that
 * filters the original list to only show the matching rows.
 * 
 * The @filter_func will be called for each row after the call, and
 * it will continue to be called each time a row changes (via
 * [method@Gtk.ListBoxRow.changed]) or when [method@Gtk.ListBox.invalidate_filter]
 * is called.
 * 
 * Note that using a filter function is incompatible with using a model
 * (see [method@Gtk.ListBox.bind_model]).
 *
 * @param filterFunc callback that lets you filter which rows to show
 * @param userData user data passed to @filter_func
 * @param destroy destroy notifier for @user_data
 */
- (void)setFilterFuncWithFilterFunc:(GtkListBoxFilterFunc)filterFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy;

/**
 * Sets a header function.
 * 
 * By setting a header function on the @box one can dynamically add headers
 * in front of rows, depending on the contents of the row and its position
 * in the list.
 * 
 * For instance, one could use it to add headers in front of the first item
 * of a new kind, in a list sorted by the kind.
 * 
 * The @update_header can look at the current header widget using
 * [method@Gtk.ListBoxRow.get_header] and either update the state of the widget
 * as needed, or set a new one using [method@Gtk.ListBoxRow.set_header]. If no
 * header is needed, set the header to %NULL.
 * 
 * Note that you may get many calls @update_header to this for a particular
 * row when e.g. changing things that don’t affect the header. In this case
 * it is important for performance to not blindly replace an existing header
 * with an identical one.
 * 
 * The @update_header function will be called for each row after the call,
 * and it will continue to be called each time a row changes (via
 * [method@Gtk.ListBoxRow.changed]) and when the row before changes (either
 * by [method@Gtk.ListBoxRow.changed] on the previous row, or when the previous
 * row becomes a different row). It is also called for all rows when
 * [method@Gtk.ListBox.invalidate_headers] is called.
 *
 * @param updateHeader callback that lets you add row headers
 * @param userData user data passed to @update_header
 * @param destroy destroy notifier for @user_data
 */
- (void)setHeaderFuncWithUpdateHeader:(GtkListBoxUpdateHeaderFunc)updateHeader userData:(gpointer)userData destroy:(GDestroyNotify)destroy;

/**
 * Sets the placeholder widget that is shown in the list when
 * it doesn't display any visible children.
 *
 * @param placeholder a `GtkWidget`
 */
- (void)setPlaceholder:(OGTKWidget*)placeholder;

/**
 * Sets how selection works in the listbox.
 *
 * @param mode The `GtkSelectionMode`
 */
- (void)setSelectionMode:(GtkSelectionMode)mode;

/**
 * Sets whether the list box should show separators
 * between rows.
 *
 * @param showSeparators %TRUE to show separators
 */
- (void)setShowSeparators:(bool)showSeparators;

/**
 * Sets a sort function.
 * 
 * By setting a sort function on the @box one can dynamically reorder
 * the rows of the list, based on the contents of the rows.
 * 
 * The @sort_func will be called for each row after the call, and will
 * continue to be called each time a row changes (via
 * [method@Gtk.ListBoxRow.changed]) and when [method@Gtk.ListBox.invalidate_sort]
 * is called.
 * 
 * Note that using a sort function is incompatible with using a model
 * (see [method@Gtk.ListBox.bind_model]).
 *
 * @param sortFunc the sort function
 * @param userData user data passed to @sort_func
 * @param destroy destroy notifier for @user_data
 */
- (void)setSortFuncWithSortFunc:(GtkListBoxSortFunc)sortFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy;

/**
 * Unselect all children of @box, if the selection mode allows it.
 *
 */
- (void)unselectAll;

/**
 * Unselects a single row of @box, if the selection mode allows it.
 *
 * @param row the row to unselect
 */
- (void)unselectRow:(OGTKListBoxRow*)row;

@end