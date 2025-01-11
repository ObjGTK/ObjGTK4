/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKCellRenderer;
@class OGTKTooltip;
@class OGTKTreeSelection;
@class OGTKTreeViewColumn;

/**
 * A widget for displaying both trees and lists
 * 
 * Widget that displays any object that implements the [iface@Gtk.TreeModel] interface.
 * 
 * Please refer to the [tree widget conceptual overview](section-tree-widget.html)
 * for an overview of all the objects and data types related to the tree
 * widget and how they work together.
 * 
 * ## Coordinate systems in GtkTreeView API
 * 
 * Several different coordinate systems are exposed in the `GtkTreeView` API.
 * These are:
 * 
 * ![](tree-view-coordinates.png)
 * 
 * - Widget coordinates: Coordinates relative to the widget (usually `widget->window`).
 * 
 * - Bin window coordinates: Coordinates relative to the window that GtkTreeView renders to.
 * 
 * - Tree coordinates: Coordinates relative to the entire scrollable area of GtkTreeView. These
 *   coordinates start at (0, 0) for row 0 of the tree.
 * 
 * Several functions are available for converting between the different
 * coordinate systems.  The most common translations are between widget and bin
 * window coordinates and between bin window and tree coordinates. For the
 * former you can use [method@Gtk.TreeView.convert_widget_to_bin_window_coords]
 * (and vice versa), for the latter [method@Gtk.TreeView.convert_bin_window_to_tree_coords]
 * (and vice versa).
 * 
 * ## `GtkTreeView` as `GtkBuildable`
 * 
 * The `GtkTreeView` implementation of the `GtkBuildable` interface accepts
 * [class@Gtk.TreeViewColumn] objects as `<child>` elements and exposes the
 * internal [class@Gtk.TreeSelection] in UI definitions.
 * 
 * An example of a UI definition fragment with `GtkTreeView`:
 * 
 * ```xml
 * <object class="GtkTreeView" id="treeview">
 *   <property name="model">liststore1</property>
 *   <child>
 *     <object class="GtkTreeViewColumn" id="test-column">
 *       <property name="title">Test</property>
 *       <child>
 *         <object class="GtkCellRendererText" id="test-renderer"/>
 *         <attributes>
 *           <attribute name="text">1</attribute>
 *         </attributes>
 *       </child>
 *     </object>
 *   </child>
 *   <child internal-child="selection">
 *     <object class="GtkTreeSelection" id="selection">
 *       <signal name="changed" handler="on_treeview_selection_changed"/>
 *     </object>
 *   </child>
 * </object>
 * ```
 * 
 * ## CSS nodes
 * 
 * ```
 * treeview.view
 * ├── header
 * │   ├── button
 * │   │   ╰── [sort-indicator]
 * ┊   ┊
 * │   ╰── button
 * │       ╰── [sort-indicator]
 * │
 * ├── [rubberband]
 * ╰── [dndtarget]
 * ```
 * 
 * `GtkTreeView` has a main CSS node with name `treeview` and style class `.view`.
 * It has a subnode with name `header`, which is the parent for all the column
 * header widgets' CSS nodes.
 * 
 * Each column header consists of a `button`, which among other content, has a
 * child with name `sort-indicator`, which carries the `.ascending` or `.descending`
 * style classes when the column header should show a sort indicator. The CSS
 * is expected to provide a suitable image using the `-gtk-icon-source` property.
 * 
 * For rubberband selection, a subnode with name `rubberband` is used.
 * 
 * For the drop target location during DND, a subnode with name `dndtarget` is used.
 *
 */
@interface OGTKTreeView : OGTKWidget
{

}


/**
 * Constructors
 */
+ (instancetype)treeView;
+ (instancetype)treeViewWithModel:(GtkTreeModel*)model;

/**
 * Methods
 */

- (GtkTreeView*)castedGObject;

/**
 * Appends @column to the list of columns. If @tree_view has “fixed_height”
 * mode enabled, then @column must have its “sizing” property set to be
 * GTK_TREE_VIEW_COLUMN_FIXED.
 *
 * @param column The `GtkTreeViewColumn` to add.
 * @return The number of columns in @tree_view after appending.
 */
- (int)appendColumn:(OGTKTreeViewColumn*)column;

/**
 * Recursively collapses all visible, expanded nodes in @tree_view.
 *
 */
- (void)collapseAll;

/**
 * Collapses a row (hides its child rows, if they exist).
 *
 * @param path path to a row in the @tree_view
 * @return %TRUE if the row was collapsed.
 */
- (bool)collapseRow:(GtkTreePath*)path;

/**
 * Resizes all columns to their optimal width. Only works after the
 * treeview has been realized.
 *
 */
- (void)columnsAutosize;

/**
 * Converts bin_window coordinates to coordinates for the
 * tree (the full scrollable area of the tree).
 *
 * @param bx X coordinate relative to bin_window
 * @param by Y coordinate relative to bin_window
 * @param tx return location for tree X coordinate
 * @param ty return location for tree Y coordinate
 */
- (void)convertBinWindowToTreeCoordsWithBx:(int)bx by:(int)by tx:(int*)tx ty:(int*)ty;

/**
 * Converts bin_window coordinates to widget relative coordinates.
 *
 * @param bx bin_window X coordinate
 * @param by bin_window Y coordinate
 * @param wx return location for widget X coordinate
 * @param wy return location for widget Y coordinate
 */
- (void)convertBinWindowToWidgetCoordsWithBx:(int)bx by:(int)by wx:(int*)wx wy:(int*)wy;

/**
 * Converts tree coordinates (coordinates in full scrollable area of the tree)
 * to bin_window coordinates.
 *
 * @param tx tree X coordinate
 * @param ty tree Y coordinate
 * @param bx return location for X coordinate relative to bin_window
 * @param by return location for Y coordinate relative to bin_window
 */
- (void)convertTreeToBinWindowCoordsWithTx:(int)tx ty:(int)ty bx:(int*)bx by:(int*)by;

/**
 * Converts tree coordinates (coordinates in full scrollable area of the tree)
 * to widget coordinates.
 *
 * @param tx X coordinate relative to the tree
 * @param ty Y coordinate relative to the tree
 * @param wx return location for widget X coordinate
 * @param wy return location for widget Y coordinate
 */
- (void)convertTreeToWidgetCoordsWithTx:(int)tx ty:(int)ty wx:(int*)wx wy:(int*)wy;

/**
 * Converts widget coordinates to coordinates for the bin_window.
 *
 * @param wx X coordinate relative to the widget
 * @param wy Y coordinate relative to the widget
 * @param bx return location for bin_window X coordinate
 * @param by return location for bin_window Y coordinate
 */
- (void)convertWidgetToBinWindowCoordsWithWx:(int)wx wy:(int)wy bx:(int*)bx by:(int*)by;

/**
 * Converts widget coordinates to coordinates for the
 * tree (the full scrollable area of the tree).
 *
 * @param wx X coordinate relative to the widget
 * @param wy Y coordinate relative to the widget
 * @param tx return location for tree X coordinate
 * @param ty return location for tree Y coordinate
 */
- (void)convertWidgetToTreeCoordsWithWx:(int)wx wy:(int)wy tx:(int*)tx ty:(int*)ty;

/**
 * Creates a `cairo_surface_t` representation of the row at @path.
 * This image is used for a drag icon.
 *
 * @param path a `GtkTreePath` in @tree_view
 * @return a newly-allocated surface of the drag icon.
 */
- (GdkPaintable*)createRowDragIcon:(GtkTreePath*)path;

/**
 * Turns @tree_view into a drop destination for automatic DND. Calling
 * this method sets `GtkTreeView`:reorderable to %FALSE.
 *
 * @param formats the target formats that the drag will support
 * @param actions the bitmask of possible actions for a drag from this
 *    widget
 */
- (void)enableModelDragDestWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions;

/**
 * Turns @tree_view into a drag source for automatic DND. Calling this
 * method sets `GtkTreeView`:reorderable to %FALSE.
 *
 * @param startButtonMask Mask of allowed buttons to start drag
 * @param formats the target formats that the drag will support
 * @param actions the bitmask of possible actions for a drag from this
 *    widget
 */
- (void)enableModelDragSourceWithStartButtonMask:(GdkModifierType)startButtonMask formats:(GdkContentFormats*)formats actions:(GdkDragAction)actions;

/**
 * Recursively expands all nodes in the @tree_view.
 *
 */
- (void)expandAll;

/**
 * Opens the row so its children are visible.
 *
 * @param path path to a row
 * @param openAll whether to recursively expand, or just expand immediate children
 * @return %TRUE if the row existed and had children
 */
- (bool)expandRowWithPath:(GtkTreePath*)path openAll:(bool)openAll;

/**
 * Expands the row at @path. This will also expand all parent rows of
 * @path as necessary.
 *
 * @param path path to a row.
 */
- (void)expandToPath:(GtkTreePath*)path;

/**
 * Gets the setting set by gtk_tree_view_set_activate_on_single_click().
 *
 * @return %TRUE if row-activated will be emitted on a single click
 */
- (bool)activateOnSingleClick;

/**
 * Fills the bounding rectangle in bin_window coordinates for the cell at the
 * row specified by @path and the column specified by @column.  If @path is
 * %NULL, or points to a node not found in the tree, the @y and @height fields of
 * the rectangle will be filled with 0. If @column is %NULL, the @x and @width
 * fields will be filled with 0.  The returned rectangle is equivalent to the
 * @background_area passed to gtk_cell_renderer_render().  These background
 * areas tile to cover the entire bin window.  Contrast with the @cell_area,
 * returned by gtk_tree_view_get_cell_area(), which returns only the cell
 * itself, excluding surrounding borders and the tree expander area.
 *
 * @param path a `GtkTreePath` for the row, or %NULL to get only horizontal coordinates
 * @param column a `GtkTreeViewColumn` for the column, or %NULL to get only vertical coordinates
 * @param rect rectangle to fill with cell background rect
 */
- (void)backgroundAreaWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column rect:(GdkRectangle*)rect;

/**
 * Fills the bounding rectangle in bin_window coordinates for the cell at the
 * row specified by @path and the column specified by @column.  If @path is
 * %NULL, or points to a path not currently displayed, the @y and @height fields
 * of the rectangle will be filled with 0. If @column is %NULL, the @x and @width
 * fields will be filled with 0.  The sum of all cell rects does not cover the
 * entire tree; there are extra pixels in between rows, for example. The
 * returned rectangle is equivalent to the @cell_area passed to
 * gtk_cell_renderer_render().  This function is only valid if @tree_view is
 * realized.
 *
 * @param path a `GtkTreePath` for the row, or %NULL to get only horizontal coordinates
 * @param column a `GtkTreeViewColumn` for the column, or %NULL to get only vertical coordinates
 * @param rect rectangle to fill with cell rect
 */
- (void)cellAreaWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column rect:(GdkRectangle*)rect;

/**
 * Gets the `GtkTreeViewColumn` at the given position in the #tree_view.
 *
 * @param n The position of the column, counting from 0.
 * @return The `GtkTreeViewColumn`, or %NULL if the
 * position is outside the range of columns.
 */
- (OGTKTreeViewColumn*)column:(int)n;

/**
 * Returns a `GList` of all the `GtkTreeViewColumn`s currently in @tree_view.
 * The returned list must be freed with g_list_free ().
 *
 * @return A list of `GtkTreeViewColumn`s
 */
- (GList*)columns;

/**
 * Fills in @path and @focus_column with the current path and focus column.  If
 * the cursor isn’t currently set, then *@path will be %NULL.  If no column
 * currently has focus, then *@focus_column will be %NULL.
 * 
 * The returned `GtkTreePath` must be freed with gtk_tree_path_free() when
 * you are done with it.
 *
 * @param path A pointer to be
 *   filled with the current cursor path
 * @param focusColumn A
 *   pointer to be filled with the current focus column
 */
- (void)cursorWithPath:(GtkTreePath**)path focusColumn:(GtkTreeViewColumn**)focusColumn;

/**
 * Determines the destination row for a given position.  @drag_x and
 * @drag_y are expected to be in widget coordinates.  This function is only
 * meaningful if @tree_view is realized.  Therefore this function will always
 * return %FALSE if @tree_view is not realized or does not have a model.
 *
 * @param dragX the position to determine the destination row for
 * @param dragY the position to determine the destination row for
 * @param path Return location for the path of
 *   the highlighted row
 * @param pos Return location for the drop position, or
 *   %NULL
 * @return whether there is a row at the given position, %TRUE if this
 * is indeed the case.
 */
- (bool)destRowAtPosWithDragX:(int)dragX dragY:(int)dragY path:(GtkTreePath**)path pos:(GtkTreeViewDropPosition*)pos;

/**
 * Gets information about the row that is highlighted for feedback.
 *
 * @param path Return location for the path of the highlighted row
 * @param pos Return location for the drop position
 */
- (void)dragDestRowWithPath:(GtkTreePath**)path pos:(GtkTreeViewDropPosition*)pos;

/**
 * Returns whether or not the tree allows to start interactive searching
 * by typing in text.
 *
 * @return whether or not to let the user search interactively
 */
- (bool)enableSearch;

/**
 * Returns whether or not tree lines are drawn in @tree_view.
 *
 * @return %TRUE if tree lines are drawn in @tree_view, %FALSE
 * otherwise.
 */
- (bool)enableTreeLines;

/**
 * Returns the column that is the current expander column,
 * or %NULL if none has been set.
 * This column has the expander arrow drawn next to it.
 *
 * @return The expander column.
 */
- (OGTKTreeViewColumn*)expanderColumn;

/**
 * Returns whether fixed height mode is turned on for @tree_view.
 *
 * @return %TRUE if @tree_view is in fixed height mode
 */
- (bool)fixedHeightMode;

/**
 * Returns which grid lines are enabled in @tree_view.
 *
 * @return a `GtkTreeView`GridLines value indicating which grid lines
 * are enabled.
 */
- (GtkTreeViewGridLines)gridLines;

/**
 * Returns whether all header columns are clickable.
 *
 * @return %TRUE if all header columns are clickable, otherwise %FALSE
 */
- (bool)headersClickable;

/**
 * Returns %TRUE if the headers on the @tree_view are visible.
 *
 * @return Whether the headers are visible or not.
 */
- (bool)headersVisible;

/**
 * Returns whether hover expansion mode is turned on for @tree_view.
 *
 * @return %TRUE if @tree_view is in hover expansion mode
 */
- (bool)hoverExpand;

/**
 * Returns whether hover selection mode is turned on for @tree_view.
 *
 * @return %TRUE if @tree_view is in hover selection mode
 */
- (bool)hoverSelection;

/**
 * Returns the amount, in pixels, of extra indentation for child levels
 * in @tree_view.
 *
 * @return the amount of extra indentation for child levels in
 * @tree_view.  A return value of 0 means that this feature is disabled.
 */
- (int)levelIndentation;

/**
 * Returns the model the `GtkTreeView` is based on.  Returns %NULL if the
 * model is unset.
 *
 * @return A `GtkTreeModel`
 */
- (GtkTreeModel*)model;

/**
 * Queries the number of columns in the given @tree_view.
 *
 * @return The number of columns in the @tree_view
 */
- (guint)ncolumns;

/**
 * Finds the path at the point (@x, @y), relative to bin_window coordinates.
 * That is, @x and @y are relative to an events coordinates. Widget-relative
 * coordinates must be converted using
 * gtk_tree_view_convert_widget_to_bin_window_coords(). It is primarily for
 * things like popup menus. If @path is non-%NULL, then it will be filled
 * with the `GtkTreePath` at that point.  This path should be freed with
 * gtk_tree_path_free().  If @column is non-%NULL, then it will be filled
 * with the column at that point.  @cell_x and @cell_y return the coordinates
 * relative to the cell background (i.e. the @background_area passed to
 * gtk_cell_renderer_render()).  This function is only meaningful if
 * @tree_view is realized.  Therefore this function will always return %FALSE
 * if @tree_view is not realized or does not have a model.
 * 
 * For converting widget coordinates (eg. the ones you get from
 * GtkWidget::query-tooltip), please see
 * gtk_tree_view_convert_widget_to_bin_window_coords().
 *
 * @param x The x position to be identified (relative to bin_window).
 * @param y The y position to be identified (relative to bin_window).
 * @param path A pointer to a `GtkTreePath`
 *   pointer to be filled in
 * @param column A pointer to
 *   a `GtkTreeViewColumn` pointer to be filled in
 * @param cellX A pointer where the X coordinate
 *   relative to the cell can be placed
 * @param cellY A pointer where the Y coordinate
 *   relative to the cell can be placed
 * @return %TRUE if a row exists at that coordinate.
 */
- (bool)pathAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path column:(GtkTreeViewColumn**)column cellX:(int*)cellX cellY:(int*)cellY;

/**
 * Retrieves whether the user can reorder the tree via drag-and-drop. See
 * gtk_tree_view_set_reorderable().
 *
 * @return %TRUE if the tree can be reordered.
 */
- (bool)reorderable;

/**
 * Returns the current row separator function.
 *
 * @return the current row separator function.
 */
- (GtkTreeViewRowSeparatorFunc)rowSeparatorFunc;

/**
 * Returns whether rubber banding is turned on for @tree_view.  If the
 * selection mode is %GTK_SELECTION_MULTIPLE, rubber banding will allow the
 * user to select multiple rows by dragging the mouse.
 *
 * @return %TRUE if rubber banding in @tree_view is enabled.
 */
- (bool)rubberBanding;

/**
 * Gets the column searched on by the interactive search code.
 *
 * @return the column the interactive search code searches in.
 */
- (int)searchColumn;

/**
 * Returns the `GtkEntry` which is currently in use as interactive search
 * entry for @tree_view.  In case the built-in entry is being used, %NULL
 * will be returned.
 *
 * @return the entry currently in use as search entry.
 */
- (GtkEditable*)searchEntry;

/**
 * Returns the compare function currently in use.
 *
 * @return the currently used compare function for the search code.
 */
- (GtkTreeViewSearchEqualFunc)searchEqualFunc;

/**
 * Gets the `GtkTreeSelection` associated with @tree_view.
 *
 * @return A `GtkTreeSelection` object.
 */
- (OGTKTreeSelection*)selection;

/**
 * Returns whether or not expanders are drawn in @tree_view.
 *
 * @return %TRUE if expanders are drawn in @tree_view, %FALSE
 * otherwise.
 */
- (bool)showExpanders;

/**
 * Returns the column of @tree_view’s model which is being used for
 * displaying tooltips on @tree_view’s rows.
 *
 * @return the index of the tooltip column that is currently being
 * used, or -1 if this is disabled.
 */
- (int)tooltipColumn;

/**
 * This function is supposed to be used in a ::query-tooltip
 * signal handler for `GtkTreeView`. The @x, @y and @keyboard_tip values
 * which are received in the signal handler, should be passed to this
 * function without modification.
 * 
 * The return value indicates whether there is a tree view row at the given
 * coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
 * tooltips the row returned will be the cursor row. When %TRUE, then any of
 * @model, @path and @iter which have been provided will be set to point to
 * that row and the corresponding model. @x and @y will always be converted
 * to be relative to @tree_view’s bin_window if @keyboard_tooltip is %FALSE.
 *
 * @param x the x coordinate (relative to widget coordinates)
 * @param y the y coordinate (relative to widget coordinates)
 * @param keyboardTip whether this is a keyboard tooltip or not
 * @param model a pointer to
 *   receive a `GtkTreeModel`
 * @param path a pointer to receive a `GtkTreePath`
 * @param iter a pointer to receive a `GtkTreeIter`
 * @return whether or not the given tooltip context points to a row
 */
- (bool)tooltipContextWithX:(int)x y:(int)y keyboardTip:(bool)keyboardTip model:(GtkTreeModel**)model path:(GtkTreePath**)path iter:(GtkTreeIter*)iter;

/**
 * Sets @start_path and @end_path to be the first and last visible path.
 * Note that there may be invisible paths in between.
 * 
 * The paths should be freed with gtk_tree_path_free() after use.
 *
 * @param startPath Return location for start of region
 * @param endPath Return location for end of region
 * @return %TRUE, if valid paths were placed in @start_path and @end_path.
 */
- (bool)visibleRangeWithStartPath:(GtkTreePath**)startPath endPath:(GtkTreePath**)endPath;

/**
 * Fills @visible_rect with the currently-visible region of the
 * buffer, in tree coordinates. Convert to bin_window coordinates with
 * gtk_tree_view_convert_tree_to_bin_window_coords().
 * Tree coordinates start at 0,0 for row 0 of the tree, and cover the entire
 * scrollable area of the tree.
 *
 * @param visibleRect rectangle to fill
 */
- (void)visibleRect:(GdkRectangle*)visibleRect;

/**
 * This inserts the @column into the @tree_view at @position.  If @position is
 * -1, then the column is inserted at the end. If @tree_view has
 * “fixed_height” mode enabled, then @column must have its “sizing” property
 * set to be GTK_TREE_VIEW_COLUMN_FIXED.
 *
 * @param column The `GtkTreeViewColumn` to be inserted.
 * @param position The position to insert @column in.
 * @return The number of columns in @tree_view after insertion.
 */
- (int)insertColumnWithColumn:(OGTKTreeViewColumn*)column position:(int)position;

/**
 * Convenience function that inserts a new column into the `GtkTreeView`
 * with the given cell renderer and a `GtkTreeCellDataFunc` to set cell renderer
 * attributes (normally using data from the model). See also
 * gtk_tree_view_column_set_cell_data_func(), gtk_tree_view_column_pack_start().
 * If @tree_view has “fixed_height” mode enabled, then the new column will have its
 * “sizing” property set to be GTK_TREE_VIEW_COLUMN_FIXED.
 *
 * @param position Position to insert, -1 for append
 * @param title column title
 * @param cell cell renderer for column
 * @param func function to set attributes of cell renderer
 * @param data data for @func
 * @param dnotify destroy notifier for @data
 * @return number of columns in the tree view post-insert
 */
- (int)insertColumnWithDataFuncWithPosition:(int)position title:(OFString*)title cell:(OGTKCellRenderer*)cell func:(GtkTreeCellDataFunc)func data:(gpointer)data dnotify:(GDestroyNotify)dnotify;

/**
 * Determine whether the point (@x, @y) in @tree_view is blank, that is no
 * cell content nor an expander arrow is drawn at the location. If so, the
 * location can be considered as the background. You might wish to take
 * special action on clicks on the background, such as clearing a current
 * selection, having a custom context menu or starting rubber banding.
 * 
 * The @x and @y coordinate that are provided must be relative to bin_window
 * coordinates.  Widget-relative coordinates must be converted using
 * gtk_tree_view_convert_widget_to_bin_window_coords().
 * 
 * For converting widget coordinates (eg. the ones you get from
 * GtkWidget::query-tooltip), please see
 * gtk_tree_view_convert_widget_to_bin_window_coords().
 * 
 * The @path, @column, @cell_x and @cell_y arguments will be filled in
 * likewise as for gtk_tree_view_get_path_at_pos().  Please see
 * gtk_tree_view_get_path_at_pos() for more information.
 *
 * @param x The x position to be identified (relative to bin_window)
 * @param y The y position to be identified (relative to bin_window)
 * @param path A pointer to a `GtkTreePath` pointer to
 *   be filled in
 * @param column A pointer to a
 *   `GtkTreeViewColumn` pointer to be filled in
 * @param cellX A pointer where the X coordinate relative to the
 *   cell can be placed
 * @param cellY A pointer where the Y coordinate relative to the
 *   cell can be placed
 * @return %TRUE if the area at the given coordinates is blank,
 * %FALSE otherwise.
 */
- (bool)isBlankAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path column:(GtkTreeViewColumn**)column cellX:(int*)cellX cellY:(int*)cellY;

/**
 * Returns whether a rubber banding operation is currently being done
 * in @tree_view.
 *
 * @return %TRUE if a rubber banding operation is currently being
 * done in @tree_view.
 */
- (bool)isRubberBandingActive;

/**
 * Calls @func on all expanded rows.
 *
 * @param func A function to be called
 * @param data User data to be passed to the function.
 */
- (void)mapExpandedRowsWithFunc:(GtkTreeViewMappingFunc)func data:(gpointer)data;

/**
 * Moves @column to be after to @base_column.  If @base_column is %NULL, then
 * @column is placed in the first position.
 *
 * @param column The `GtkTreeViewColumn` to be moved.
 * @param baseColumn The `GtkTreeViewColumn` to be moved relative to
 */
- (void)moveColumnAfterWithColumn:(OGTKTreeViewColumn*)column baseColumn:(OGTKTreeViewColumn*)baseColumn;

/**
 * Removes @column from @tree_view.
 *
 * @param column The `GtkTreeViewColumn` to remove.
 * @return The number of columns in @tree_view after removing.
 */
- (int)removeColumn:(OGTKTreeViewColumn*)column;

/**
 * Activates the cell determined by @path and @column.
 *
 * @param path The `GtkTreePath` to be activated.
 * @param column The `GtkTreeViewColumn` to be activated.
 */
- (void)rowActivatedWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column;

/**
 * Returns %TRUE if the node pointed to by @path is expanded in @tree_view.
 *
 * @param path A `GtkTreePath` to test expansion state.
 * @return %TRUE if #path is expanded.
 */
- (bool)rowExpanded:(GtkTreePath*)path;

/**
 * Moves the alignments of @tree_view to the position specified by @column and
 * @path.  If @column is %NULL, then no horizontal scrolling occurs.  Likewise,
 * if @path is %NULL no vertical scrolling occurs.  At a minimum, one of @column
 * or @path need to be non-%NULL.  @row_align determines where the row is
 * placed, and @col_align determines where @column is placed.  Both are expected
 * to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means
 * right/bottom alignment, 0.5 means center.
 * 
 * If @use_align is %FALSE, then the alignment arguments are ignored, and the
 * tree does the minimum amount of work to scroll the cell onto the screen.
 * This means that the cell will be scrolled to the edge closest to its current
 * position.  If the cell is currently visible on the screen, nothing is done.
 * 
 * This function only works if the model is set, and @path is a valid row on the
 * model.  If the model changes before the @tree_view is realized, the centered
 * path will be modified to reflect this change.
 *
 * @param path The path of the row to move to
 * @param column The `GtkTreeViewColumn` to move horizontally to
 * @param useAlign whether to use alignment arguments, or %FALSE.
 * @param rowAlign The vertical alignment of the row specified by @path.
 * @param colAlign The horizontal alignment of the column specified by @column.
 */
- (void)scrollToCellWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column useAlign:(bool)useAlign rowAlign:(float)rowAlign colAlign:(float)colAlign;

/**
 * Scrolls the tree view such that the top-left corner of the visible
 * area is @tree_x, @tree_y, where @tree_x and @tree_y are specified
 * in tree coordinates.  The @tree_view must be realized before
 * this function is called.  If it isn't, you probably want to be
 * using gtk_tree_view_scroll_to_cell().
 * 
 * If either @tree_x or @tree_y are -1, then that direction isn’t scrolled.
 *
 * @param treeX X coordinate of new top-left pixel of visible area, or -1
 * @param treeY Y coordinate of new top-left pixel of visible area, or -1
 */
- (void)scrollToPointWithTreeX:(int)treeX treeY:(int)treeY;

/**
 * Cause the `GtkTreeView`::row-activated signal to be emitted
 * on a single click instead of a double click.
 *
 * @param single %TRUE to emit row-activated on a single click
 */
- (void)setActivateOnSingleClick:(bool)single;

/**
 * Sets a user function for determining where a column may be dropped when
 * dragged.  This function is called on every column pair in turn at the
 * beginning of a column drag to determine where a drop can take place.  The
 * arguments passed to @func are: the @tree_view, the `GtkTreeViewColumn` being
 * dragged, the two `GtkTreeViewColumn`s determining the drop spot, and
 * @user_data.  If either of the `GtkTreeViewColumn` arguments for the drop spot
 * are %NULL, then they indicate an edge.  If @func is set to be %NULL, then
 * @tree_view reverts to the default behavior of allowing all columns to be
 * dropped everywhere.
 *
 * @param func A function to determine which columns are reorderable
 * @param userData User data to be passed to @func
 * @param destroy Destroy notifier for @user_data
 */
- (void)setColumnDragFunctionWithFunc:(GtkTreeViewColumnDropFunc)func userData:(gpointer)userData destroy:(GDestroyNotify)destroy;

/**
 * Sets the current keyboard focus to be at @path, and selects it.  This is
 * useful when you want to focus the user’s attention on a particular row.  If
 * @focus_column is not %NULL, then focus is given to the column specified by
 * it. Additionally, if @focus_column is specified, and @start_editing is
 * %TRUE, then editing should be started in the specified cell.
 * This function is often followed by @gtk_widget_grab_focus (@tree_view)
 * in order to give keyboard focus to the widget.  Please note that editing
 * can only happen when the widget is realized.
 * 
 * If @path is invalid for @model, the current cursor (if any) will be unset
 * and the function will return without failing.
 *
 * @param path A `GtkTreePath`
 * @param focusColumn A `GtkTreeViewColumn`
 * @param startEditing %TRUE if the specified cell should start being edited.
 */
- (void)setCursorWithPath:(GtkTreePath*)path focusColumn:(OGTKTreeViewColumn*)focusColumn startEditing:(bool)startEditing;

/**
 * Sets the current keyboard focus to be at @path, and selects it.  This is
 * useful when you want to focus the user’s attention on a particular row.  If
 * @focus_column is not %NULL, then focus is given to the column specified by
 * it. If @focus_column and @focus_cell are not %NULL, and @focus_column
 * contains 2 or more editable or activatable cells, then focus is given to
 * the cell specified by @focus_cell. Additionally, if @focus_column is
 * specified, and @start_editing is %TRUE, then editing should be started in
 * the specified cell.  This function is often followed by
 * @gtk_widget_grab_focus (@tree_view) in order to give keyboard focus to the
 * widget.  Please note that editing can only happen when the widget is
 * realized.
 * 
 * If @path is invalid for @model, the current cursor (if any) will be unset
 * and the function will return without failing.
 *
 * @param path A `GtkTreePath`
 * @param focusColumn A `GtkTreeViewColumn`
 * @param focusCell A `GtkCellRenderer`
 * @param startEditing %TRUE if the specified cell should start being edited.
 */
- (void)setCursorOnCellWithPath:(GtkTreePath*)path focusColumn:(OGTKTreeViewColumn*)focusColumn focusCell:(OGTKCellRenderer*)focusCell startEditing:(bool)startEditing;

/**
 * Sets the row that is highlighted for feedback.
 * If @path is %NULL, an existing highlight is removed.
 *
 * @param path The path of the row to highlight
 * @param pos Specifies whether to drop before, after or into the row
 */
- (void)setDragDestRowWithPath:(GtkTreePath*)path pos:(GtkTreeViewDropPosition)pos;

/**
 * If @enable_search is set, then the user can type in text to search through
 * the tree interactively (this is sometimes called "typeahead find").
 * 
 * Note that even if this is %FALSE, the user can still initiate a search
 * using the “start-interactive-search” key binding.
 *
 * @param enableSearch %TRUE, if the user can search interactively
 */
- (void)setEnableSearch:(bool)enableSearch;

/**
 * Sets whether to draw lines interconnecting the expanders in @tree_view.
 * This does not have any visible effects for lists.
 *
 * @param enabled %TRUE to enable tree line drawing, %FALSE otherwise.
 */
- (void)setEnableTreeLines:(bool)enabled;

/**
 * Sets the column to draw the expander arrow at. It must be in @tree_view.
 * If @column is %NULL, then the expander arrow is always at the first
 * visible column.
 * 
 * If you do not want expander arrow to appear in your tree, set the
 * expander column to a hidden column.
 *
 * @param column %NULL, or the column to draw the expander arrow at.
 */
- (void)setExpanderColumn:(OGTKTreeViewColumn*)column;

/**
 * Enables or disables the fixed height mode of @tree_view.
 * Fixed height mode speeds up `GtkTreeView` by assuming that all
 * rows have the same height.
 * Only enable this option if all rows are the same height and all
 * columns are of type %GTK_TREE_VIEW_COLUMN_FIXED.
 *
 * @param enable %TRUE to enable fixed height mode
 */
- (void)setFixedHeightMode:(bool)enable;

/**
 * Sets which grid lines to draw in @tree_view.
 *
 * @param gridLines a `GtkTreeView`GridLines value indicating which grid lines to
 * enable.
 */
- (void)setGridLines:(GtkTreeViewGridLines)gridLines;

/**
 * Allow the column title buttons to be clicked.
 *
 * @param setting %TRUE if the columns are clickable.
 */
- (void)setHeadersClickable:(bool)setting;

/**
 * Sets the visibility state of the headers.
 *
 * @param headersVisible %TRUE if the headers are visible
 */
- (void)setHeadersVisible:(bool)headersVisible;

/**
 * Enables or disables the hover expansion mode of @tree_view.
 * Hover expansion makes rows expand or collapse if the pointer
 * moves over them.
 *
 * @param expand %TRUE to enable hover selection mode
 */
- (void)setHoverExpand:(bool)expand;

/**
 * Enables or disables the hover selection mode of @tree_view.
 * Hover selection makes the selected row follow the pointer.
 * Currently, this works only for the selection modes
 * %GTK_SELECTION_SINGLE and %GTK_SELECTION_BROWSE.
 *
 * @param hover %TRUE to enable hover selection mode
 */
- (void)setHoverSelection:(bool)hover;

/**
 * Sets the amount of extra indentation for child levels to use in @tree_view
 * in addition to the default indentation.  The value should be specified in
 * pixels, a value of 0 disables this feature and in this case only the default
 * indentation will be used.
 * This does not have any visible effects for lists.
 *
 * @param indentation the amount, in pixels, of extra indentation in @tree_view.
 */
- (void)setLevelIndentation:(int)indentation;

/**
 * Sets the model for a `GtkTreeView`.  If the @tree_view already has a model
 * set, it will remove it before setting the new model.  If @model is %NULL,
 * then it will unset the old model.
 *
 * @param model The model.
 */
- (void)setModel:(GtkTreeModel*)model;

/**
 * This function is a convenience function to allow you to reorder
 * models that support the `GtkTreeDragSourceIface` and the
 * `GtkTreeDragDestIface`.  Both `GtkTreeStore` and `GtkListStore` support
 * these.  If @reorderable is %TRUE, then the user can reorder the
 * model by dragging and dropping rows. The developer can listen to
 * these changes by connecting to the model’s `GtkTreeModel::row-inserted`
 * and `GtkTreeModel::row-deleted` signals. The reordering is implemented
 * by setting up the tree view as a drag source and destination.
 * Therefore, drag and drop can not be used in a reorderable view for any
 * other purpose.
 * 
 * This function does not give you any degree of control over the order -- any
 * reordering is allowed.  If more control is needed, you should probably
 * handle drag and drop manually.
 *
 * @param reorderable %TRUE, if the tree can be reordered.
 */
- (void)setReorderable:(bool)reorderable;

/**
 * Sets the row separator function, which is used to determine
 * whether a row should be drawn as a separator. If the row separator
 * function is %NULL, no separators are drawn. This is the default value.
 *
 * @param func a `GtkTreeView`RowSeparatorFunc
 * @param data user data to pass to @func
 * @param destroy destroy notifier for @data
 */
- (void)setRowSeparatorFuncWithFunc:(GtkTreeViewRowSeparatorFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy;

/**
 * Enables or disables rubber banding in @tree_view.  If the selection mode
 * is %GTK_SELECTION_MULTIPLE, rubber banding will allow the user to select
 * multiple rows by dragging the mouse.
 *
 * @param enable %TRUE to enable rubber banding
 */
- (void)setRubberBanding:(bool)enable;

/**
 * Sets @column as the column where the interactive search code should
 * search in for the current model.
 * 
 * If the search column is set, users can use the “start-interactive-search”
 * key binding to bring up search popup. The enable-search property controls
 * whether simply typing text will also start an interactive search.
 * 
 * Note that @column refers to a column of the current model. The search
 * column is reset to -1 when the model is changed.
 *
 * @param column the column of the model to search in, or -1 to disable searching
 */
- (void)setSearchColumn:(int)column;

/**
 * Sets the entry which the interactive search code will use for this
 * @tree_view.  This is useful when you want to provide a search entry
 * in our interface at all time at a fixed position.  Passing %NULL for
 * @entry will make the interactive search code use the built-in popup
 * entry again.
 *
 * @param entry the entry the interactive search code of @tree_view should use
 */
- (void)setSearchEntry:(GtkEditable*)entry;

/**
 * Sets the compare function for the interactive search capabilities; note
 * that somewhat like strcmp() returning 0 for equality
 * `GtkTreeView`SearchEqualFunc returns %FALSE on matches.
 *
 * @param searchEqualFunc the compare function to use during the search
 * @param searchUserData user data to pass to @search_equal_func
 * @param searchDestroy Destroy notifier for @search_user_data
 */
- (void)setSearchEqualFuncWithSearchEqualFunc:(GtkTreeViewSearchEqualFunc)searchEqualFunc searchUserData:(gpointer)searchUserData searchDestroy:(GDestroyNotify)searchDestroy;

/**
 * Sets whether to draw and enable expanders and indent child rows in
 * @tree_view.  When disabled there will be no expanders visible in trees
 * and there will be no way to expand and collapse rows by default.  Also
 * note that hiding the expanders will disable the default indentation.  You
 * can set a custom indentation in this case using
 * gtk_tree_view_set_level_indentation().
 * This does not have any visible effects for lists.
 *
 * @param enabled %TRUE to enable expander drawing, %FALSE otherwise.
 */
- (void)setShowExpanders:(bool)enabled;

/**
 * Sets the tip area of @tooltip to the area @path, @column and @cell have
 * in common.  For example if @path is %NULL and @column is set, the tip
 * area will be set to the full area covered by @column.  See also
 * gtk_tooltip_set_tip_area().
 * 
 * Note that if @path is not specified and @cell is set and part of a column
 * containing the expander, the tooltip might not show and hide at the correct
 * position.  In such cases @path must be set to the current node under the
 * mouse cursor for this function to operate correctly.
 * 
 * See also gtk_tree_view_set_tooltip_column() for a simpler alternative.
 *
 * @param tooltip a `GtkTooltip`
 * @param path a `GtkTreePath`
 * @param column a `GtkTreeViewColumn`
 * @param cell a `GtkCellRenderer`
 */
- (void)setTooltipCellWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column cell:(OGTKCellRenderer*)cell;

/**
 * If you only plan to have simple (text-only) tooltips on full rows, you
 * can use this function to have `GtkTreeView` handle these automatically
 * for you. @column should be set to the column in @tree_view’s model
 * containing the tooltip texts, or -1 to disable this feature.
 * 
 * When enabled, `GtkWidget:has-tooltip` will be set to %TRUE and
 * @tree_view will connect a `GtkWidget::query-tooltip` signal handler.
 * 
 * Note that the signal handler sets the text with gtk_tooltip_set_markup(),
 * so &, <, etc have to be escaped in the text.
 *
 * @param column an integer, which is a valid column number for @tree_view’s model
 */
- (void)setTooltipColumn:(int)column;

/**
 * Sets the tip area of @tooltip to be the area covered by the row at @path.
 * See also gtk_tree_view_set_tooltip_column() for a simpler alternative.
 * See also gtk_tooltip_set_tip_area().
 *
 * @param tooltip a `GtkTooltip`
 * @param path a `GtkTreePath`
 */
- (void)setTooltipRowWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path;

/**
 * Undoes the effect of
 * gtk_tree_view_enable_model_drag_dest(). Calling this method sets
 * `GtkTreeView`:reorderable to %FALSE.
 *
 */
- (void)unsetRowsDragDest;

/**
 * Undoes the effect of
 * gtk_tree_view_enable_model_drag_source(). Calling this method sets
 * `GtkTreeView`:reorderable to %FALSE.
 *
 */
- (void)unsetRowsDragSource;

@end