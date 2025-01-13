/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKColumnViewColumn;
@class OGTKListItemFactory;
@class OGTKSorter;

/**
 * `GtkColumnView` presents a large dynamic list of items using multiple columns
 * with headers.
 * 
 * `GtkColumnView` uses the factories of its columns to generate a cell widget for
 * each column, for each visible item and displays them together as the row for
 * this item.
 * 
 * The [property@Gtk.ColumnView:show-row-separators] and
 * [property@Gtk.ColumnView:show-column-separators] properties offer a simple way
 * to display separators between the rows or columns.
 * 
 * `GtkColumnView` allows the user to select items according to the selection
 * characteristics of the model. For models that allow multiple selected items,
 * it is possible to turn on *rubberband selection*, using
 * [property@Gtk.ColumnView:enable-rubberband].
 * 
 * The column view supports sorting that can be customized by the user by
 * clicking on column headers. To set this up, the `GtkSorter` returned by
 * [method@Gtk.ColumnView.get_sorter] must be attached to a sort model for the
 * data that the view is showing, and the columns must have sorters attached to
 * them by calling [method@Gtk.ColumnViewColumn.set_sorter]. The initial sort
 * order can be set with [method@Gtk.ColumnView.sort_by_column].
 * 
 * The column view also supports interactive resizing and reordering of
 * columns, via Drag-and-Drop of the column headers. This can be enabled or
 * disabled with the [property@Gtk.ColumnView:reorderable] and
 * [property@Gtk.ColumnViewColumn:resizable] properties.
 * 
 * To learn more about the list widget framework, see the
 * [overview](section-list-widget.html).
 * 
 * # CSS nodes
 * 
 * ```
 * columnview[.column-separators][.rich-list][.navigation-sidebar][.data-table]
 * ├── header
 * │   ├── <column header>
 * ┊   ┊
 * │   ╰── <column header>
 * │
 * ├── listview
 * │
 * ┊
 * ╰── [rubberband]
 * ```
 * 
 * `GtkColumnView` uses a single CSS node named columnview. It may carry the
 * .column-separators style class, when [property@Gtk.ColumnView:show-column-separators]
 * property is set. Header widgets appear below a node with name header.
 * The rows are contained in a `GtkListView` widget, so there is a listview
 * node with the same structure as for a standalone `GtkListView` widget.
 * If [property@Gtk.ColumnView:show-row-separators] is set, it will be passed
 * on to the list view, causing its CSS node to carry the .separators style class.
 * For rubberband selection, a node with name rubberband is used.
 * 
 * The main columnview node may also carry style classes to select
 * the style of [list presentation](section-list-widget.html#list-styles):
 * .rich-list, .navigation-sidebar or .data-table.
 * 
 * # Accessibility
 * 
 * `GtkColumnView` uses the %GTK_ACCESSIBLE_ROLE_TREE_GRID role, header title
 * widgets are using the %GTK_ACCESSIBLE_ROLE_COLUMN_HEADER role. The row widgets
 * are using the %GTK_ACCESSIBLE_ROLE_ROW role, and individual cells are using
 * the %GTK_ACCESSIBLE_ROLE_GRID_CELL role
 *
 */
@interface OGTKColumnView : OGTKWidget
{

}


/**
 * Constructors
 */
+ (instancetype)columnViewWithModel:(GtkSelectionModel*)model;

/**
 * Methods
 */

- (GtkColumnView*)castedGObject;

/**
 * Appends the @column to the end of the columns in @self.
 *
 * @param column a `GtkColumnViewColumn` that hasn't been added to a
 *   `GtkColumnView` yet
 */
- (void)appendColumn:(OGTKColumnViewColumn*)column;

/**
 * Gets the list of columns in this column view.
 * 
 * This list is constant over the lifetime of @self and can be used to
 * monitor changes to the columns of @self by connecting to the
 * ::items-changed signal.
 *
 * @return The list managing the columns
 */
- (GListModel*)columns;

/**
 * Returns whether rows can be selected by dragging with the mouse.
 *
 * @return %TRUE if rubberband selection is enabled
 */
- (bool)enableRubberband;

/**
 * Gets the factory that's currently used to populate section headers.
 *
 * @return The factory in use
 */
- (OGTKListItemFactory*)headerFactory;

/**
 * Gets the model that's currently used to read the items displayed.
 *
 * @return The model in use
 */
- (GtkSelectionModel*)model;

/**
 * Returns whether columns are reorderable.
 *
 * @return %TRUE if columns are reorderable
 */
- (bool)reorderable;

/**
 * Gets the factory set via [method@Gtk.ColumnView.set_row_factory].
 *
 * @return The factory
 */
- (OGTKListItemFactory*)rowFactory;

/**
 * Returns whether the list should show separators
 * between columns.
 *
 * @return %TRUE if the list shows column separators
 */
- (bool)showColumnSeparators;

/**
 * Returns whether the list should show separators
 * between rows.
 *
 * @return %TRUE if the list shows separators
 */
- (bool)showRowSeparators;

/**
 * Returns whether rows will be activated on single click and
 * selected on hover.
 *
 * @return %TRUE if rows are activated on single click
 */
- (bool)singleClickActivate;

/**
 * Returns a special sorter that reflects the users sorting
 * choices in the column view.
 * 
 * To allow users to customizable sorting by clicking on column
 * headers, this sorter needs to be set on the sort model underneath
 * the model that is displayed by the view.
 * 
 * See [method@Gtk.ColumnViewColumn.set_sorter] for setting up
 * per-column sorting.
 * 
 * Here is an example:
 * ```c
 * gtk_column_view_column_set_sorter (column, sorter);
 * gtk_column_view_append_column (view, column);
 * sorter = g_object_ref (gtk_column_view_get_sorter (view)));
 * model = gtk_sort_list_model_new (store, sorter);
 * selection = gtk_no_selection_new (model);
 * gtk_column_view_set_model (view, selection);
 * ```
 *
 * @return the `GtkSorter` of @self
 */
- (OGTKSorter*)sorter;

/**
 * Gets the behavior set for the <kbd>Tab</kbd> key.
 *
 * @return The behavior of the <kbd>Tab</kbd> key
 */
- (GtkListTabBehavior)tabBehavior;

/**
 * Inserts a column at the given position in the columns of @self.
 * 
 * If @column is already a column of @self, it will be repositioned.
 *
 * @param position the position to insert @column at
 * @param column the `GtkColumnViewColumn` to insert
 */
- (void)insertColumnWithPosition:(guint)position column:(OGTKColumnViewColumn*)column;

/**
 * Removes the @column from the list of columns of @self.
 *
 * @param column a `GtkColumnViewColumn` that's part of @self
 */
- (void)removeColumn:(OGTKColumnViewColumn*)column;

/**
 * Scroll to the row at the given position - or cell if a column is
 * given - and performs the actions specified in @flags.
 * 
 * This function works no matter if the listview is shown or focused.
 * If it isn't, then the changes will take effect once that happens.
 *
 * @param pos position of the item
 * @param column The column to scroll to
 *   or %NULL to not scroll columns.
 * @param flags actions to perform
 * @param scroll details of how to perform
 *   the scroll operation or %NULL to scroll into view
 */
- (void)scrollToWithPos:(guint)pos column:(OGTKColumnViewColumn*)column flags:(GtkListScrollFlags)flags scroll:(GtkScrollInfo*)scroll;

/**
 * Sets whether selections can be changed by dragging with the mouse.
 *
 * @param enableRubberband %TRUE to enable rubberband selection
 */
- (void)setEnableRubberband:(bool)enableRubberband;

/**
 * Sets the `GtkListItemFactory` to use for populating the
 * [class@Gtk.ListHeader] objects used in section headers.
 * 
 * If this factory is set to %NULL, the list will not show
 * section headers.
 *
 * @param factory the factory to use
 */
- (void)setHeaderFactory:(OGTKListItemFactory*)factory;

/**
 * Sets the model to use.
 * 
 * This must be a [iface@Gtk.SelectionModel].
 *
 * @param model the model to use
 */
- (void)setModel:(GtkSelectionModel*)model;

/**
 * Sets whether columns should be reorderable by dragging.
 *
 * @param reorderable whether columns should be reorderable
 */
- (void)setReorderable:(bool)reorderable;

/**
 * Sets the factory used for configuring rows. The factory must be for configuring
 * [class@Gtk.ColumnViewRow] objects.
 * 
 * If this factory is not set - which is the default - then the defaults will be used.
 * 
 * This factory is not used to set the widgets displayed in the individual cells. For
 * that see [method@GtkColumnViewColumn.set_factory] and [class@GtkColumnViewCell].
 *
 * @param factory The row factory
 */
- (void)setRowFactory:(OGTKListItemFactory*)factory;

/**
 * Sets whether the list should show separators
 * between columns.
 *
 * @param showColumnSeparators %TRUE to show column separators
 */
- (void)setShowColumnSeparators:(bool)showColumnSeparators;

/**
 * Sets whether the list should show separators
 * between rows.
 *
 * @param showRowSeparators %TRUE to show row separators
 */
- (void)setShowRowSeparators:(bool)showRowSeparators;

/**
 * Sets whether rows should be activated on single click and
 * selected on hover.
 *
 * @param singleClickActivate %TRUE to activate items on single click
 */
- (void)setSingleClickActivate:(bool)singleClickActivate;

/**
 * Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys.
 *
 * @param tabBehavior The desired tab behavior
 */
- (void)setTabBehavior:(GtkListTabBehavior)tabBehavior;

/**
 * Sets the sorting of the view.
 * 
 * This function should be used to set up the initial sorting.
 * At runtime, users can change the sorting of a column view
 * by clicking on the list headers.
 * 
 * This call only has an effect if the sorter returned by
 * [method@Gtk.ColumnView.get_sorter] is set on a sort model,
 * and [method@Gtk.ColumnViewColumn.set_sorter] has been called
 * on @column to associate a sorter with the column.
 * 
 * If @column is %NULL, the view will be unsorted.
 *
 * @param column the `GtkColumnViewColumn` to sort by
 * @param direction the direction to sort in
 */
- (void)sortByColumn:(OGTKColumnViewColumn*)column direction:(GtkSortType)direction;

@end