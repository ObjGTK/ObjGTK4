/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKCellRenderer;
@class OGTKTooltip;
@class OGTKCellArea;

/**
 * `GtkIconView` is a widget which displays data in a grid of icons.
 * 
 * `GtkIconView` provides an alternative view on a `GtkTreeModel`.
 * It displays the model as a grid of icons with labels. Like
 * [class@Gtk.TreeView], it allows to select one or multiple items
 * (depending on the selection mode, see [method@Gtk.IconView.set_selection_mode]).
 * In addition to selection with the arrow keys, `GtkIconView` supports
 * rubberband selection, which is controlled by dragging the pointer.
 * 
 * Note that if the tree model is backed by an actual tree store (as
 * opposed to a flat list where the mapping to icons is obvious),
 * `GtkIconView` will only display the first level of the tree and
 * ignore the tree’s branches.
 * 
 * ## CSS nodes
 * 
 * ```
 * iconview.view
 * ╰── [rubberband]
 * ```
 * 
 * `GtkIconView` has a single CSS node with name iconview and style class .view.
 * For rubberband selection, a subnode with name rubberband is used.
 *
 */
@interface OGTKIconView : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithArea:(OGTKCellArea*)area;
- (instancetype)initWithModel:(GtkTreeModel*)model;

/**
 * Methods
 */

- (GtkIconView*)castedGObject;

/**
 * Creates a `GdkPaintable` representation of the item at @path.
 * This image is used for a drag icon.
 *
 * @param path a `GtkTreePath` in @icon_view
 * @return a newly-allocated `GdkPaintable` of the drag icon.
 */
- (GdkPaintable*)createDragIcon:(GtkTreePath*)path;

/**
 * Turns @icon_view into a drop destination for automatic DND. Calling this
 * method sets `GtkIconView`:reorderable to %FALSE.
 *
 * @param formats the formats that the drag will support
 * @param actions the bitmask of possible actions for a drag to this
 *    widget
 */
- (void)enableModelDragDestWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions;

/**
 * Turns @icon_view into a drag source for automatic DND. Calling this
 * method sets `GtkIconView`:reorderable to %FALSE.
 *
 * @param startButtonMask Mask of allowed buttons to start drag
 * @param formats the formats that the drag will support
 * @param actions the bitmask of possible actions for a drag from this
 *    widget
 */
- (void)enableModelDragSourceWithStartButtonMask:(GdkModifierType)startButtonMask formats:(GdkContentFormats*)formats actions:(GdkDragAction)actions;

/**
 * Gets the setting set by gtk_icon_view_set_activate_on_single_click().
 *
 * @return %TRUE if item-activated will be emitted on a single click
 */
- (bool)activateOnSingleClick;

/**
 * Fills the bounding rectangle in widget coordinates for the cell specified by
 * @path and @cell. If @cell is %NULL the main cell area is used.
 * 
 * This function is only valid if @icon_view is realized.
 *
 * @param path a `GtkTreePath`
 * @param cell a `GtkCellRenderer`
 * @param rect rectangle to fill with cell rect
 * @return %FALSE if there is no such item, %TRUE otherwise
 */
- (bool)cellRectWithPath:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell rect:(GdkRectangle*)rect;

/**
 * Returns the value of the ::column-spacing property.
 *
 * @return the space between columns
 */
- (int)columnSpacing;

/**
 * Returns the value of the ::columns property.
 *
 * @return the number of columns, or -1
 */
- (int)columns;

/**
 * Fills in @path and @cell with the current cursor path and cell.
 * If the cursor isn’t currently set, then *@path will be %NULL.
 * If no cell currently has focus, then *@cell will be %NULL.
 * 
 * The returned `GtkTreePath` must be freed with gtk_tree_path_free().
 *
 * @param path Return location for the current
 *   cursor path
 * @param cell Return location the current
 *   focus cell
 * @return %TRUE if the cursor is set.
 */
- (bool)cursorWithPath:(GtkTreePath**)path cell:(GtkCellRenderer**)cell;

/**
 * Determines the destination item for a given position.
 *
 * @param dragX the position to determine the destination item for
 * @param dragY the position to determine the destination item for
 * @param path Return location for the path of the item
 * @param pos Return location for the drop position
 * @return whether there is an item at the given position.
 */
- (bool)destItemAtPosWithDragX:(int)dragX dragY:(int)dragY path:(GtkTreePath**)path pos:(GtkIconViewDropPosition*)pos;

/**
 * Gets information about the item that is highlighted for feedback.
 *
 * @param path Return location for the path of
 *   the highlighted item
 * @param pos Return location for the drop position
 */
- (void)dragDestItemWithPath:(GtkTreePath**)path pos:(GtkIconViewDropPosition*)pos;

/**
 * Gets the path and cell for the icon at the given position.
 *
 * @param x The x position to be identified
 * @param y The y position to be identified
 * @param path Return location for the path
 * @param cell Return location for the renderer
 *   responsible for the cell at (@x, @y)
 * @return %TRUE if an item exists at the specified position
 */
- (bool)itemAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path cell:(GtkCellRenderer**)cell;

/**
 * Gets the column in which the item @path is currently
 * displayed. Column numbers start at 0.
 *
 * @param path the `GtkTreePath` of the item
 * @return The column in which the item is displayed
 */
- (int)itemColumn:(GtkTreePath*)path;

/**
 * Returns the value of the ::item-orientation property which determines
 * whether the labels are drawn beside the icons instead of below.
 *
 * @return the relative position of texts and icons
 */
- (GtkOrientation)itemOrientation;

/**
 * Returns the value of the ::item-padding property.
 *
 * @return the padding around items
 */
- (int)itemPadding;

/**
 * Gets the row in which the item @path is currently
 * displayed. Row numbers start at 0.
 *
 * @param path the `GtkTreePath` of the item
 * @return The row in which the item is displayed
 */
- (int)itemRow:(GtkTreePath*)path;

/**
 * Returns the value of the ::item-width property.
 *
 * @return the width of a single item, or -1
 */
- (int)itemWidth;

/**
 * Returns the value of the ::margin property.
 *
 * @return the space at the borders
 */
- (int)margin;

/**
 * Returns the column with markup text for @icon_view.
 *
 * @return the markup column, or -1 if it’s unset.
 */
- (int)markupColumn;

/**
 * Returns the model the `GtkIconView` is based on.  Returns %NULL if the
 * model is unset.
 *
 * @return The currently used `GtkTreeModel`
 */
- (GtkTreeModel*)model;

/**
 * Gets the path for the icon at the given position.
 *
 * @param x The x position to be identified
 * @param y The y position to be identified
 * @return The `GtkTreePath` corresponding
 * to the icon or %NULL if no icon exists at that position.
 */
- (GtkTreePath*)pathAtPosWithX:(int)x y:(int)y;

/**
 * Returns the column with pixbufs for @icon_view.
 *
 * @return the pixbuf column, or -1 if it’s unset.
 */
- (int)pixbufColumn;

/**
 * Retrieves whether the user can reorder the list via drag-and-drop.
 * See gtk_icon_view_set_reorderable().
 *
 * @return %TRUE if the list can be reordered.
 */
- (bool)reorderable;

/**
 * Returns the value of the ::row-spacing property.
 *
 * @return the space between rows
 */
- (int)rowSpacing;

/**
 * Creates a list of paths of all selected items. Additionally, if you are
 * planning on modifying the model after calling this function, you may
 * want to convert the returned list into a list of `GtkTreeRowReferences`.
 * To do this, you can use gtk_tree_row_reference_new().
 * 
 * To free the return value, use `g_list_free_full`:
 * |[<!-- language="C" -->
 * GtkWidget *icon_view = gtk_icon_view_new ();
 * // Use icon_view
 * 
 * GList *list = gtk_icon_view_get_selected_items (GTK_ICON_VIEW (icon_view));
 * 
 * // use list
 * 
 * g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
 * ]|
 *
 * @return A `GList` containing a `GtkTreePath` for each selected row.
 */
- (GList*)selectedItems;

/**
 * Gets the selection mode of the @icon_view.
 *
 * @return the current selection mode
 */
- (GtkSelectionMode)selectionMode;

/**
 * Returns the value of the ::spacing property.
 *
 * @return the space between cells
 */
- (int)spacing;

/**
 * Returns the column with text for @icon_view.
 *
 * @return the text column, or -1 if it’s unset.
 */
- (int)textColumn;

/**
 * Returns the column of @icon_view’s model which is being used for
 * displaying tooltips on @icon_view’s rows.
 *
 * @return the index of the tooltip column that is currently being
 * used, or -1 if this is disabled.
 */
- (int)tooltipColumn;

/**
 * This function is supposed to be used in a `GtkWidget::query-tooltip`
 * signal handler for `GtkIconView`. The @x, @y and @keyboard_tip values
 * which are received in the signal handler, should be passed to this
 * function without modification.
 * 
 * The return value indicates whether there is an icon view item at the given
 * coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
 * tooltips the item returned will be the cursor item. When %TRUE, then any of
 * @model, @path and @iter which have been provided will be set to point to
 * that row and the corresponding model.
 *
 * @param x the x coordinate (relative to widget coordinates)
 * @param y the y coordinate (relative to widget coordinates)
 * @param keyboardTip whether this is a keyboard tooltip or not
 * @param model a pointer to receive a `GtkTreeModel`
 * @param path a pointer to receive a `GtkTreePath`
 * @param iter a pointer to receive a `GtkTreeIter`
 * @return whether or not the given tooltip context points to an item
 */
- (bool)tooltipContextWithX:(int)x y:(int)y keyboardTip:(bool)keyboardTip model:(GtkTreeModel**)model path:(GtkTreePath**)path iter:(GtkTreeIter*)iter;

/**
 * Sets @start_path and @end_path to be the first and last visible path.
 * Note that there may be invisible paths in between.
 * 
 * Both paths should be freed with gtk_tree_path_free() after use.
 *
 * @param startPath Return location for start of region
 * @param endPath Return location for end of region
 * @return %TRUE, if valid paths were placed in @start_path and @end_path
 */
- (bool)visibleRangeWithStartPath:(GtkTreePath**)startPath endPath:(GtkTreePath**)endPath;

/**
 * Activates the item determined by @path.
 *
 * @param path The `GtkTreePath` to be activated
 */
- (void)itemActivated:(GtkTreePath*)path;

/**
 * Returns %TRUE if the icon pointed to by @path is currently
 * selected. If @path does not point to a valid location, %FALSE is returned.
 *
 * @param path A `GtkTreePath` to check selection on.
 * @return %TRUE if @path is selected.
 */
- (bool)pathIsSelected:(GtkTreePath*)path;

/**
 * Moves the alignments of @icon_view to the position specified by @path.
 * @row_align determines where the row is placed, and @col_align determines
 * where @column is placed.  Both are expected to be between 0.0 and 1.0.
 * 0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means
 * center.
 * 
 * If @use_align is %FALSE, then the alignment arguments are ignored, and the
 * tree does the minimum amount of work to scroll the item onto the screen.
 * This means that the item will be scrolled to the edge closest to its current
 * position.  If the item is currently visible on the screen, nothing is done.
 * 
 * This function only works if the model is set, and @path is a valid row on
 * the model. If the model changes before the @icon_view is realized, the
 * centered path will be modified to reflect this change.
 *
 * @param path The path of the item to move to.
 * @param useAlign whether to use alignment arguments, or %FALSE.
 * @param rowAlign The vertical alignment of the item specified by @path.
 * @param colAlign The horizontal alignment of the item specified by @path.
 */
- (void)scrollToPathWithPath:(GtkTreePath*)path useAlign:(bool)useAlign rowAlign:(float)rowAlign colAlign:(float)colAlign;

/**
 * Selects all the icons. @icon_view must has its selection mode set
 * to %GTK_SELECTION_MULTIPLE.
 *
 */
- (void)selectAll;

/**
 * Selects the row at @path.
 *
 * @param path The `GtkTreePath` to be selected.
 */
- (void)selectPath:(GtkTreePath*)path;

/**
 * Calls a function for each selected icon. Note that the model or
 * selection cannot be modified from within this function.
 *
 * @param func The function to call for each selected icon.
 * @param data User data to pass to the function.
 */
- (void)selectedForeachWithFunc:(GtkIconViewForeachFunc)func data:(gpointer)data;

/**
 * Causes the `GtkIconView`::item-activated signal to be emitted on
 * a single click instead of a double click.
 *
 * @param single %TRUE to emit item-activated on a single click
 */
- (void)setActivateOnSingleClick:(bool)single;

/**
 * Sets the ::column-spacing property which specifies the space
 * which is inserted between the columns of the icon view.
 *
 * @param columnSpacing the column spacing
 */
- (void)setColumnSpacing:(int)columnSpacing;

/**
 * Sets the ::columns property which determines in how
 * many columns the icons are arranged. If @columns is
 * -1, the number of columns will be chosen automatically
 * to fill the available area.
 *
 * @param columns the number of columns
 */
- (void)setColumns:(int)columns;

/**
 * Sets the current keyboard focus to be at @path, and selects it.  This is
 * useful when you want to focus the user’s attention on a particular item.
 * If @cell is not %NULL, then focus is given to the cell specified by
 * it. Additionally, if @start_editing is %TRUE, then editing should be
 * started in the specified cell.
 * 
 * This function is often followed by `gtk_widget_grab_focus
 * (icon_view)` in order to give keyboard focus to the widget.
 * Please note that editing can only happen when the widget is realized.
 *
 * @param path A `GtkTreePath`
 * @param cell One of the cell renderers of @icon_view
 * @param startEditing %TRUE if the specified cell should start being edited.
 */
- (void)setCursorWithPath:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell startEditing:(bool)startEditing;

/**
 * Sets the item that is highlighted for feedback.
 *
 * @param path The path of the item to highlight
 * @param pos Specifies where to drop, relative to the item
 */
- (void)setDragDestItemWithPath:(GtkTreePath*)path pos:(GtkIconViewDropPosition)pos;

/**
 * Sets the ::item-orientation property which determines whether the labels
 * are drawn beside the icons instead of below.
 *
 * @param orientation the relative position of texts and icons
 */
- (void)setItemOrientation:(GtkOrientation)orientation;

/**
 * Sets the `GtkIconView`:item-padding property which specifies the padding
 * around each of the icon view’s items.
 *
 * @param itemPadding the item padding
 */
- (void)setItemPadding:(int)itemPadding;

/**
 * Sets the ::item-width property which specifies the width
 * to use for each item. If it is set to -1, the icon view will
 * automatically determine a suitable item size.
 *
 * @param itemWidth the width for each item
 */
- (void)setItemWidth:(int)itemWidth;

/**
 * Sets the ::margin property which specifies the space
 * which is inserted at the top, bottom, left and right
 * of the icon view.
 *
 * @param margin the margin
 */
- (void)setMargin:(int)margin;

/**
 * Sets the column with markup information for @icon_view to be
 * @column. The markup column must be of type `G_TYPE_STRING`.
 * If the markup column is set to something, it overrides
 * the text column set by gtk_icon_view_set_text_column().
 *
 * @param column A column in the currently used model, or -1 to display no text
 */
- (void)setMarkupColumn:(int)column;

/**
 * Sets the model for a `GtkIconView`.
 * If the @icon_view already has a model set, it will remove
 * it before setting the new model.  If @model is %NULL, then
 * it will unset the old model.
 *
 * @param model The model.
 */
- (void)setModel:(GtkTreeModel*)model;

/**
 * Sets the column with pixbufs for @icon_view to be @column. The pixbuf
 * column must be of type `GDK_TYPE_PIXBUF`
 *
 * @param column A column in the currently used model, or -1 to disable
 */
- (void)setPixbufColumn:(int)column;

/**
 * This function is a convenience function to allow you to reorder models that
 * support the `GtkTreeDragSourceIface` and the `GtkTreeDragDestIface`. Both
 * `GtkTreeStore` and `GtkListStore` support these. If @reorderable is %TRUE, then
 * the user can reorder the model by dragging and dropping rows.  The
 * developer can listen to these changes by connecting to the model's
 * row_inserted and row_deleted signals. The reordering is implemented by setting up
 * the icon view as a drag source and destination. Therefore, drag and
 * drop can not be used in a reorderable view for any other purpose.
 * 
 * This function does not give you any degree of control over the order -- any
 * reordering is allowed.  If more control is needed, you should probably
 * handle drag and drop manually.
 *
 * @param reorderable %TRUE, if the list of items can be reordered.
 */
- (void)setReorderable:(bool)reorderable;

/**
 * Sets the ::row-spacing property which specifies the space
 * which is inserted between the rows of the icon view.
 *
 * @param rowSpacing the row spacing
 */
- (void)setRowSpacing:(int)rowSpacing;

/**
 * Sets the selection mode of the @icon_view.
 *
 * @param mode The selection mode
 */
- (void)setSelectionMode:(GtkSelectionMode)mode;

/**
 * Sets the ::spacing property which specifies the space
 * which is inserted between the cells (i.e. the icon and
 * the text) of an item.
 *
 * @param spacing the spacing
 */
- (void)setSpacing:(int)spacing;

/**
 * Sets the column with text for @icon_view to be @column. The text
 * column must be of type `G_TYPE_STRING`.
 *
 * @param column A column in the currently used model, or -1 to display no text
 */
- (void)setTextColumn:(int)column;

/**
 * Sets the tip area of @tooltip to the area which @cell occupies in
 * the item pointed to by @path. See also gtk_tooltip_set_tip_area().
 * 
 * See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
 *
 * @param tooltip a `GtkTooltip`
 * @param path a `GtkTreePath`
 * @param cell a `GtkCellRenderer`
 */
- (void)setTooltipCellWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell;

/**
 * If you only plan to have simple (text-only) tooltips on full items, you
 * can use this function to have `GtkIconView` handle these automatically
 * for you. @column should be set to the column in @icon_view’s model
 * containing the tooltip texts, or -1 to disable this feature.
 * 
 * When enabled, `GtkWidget:has-tooltip` will be set to %TRUE and
 * @icon_view will connect a `GtkWidget::query-tooltip` signal handler.
 * 
 * Note that the signal handler sets the text with gtk_tooltip_set_markup(),
 * so &, <, etc have to be escaped in the text.
 *
 * @param column an integer, which is a valid column number for @icon_view’s model
 */
- (void)setTooltipColumn:(int)column;

/**
 * Sets the tip area of @tooltip to be the area covered by the item at @path.
 * See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
 * See also gtk_tooltip_set_tip_area().
 *
 * @param tooltip a `GtkTooltip`
 * @param path a `GtkTreePath`
 */
- (void)setTooltipItemWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path;

/**
 * Unselects all the icons.
 *
 */
- (void)unselectAll;

/**
 * Unselects the row at @path.
 *
 * @param path The `GtkTreePath` to be unselected.
 */
- (void)unselectPath:(GtkTreePath*)path;

/**
 * Undoes the effect of gtk_icon_view_enable_model_drag_dest(). Calling this
 * method sets `GtkIconView`:reorderable to %FALSE.
 *
 */
- (void)unsetModelDragDest;

/**
 * Undoes the effect of gtk_icon_view_enable_model_drag_source(). Calling this
 * method sets `GtkIconView`:reorderable to %FALSE.
 *
 */
- (void)unsetModelDragSource;

@end