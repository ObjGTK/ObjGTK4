/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKCellArea;
@class OGTKCellRenderer;
@class OGTKWidget;

/**
 * A visible column in a [class@Gtk.TreeView] widget
 * 
 * The `GtkTreeViewColumn` object represents a visible column in a `GtkTreeView` widget.
 * It allows to set properties of the column header, and functions as a holding pen
 * for the cell renderers which determine how the data in the column is displayed.
 * 
 * Please refer to the [tree widget conceptual overview](section-tree-widget.html)
 * for an overview of all the objects and data types related to the tree widget and
 * how they work together, and to the [class@Gtk.TreeView] documentation for specifics
 * about the CSS node structure for treeviews and their headers.
 *
 */
@interface OGTKTreeViewColumn : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)treeViewColumn;
+ (instancetype)treeViewColumnWithArea:(OGTKCellArea*)area;

/**
 * Methods
 */

- (GtkTreeViewColumn*)castedGObject;

/**
 * Adds an attribute mapping to the list in @tree_column.
 * 
 * The @column is the
 * column of the model to get a value from, and the @attribute is the
 * parameter on @cell_renderer to be set from the value. So for example
 * if column 2 of the model contains strings, you could have the
 * “text” attribute of a `GtkCellRendererText` get its values from
 * column 2.
 *
 * @param cellRenderer the `GtkCellRenderer` to set attributes on
 * @param attribute An attribute on the renderer
 * @param column The column position on the model to get the attribute from.
 */
- (void)addAttributeWithCellRenderer:(OGTKCellRenderer*)cellRenderer attribute:(OFString*)attribute column:(int)column;

/**
 * Obtains the horizontal position and size of a cell in a column.
 * 
 * If the  cell is not found in the column, @start_pos and @width
 * are not changed and %FALSE is returned.
 *
 * @param cellRenderer a `GtkCellRenderer`
 * @param xoffset return location for the horizontal
 *   position of @cell within @tree_column
 * @param width return location for the width of @cell
 * @return %TRUE if @cell belongs to @tree_column
 */
- (bool)cellGetPositionWithCellRenderer:(OGTKCellRenderer*)cellRenderer xoffset:(int*)xoffset width:(int*)width;

/**
 * Obtains the width and height needed to render the column.  This is used
 * primarily by the `GtkTreeView`.
 *
 * @param xoffset location to return x offset of a cell relative to @cell_area
 * @param yoffset location to return y offset of a cell relative to @cell_area
 * @param width location to return width needed to render a cell
 * @param height location to return height needed to render a cell
 */
- (void)cellGetSizeWithXoffset:(int*)xoffset yoffset:(int*)yoffset width:(int*)width height:(int*)height;

/**
 * Returns %TRUE if any of the cells packed into the @tree_column are visible.
 * For this to be meaningful, you must first initialize the cells with
 * gtk_tree_view_column_cell_set_cell_data()
 *
 * @return %TRUE, if any of the cells packed into the @tree_column are currently visible
 */
- (bool)cellIsVisible;

/**
 * Sets the cell renderer based on the @tree_model and @iter.  That is, for
 * every attribute mapping in @tree_column, it will get a value from the set
 * column on the @iter, and use that value to set the attribute on the cell
 * renderer.  This is used primarily by the `GtkTreeView`.
 *
 * @param treeModel The `GtkTreeModel` to get the cell renderers attributes from.
 * @param iter The `GtkTreeIter` to get the cell renderer’s attributes from.
 * @param isExpander %TRUE, if the row has children
 * @param isExpanded %TRUE, if the row has visible children
 */
- (void)cellSetCellDataWithTreeModel:(GtkTreeModel*)treeModel iter:(GtkTreeIter*)iter isExpander:(bool)isExpander isExpanded:(bool)isExpanded;

/**
 * Unsets all the mappings on all renderers on the @tree_column.
 *
 */
- (void)clear;

/**
 * Clears all existing attributes previously set with
 * gtk_tree_view_column_set_attributes().
 *
 * @param cellRenderer a `GtkCellRenderer` to clear the attribute mapping on.
 */
- (void)clearAttributesWithCellRenderer:(OGTKCellRenderer*)cellRenderer;

/**
 * Emits the “clicked” signal on the column.  This function will only work if
 * @tree_column is clickable.
 *
 */
- (void)clicked;

/**
 * Sets the current keyboard focus to be at @cell, if the column contains
 * 2 or more editable and activatable cells.
 *
 * @param cell A `GtkCellRenderer`
 */
- (void)focusCell:(OGTKCellRenderer*)cell;

/**
 * Returns the current x alignment of @tree_column.  This value can range
 * between 0.0 and 1.0.
 *
 * @return The current alignent of @tree_column.
 */
- (float)alignment;

/**
 * Returns the button used in the treeview column header
 *
 * @return The button for the column header.
 */
- (OGTKWidget*)button;

/**
 * Returns %TRUE if the user can click on the header for the column.
 *
 * @return %TRUE if user can click the column header.
 */
- (bool)clickable;

/**
 * Returns %TRUE if the column expands to fill available space.
 *
 * @return %TRUE if the column expands to fill available space.
 */
- (bool)expand;

/**
 * Gets the fixed width of the column.  This may not be the actual displayed
 * width of the column; for that, use gtk_tree_view_column_get_width().
 *
 * @return The fixed width of the column.
 */
- (int)fixedWidth;

/**
 * Returns the maximum width in pixels of the @tree_column, or -1 if no maximum
 * width is set.
 *
 * @return The maximum width of the @tree_column.
 */
- (int)maxWidth;

/**
 * Returns the minimum width in pixels of the @tree_column, or -1 if no minimum
 * width is set.
 *
 * @return The minimum width of the @tree_column.
 */
- (int)minWidth;

/**
 * Returns %TRUE if the @tree_column can be reordered by the user.
 *
 * @return %TRUE if the @tree_column can be reordered by the user.
 */
- (bool)reorderable;

/**
 * Returns %TRUE if the @tree_column can be resized by the end user.
 *
 * @return %TRUE, if the @tree_column can be resized.
 */
- (bool)resizable;

/**
 * Returns the current type of @tree_column.
 *
 * @return The type of @tree_column.
 */
- (GtkTreeViewColumnSizing)sizing;

/**
 * Gets the logical @sort_column_id that the model sorts on
 * when this column is selected for sorting.
 * 
 * See [method@Gtk.TreeViewColumn.set_sort_column_id].
 *
 * @return the current @sort_column_id for this column, or -1 if
 *   this column can’t be used for sorting
 */
- (int)sortColumnId;

/**
 * Gets the value set by gtk_tree_view_column_set_sort_indicator().
 *
 * @return whether the sort indicator arrow is displayed
 */
- (bool)sortIndicator;

/**
 * Gets the value set by gtk_tree_view_column_set_sort_order().
 *
 * @return the sort order the sort indicator is indicating
 */
- (GtkSortType)sortOrder;

/**
 * Returns the spacing of @tree_column.
 *
 * @return the spacing of @tree_column.
 */
- (int)spacing;

/**
 * Returns the title of the widget.
 *
 * @return the title of the column. This string should not be
 * modified or freed.
 */
- (OFString*)title;

/**
 * Returns the `GtkTreeView` wherein @tree_column has been inserted.
 * If @column is currently not inserted in any tree view, %NULL is
 * returned.
 *
 * @return The tree view wherein @column
 *   has been inserted
 */
- (OGTKWidget*)treeView;

/**
 * Returns %TRUE if @tree_column is visible.
 *
 * @return whether the column is visible or not.  If it is visible, then
 * the tree will show the column.
 */
- (bool)visible;

/**
 * Returns the `GtkWidget` in the button on the column header.
 * 
 * If a custom widget has not been set then %NULL is returned.
 *
 * @return The `GtkWidget` in the column header
 */
- (OGTKWidget*)widget;

/**
 * Returns the current size of @tree_column in pixels.
 *
 * @return The current width of @tree_column.
 */
- (int)width;

/**
 * Returns the current X offset of @tree_column in pixels.
 *
 * @return The current X offset of @tree_column.
 */
- (int)xoffset;

/**
 * Adds the @cell to end of the column. If @expand is %FALSE, then the @cell
 * is allocated no more space than it needs. Any unused space is divided
 * evenly between cells for which @expand is %TRUE.
 *
 * @param cell The `GtkCellRenderer`
 * @param expand %TRUE if @cell is to be given extra space allocated to @tree_column.
 */
- (void)packEndWithCell:(OGTKCellRenderer*)cell expand:(bool)expand;

/**
 * Packs the @cell into the beginning of the column. If @expand is %FALSE, then
 * the @cell is allocated no more space than it needs. Any unused space is divided
 * evenly between cells for which @expand is %TRUE.
 *
 * @param cell The `GtkCellRenderer`
 * @param expand %TRUE if @cell is to be given extra space allocated to @tree_column.
 */
- (void)packStartWithCell:(OGTKCellRenderer*)cell expand:(bool)expand;

/**
 * Flags the column, and the cell renderers added to this column, to have
 * their sizes renegotiated.
 *
 */
- (void)queueResize;

/**
 * Sets the alignment of the title or custom widget inside the column header.
 * The alignment determines its location inside the button -- 0.0 for left, 0.5
 * for center, 1.0 for right.
 *
 * @param xalign The alignment, which is between [0.0 and 1.0] inclusive.
 */
- (void)setAlignmentWithXalign:(float)xalign;

/**
 * Sets the `GtkTreeCellDataFunc` to use for the column.
 * 
 * This
 * function is used instead of the standard attributes mapping for
 * setting the column value, and should set the value of @tree_column's
 * cell renderer as appropriate.  @func may be %NULL to remove an
 * older one.
 *
 * @param cellRenderer A `GtkCellRenderer`
 * @param func The `GtkTreeCellDataFunc` to use.
 * @param funcData The user data for @func.
 * @param destroy The destroy notification for @func_data
 */
- (void)setCellDataFuncWithCellRenderer:(OGTKCellRenderer*)cellRenderer func:(GtkTreeCellDataFunc)func funcData:(gpointer)funcData destroy:(GDestroyNotify)destroy;

/**
 * Sets the header to be active if @clickable is %TRUE.  When the header is
 * active, then it can take keyboard focus, and can be clicked.
 *
 * @param clickable %TRUE if the header is active.
 */
- (void)setClickable:(bool)clickable;

/**
 * Sets the column to take available extra space.  This space is shared equally
 * amongst all columns that have the expand set to %TRUE.  If no column has this
 * option set, then the last column gets all extra space.  By default, every
 * column is created with this %FALSE.
 * 
 * Along with “fixed-width”, the “expand” property changes when the column is
 * resized by the user.
 *
 * @param expand %TRUE if the column should expand to fill available space.
 */
- (void)setExpand:(bool)expand;

/**
 * If @fixed_width is not -1, sets the fixed width of @tree_column; otherwise
 * unsets it.  The effective value of @fixed_width is clamped between the
 * minimum and maximum width of the column; however, the value stored in the
 * “fixed-width” property is not clamped.  If the column sizing is
 * %GTK_TREE_VIEW_COLUMN_GROW_ONLY or %GTK_TREE_VIEW_COLUMN_AUTOSIZE, setting
 * a fixed width overrides the automatically calculated width.  Note that
 * @fixed_width is only a hint to GTK; the width actually allocated to the
 * column may be greater or less than requested.
 * 
 * Along with “expand”, the “fixed-width” property changes when the column is
 * resized by the user.
 *
 * @param fixedWidth The new fixed width, in pixels, or -1.
 */
- (void)setFixedWidth:(int)fixedWidth;

/**
 * Sets the maximum width of the @tree_column.  If @max_width is -1, then the
 * maximum width is unset.  Note, the column can actually be wider than max
 * width if it’s the last column in a view.  In this case, the column expands to
 * fill any extra space.
 *
 * @param maxWidth The maximum width of the column in pixels, or -1.
 */
- (void)setMaxWidth:(int)maxWidth;

/**
 * Sets the minimum width of the @tree_column.  If @min_width is -1, then the
 * minimum width is unset.
 *
 * @param minWidth The minimum width of the column in pixels, or -1.
 */
- (void)setMinWidth:(int)minWidth;

/**
 * If @reorderable is %TRUE, then the column can be reordered by the end user
 * dragging the header.
 *
 * @param reorderable %TRUE, if the column can be reordered.
 */
- (void)setReorderable:(bool)reorderable;

/**
 * If @resizable is %TRUE, then the user can explicitly resize the column by
 * grabbing the outer edge of the column button.
 * 
 * If resizable is %TRUE and
 * sizing mode of the column is %GTK_TREE_VIEW_COLUMN_AUTOSIZE, then the sizing
 * mode is changed to %GTK_TREE_VIEW_COLUMN_GROW_ONLY.
 *
 * @param resizable %TRUE, if the column can be resized
 */
- (void)setResizable:(bool)resizable;

/**
 * Sets the growth behavior of @tree_column to @type.
 *
 * @param type The `GtkTreeViewColumn`Sizing.
 */
- (void)setSizingWithType:(GtkTreeViewColumnSizing)type;

/**
 * Sets the logical @sort_column_id that this column sorts on when this column
 * is selected for sorting.  Doing so makes the column header clickable.
 *
 * @param sortColumnId The @sort_column_id of the model to sort on.
 */
- (void)setSortColumnId:(int)sortColumnId;

/**
 * Call this function with a @setting of %TRUE to display an arrow in
 * the header button indicating the column is sorted. Call
 * gtk_tree_view_column_set_sort_order() to change the direction of
 * the arrow.
 *
 * @param setting %TRUE to display an indicator that the column is sorted
 */
- (void)setSortIndicatorWithSetting:(bool)setting;

/**
 * Changes the appearance of the sort indicator.
 * 
 * This does not actually sort the model.  Use
 * gtk_tree_view_column_set_sort_column_id() if you want automatic sorting
 * support.  This function is primarily for custom sorting behavior, and should
 * be used in conjunction with gtk_tree_sortable_set_sort_column_id() to do
 * that. For custom models, the mechanism will vary.
 * 
 * The sort indicator changes direction to indicate normal sort or reverse sort.
 * Note that you must have the sort indicator enabled to see anything when
 * calling this function; see gtk_tree_view_column_set_sort_indicator().
 *
 * @param order sort order that the sort indicator should indicate
 */
- (void)setSortOrder:(GtkSortType)order;

/**
 * Sets the spacing field of @tree_column, which is the number of pixels to
 * place between cell renderers packed into it.
 *
 * @param spacing distance between cell renderers in pixels.
 */
- (void)setSpacing:(int)spacing;

/**
 * Sets the title of the @tree_column.  If a custom widget has been set, then
 * this value is ignored.
 *
 * @param title The title of the @tree_column.
 */
- (void)setTitle:(OFString*)title;

/**
 * Sets the visibility of @tree_column.
 *
 * @param visible %TRUE if the @tree_column is visible.
 */
- (void)setVisible:(bool)visible;

/**
 * Sets the widget in the header to be @widget.  If widget is %NULL, then the
 * header button is set with a `GtkLabel` set to the title of @tree_column.
 *
 * @param widget A child `GtkWidget`
 */
- (void)setWidget:(OGTKWidget*)widget;

@end