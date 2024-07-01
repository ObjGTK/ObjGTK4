/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeView.h"

#import "OGTKTooltip.h"
#import "OGTKTreeSelection.h"
#import "OGTKTreeViewColumn.h"
#import "OGTKCellRenderer.h"

@implementation OGTKTreeView

- (instancetype)init
{
	GtkTreeView* gobjectValue = GTK_TREE_VIEW(gtk_tree_view_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initWithModel:(GtkTreeModel*)model
{
	GtkTreeView* gobjectValue = GTK_TREE_VIEW(gtk_tree_view_new_with_model(model));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkTreeView*)castedGObject
{
	return GTK_TREE_VIEW([self gObject]);
}

- (int)appendColumn:(OGTKTreeViewColumn*)column
{
	int returnValue = gtk_tree_view_append_column([self castedGObject], [column castedGObject]);

	return returnValue;
}

- (void)collapseAll
{
	gtk_tree_view_collapse_all([self castedGObject]);
}

- (bool)collapseRow:(GtkTreePath*)path
{
	bool returnValue = gtk_tree_view_collapse_row([self castedGObject], path);

	return returnValue;
}

- (void)columnsAutosize
{
	gtk_tree_view_columns_autosize([self castedGObject]);
}

- (void)convertBinWindowToTreeCoordsWithBx:(int)bx by:(int)by tx:(int*)tx ty:(int*)ty
{
	gtk_tree_view_convert_bin_window_to_tree_coords([self castedGObject], bx, by, tx, ty);
}

- (void)convertBinWindowToWidgetCoordsWithBx:(int)bx by:(int)by wx:(int*)wx wy:(int*)wy
{
	gtk_tree_view_convert_bin_window_to_widget_coords([self castedGObject], bx, by, wx, wy);
}

- (void)convertTreeToBinWindowCoordsWithTx:(int)tx ty:(int)ty bx:(int*)bx by:(int*)by
{
	gtk_tree_view_convert_tree_to_bin_window_coords([self castedGObject], tx, ty, bx, by);
}

- (void)convertTreeToWidgetCoordsWithTx:(int)tx ty:(int)ty wx:(int*)wx wy:(int*)wy
{
	gtk_tree_view_convert_tree_to_widget_coords([self castedGObject], tx, ty, wx, wy);
}

- (void)convertWidgetToBinWindowCoordsWithWx:(int)wx wy:(int)wy bx:(int*)bx by:(int*)by
{
	gtk_tree_view_convert_widget_to_bin_window_coords([self castedGObject], wx, wy, bx, by);
}

- (void)convertWidgetToTreeCoordsWithWx:(int)wx wy:(int)wy tx:(int*)tx ty:(int*)ty
{
	gtk_tree_view_convert_widget_to_tree_coords([self castedGObject], wx, wy, tx, ty);
}

- (GdkPaintable*)createRowDragIcon:(GtkTreePath*)path
{
	GdkPaintable* returnValue = gtk_tree_view_create_row_drag_icon([self castedGObject], path);

	return returnValue;
}

- (void)enableModelDragDestWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_tree_view_enable_model_drag_dest([self castedGObject], formats, actions);
}

- (void)enableModelDragSourceWithStartButtonMask:(GdkModifierType)startButtonMask formats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_tree_view_enable_model_drag_source([self castedGObject], startButtonMask, formats, actions);
}

- (void)expandAll
{
	gtk_tree_view_expand_all([self castedGObject]);
}

- (bool)expandRowWithPath:(GtkTreePath*)path openAll:(bool)openAll
{
	bool returnValue = gtk_tree_view_expand_row([self castedGObject], path, openAll);

	return returnValue;
}

- (void)expandToPath:(GtkTreePath*)path
{
	gtk_tree_view_expand_to_path([self castedGObject], path);
}

- (bool)activateOnSingleClick
{
	bool returnValue = gtk_tree_view_get_activate_on_single_click([self castedGObject]);

	return returnValue;
}

- (void)backgroundAreaWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column rect:(GdkRectangle*)rect
{
	gtk_tree_view_get_background_area([self castedGObject], path, [column castedGObject], rect);
}

- (void)cellAreaWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column rect:(GdkRectangle*)rect
{
	gtk_tree_view_get_cell_area([self castedGObject], path, [column castedGObject], rect);
}

- (OGTKTreeViewColumn*)column:(int)n
{
	GtkTreeViewColumn* gobjectValue = GTK_TREE_VIEW_COLUMN(gtk_tree_view_get_column([self castedGObject], n));

	OGTKTreeViewColumn* returnValue = [OGTKTreeViewColumn withGObject:gobjectValue];
	return returnValue;
}

- (GList*)columns
{
	GList* returnValue = gtk_tree_view_get_columns([self castedGObject]);

	return returnValue;
}

- (void)cursorWithPath:(GtkTreePath**)path focusColumn:(GtkTreeViewColumn**)focusColumn
{
	gtk_tree_view_get_cursor([self castedGObject], path, focusColumn);
}

- (bool)destRowAtPosWithDragX:(int)dragX dragY:(int)dragY path:(GtkTreePath**)path pos:(GtkTreeViewDropPosition*)pos
{
	bool returnValue = gtk_tree_view_get_dest_row_at_pos([self castedGObject], dragX, dragY, path, pos);

	return returnValue;
}

- (void)dragDestRowWithPath:(GtkTreePath**)path pos:(GtkTreeViewDropPosition*)pos
{
	gtk_tree_view_get_drag_dest_row([self castedGObject], path, pos);
}

- (bool)enableSearch
{
	bool returnValue = gtk_tree_view_get_enable_search([self castedGObject]);

	return returnValue;
}

- (bool)enableTreeLines
{
	bool returnValue = gtk_tree_view_get_enable_tree_lines([self castedGObject]);

	return returnValue;
}

- (OGTKTreeViewColumn*)expanderColumn
{
	GtkTreeViewColumn* gobjectValue = GTK_TREE_VIEW_COLUMN(gtk_tree_view_get_expander_column([self castedGObject]));

	OGTKTreeViewColumn* returnValue = [OGTKTreeViewColumn withGObject:gobjectValue];
	return returnValue;
}

- (bool)fixedHeightMode
{
	bool returnValue = gtk_tree_view_get_fixed_height_mode([self castedGObject]);

	return returnValue;
}

- (GtkTreeViewGridLines)gridLines
{
	GtkTreeViewGridLines returnValue = gtk_tree_view_get_grid_lines([self castedGObject]);

	return returnValue;
}

- (bool)headersClickable
{
	bool returnValue = gtk_tree_view_get_headers_clickable([self castedGObject]);

	return returnValue;
}

- (bool)headersVisible
{
	bool returnValue = gtk_tree_view_get_headers_visible([self castedGObject]);

	return returnValue;
}

- (bool)hoverExpand
{
	bool returnValue = gtk_tree_view_get_hover_expand([self castedGObject]);

	return returnValue;
}

- (bool)hoverSelection
{
	bool returnValue = gtk_tree_view_get_hover_selection([self castedGObject]);

	return returnValue;
}

- (int)levelIndentation
{
	int returnValue = gtk_tree_view_get_level_indentation([self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = gtk_tree_view_get_model([self castedGObject]);

	return returnValue;
}

- (guint)ncolumns
{
	guint returnValue = gtk_tree_view_get_n_columns([self castedGObject]);

	return returnValue;
}

- (bool)pathAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path column:(GtkTreeViewColumn**)column cellX:(int*)cellX cellY:(int*)cellY
{
	bool returnValue = gtk_tree_view_get_path_at_pos([self castedGObject], x, y, path, column, cellX, cellY);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = gtk_tree_view_get_reorderable([self castedGObject]);

	return returnValue;
}

- (GtkTreeViewRowSeparatorFunc)rowSeparatorFunc
{
	GtkTreeViewRowSeparatorFunc returnValue = gtk_tree_view_get_row_separator_func([self castedGObject]);

	return returnValue;
}

- (bool)rubberBanding
{
	bool returnValue = gtk_tree_view_get_rubber_banding([self castedGObject]);

	return returnValue;
}

- (int)searchColumn
{
	int returnValue = gtk_tree_view_get_search_column([self castedGObject]);

	return returnValue;
}

- (GtkEditable*)searchEntry
{
	GtkEditable* returnValue = gtk_tree_view_get_search_entry([self castedGObject]);

	return returnValue;
}

- (GtkTreeViewSearchEqualFunc)searchEqualFunc
{
	GtkTreeViewSearchEqualFunc returnValue = gtk_tree_view_get_search_equal_func([self castedGObject]);

	return returnValue;
}

- (OGTKTreeSelection*)selection
{
	GtkTreeSelection* gobjectValue = GTK_TREE_SELECTION(gtk_tree_view_get_selection([self castedGObject]));

	OGTKTreeSelection* returnValue = [OGTKTreeSelection withGObject:gobjectValue];
	return returnValue;
}

- (bool)showExpanders
{
	bool returnValue = gtk_tree_view_get_show_expanders([self castedGObject]);

	return returnValue;
}

- (int)tooltipColumn
{
	int returnValue = gtk_tree_view_get_tooltip_column([self castedGObject]);

	return returnValue;
}

- (bool)tooltipContextWithX:(int)x y:(int)y keyboardTip:(bool)keyboardTip model:(GtkTreeModel**)model path:(GtkTreePath**)path iter:(GtkTreeIter*)iter
{
	bool returnValue = gtk_tree_view_get_tooltip_context([self castedGObject], x, y, keyboardTip, model, path, iter);

	return returnValue;
}

- (bool)visibleRangeWithStartPath:(GtkTreePath**)startPath endPath:(GtkTreePath**)endPath
{
	bool returnValue = gtk_tree_view_get_visible_range([self castedGObject], startPath, endPath);

	return returnValue;
}

- (void)visibleRect:(GdkRectangle*)visibleRect
{
	gtk_tree_view_get_visible_rect([self castedGObject], visibleRect);
}

- (int)insertColumnWithColumn:(OGTKTreeViewColumn*)column position:(int)position
{
	int returnValue = gtk_tree_view_insert_column([self castedGObject], [column castedGObject], position);

	return returnValue;
}

- (int)insertColumnWithDataFuncWithPosition:(int)position title:(OFString*)title cell:(OGTKCellRenderer*)cell func:(GtkTreeCellDataFunc)func data:(gpointer)data dnotify:(GDestroyNotify)dnotify
{
	int returnValue = gtk_tree_view_insert_column_with_data_func([self castedGObject], position, [title UTF8String], [cell castedGObject], func, data, dnotify);

	return returnValue;
}

- (bool)isBlankAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path column:(GtkTreeViewColumn**)column cellX:(int*)cellX cellY:(int*)cellY
{
	bool returnValue = gtk_tree_view_is_blank_at_pos([self castedGObject], x, y, path, column, cellX, cellY);

	return returnValue;
}

- (bool)isRubberBandingActive
{
	bool returnValue = gtk_tree_view_is_rubber_banding_active([self castedGObject]);

	return returnValue;
}

- (void)mapExpandedRowsWithFunc:(GtkTreeViewMappingFunc)func data:(gpointer)data
{
	gtk_tree_view_map_expanded_rows([self castedGObject], func, data);
}

- (void)moveColumnAfterWithColumn:(OGTKTreeViewColumn*)column baseColumn:(OGTKTreeViewColumn*)baseColumn
{
	gtk_tree_view_move_column_after([self castedGObject], [column castedGObject], [baseColumn castedGObject]);
}

- (int)removeColumn:(OGTKTreeViewColumn*)column
{
	int returnValue = gtk_tree_view_remove_column([self castedGObject], [column castedGObject]);

	return returnValue;
}

- (void)rowActivatedWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column
{
	gtk_tree_view_row_activated([self castedGObject], path, [column castedGObject]);
}

- (bool)rowExpanded:(GtkTreePath*)path
{
	bool returnValue = gtk_tree_view_row_expanded([self castedGObject], path);

	return returnValue;
}

- (void)scrollToCellWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column useAlign:(bool)useAlign rowAlign:(float)rowAlign colAlign:(float)colAlign
{
	gtk_tree_view_scroll_to_cell([self castedGObject], path, [column castedGObject], useAlign, rowAlign, colAlign);
}

- (void)scrollToPointWithTreeX:(int)treeX treeY:(int)treeY
{
	gtk_tree_view_scroll_to_point([self castedGObject], treeX, treeY);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_tree_view_set_activate_on_single_click([self castedGObject], single);
}

- (void)setColumnDragFunctionWithFunc:(GtkTreeViewColumnDropFunc)func userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_tree_view_set_column_drag_function([self castedGObject], func, userData, destroy);
}

- (void)setCursorWithPath:(GtkTreePath*)path focusColumn:(OGTKTreeViewColumn*)focusColumn startEditing:(bool)startEditing
{
	gtk_tree_view_set_cursor([self castedGObject], path, [focusColumn castedGObject], startEditing);
}

- (void)setCursorOnCellWithPath:(GtkTreePath*)path focusColumn:(OGTKTreeViewColumn*)focusColumn focusCell:(OGTKCellRenderer*)focusCell startEditing:(bool)startEditing
{
	gtk_tree_view_set_cursor_on_cell([self castedGObject], path, [focusColumn castedGObject], [focusCell castedGObject], startEditing);
}

- (void)setDragDestRowWithPath:(GtkTreePath*)path pos:(GtkTreeViewDropPosition)pos
{
	gtk_tree_view_set_drag_dest_row([self castedGObject], path, pos);
}

- (void)setEnableSearch:(bool)enableSearch
{
	gtk_tree_view_set_enable_search([self castedGObject], enableSearch);
}

- (void)setEnableTreeLines:(bool)enabled
{
	gtk_tree_view_set_enable_tree_lines([self castedGObject], enabled);
}

- (void)setExpanderColumn:(OGTKTreeViewColumn*)column
{
	gtk_tree_view_set_expander_column([self castedGObject], [column castedGObject]);
}

- (void)setFixedHeightMode:(bool)enable
{
	gtk_tree_view_set_fixed_height_mode([self castedGObject], enable);
}

- (void)setGridLines:(GtkTreeViewGridLines)gridLines
{
	gtk_tree_view_set_grid_lines([self castedGObject], gridLines);
}

- (void)setHeadersClickable:(bool)setting
{
	gtk_tree_view_set_headers_clickable([self castedGObject], setting);
}

- (void)setHeadersVisible:(bool)headersVisible
{
	gtk_tree_view_set_headers_visible([self castedGObject], headersVisible);
}

- (void)setHoverExpand:(bool)expand
{
	gtk_tree_view_set_hover_expand([self castedGObject], expand);
}

- (void)setHoverSelection:(bool)hover
{
	gtk_tree_view_set_hover_selection([self castedGObject], hover);
}

- (void)setLevelIndentation:(int)indentation
{
	gtk_tree_view_set_level_indentation([self castedGObject], indentation);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_tree_view_set_model([self castedGObject], model);
}

- (void)setReorderable:(bool)reorderable
{
	gtk_tree_view_set_reorderable([self castedGObject], reorderable);
}

- (void)setRowSeparatorFuncWithFunc:(GtkTreeViewRowSeparatorFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_tree_view_set_row_separator_func([self castedGObject], func, data, destroy);
}

- (void)setRubberBanding:(bool)enable
{
	gtk_tree_view_set_rubber_banding([self castedGObject], enable);
}

- (void)setSearchColumn:(int)column
{
	gtk_tree_view_set_search_column([self castedGObject], column);
}

- (void)setSearchEntry:(GtkEditable*)entry
{
	gtk_tree_view_set_search_entry([self castedGObject], entry);
}

- (void)setSearchEqualFuncWithSearchEqualFunc:(GtkTreeViewSearchEqualFunc)searchEqualFunc searchUserData:(gpointer)searchUserData searchDestroy:(GDestroyNotify)searchDestroy
{
	gtk_tree_view_set_search_equal_func([self castedGObject], searchEqualFunc, searchUserData, searchDestroy);
}

- (void)setShowExpanders:(bool)enabled
{
	gtk_tree_view_set_show_expanders([self castedGObject], enabled);
}

- (void)setTooltipCellWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column cell:(OGTKCellRenderer*)cell
{
	gtk_tree_view_set_tooltip_cell([self castedGObject], [tooltip castedGObject], path, [column castedGObject], [cell castedGObject]);
}

- (void)setTooltipColumn:(int)column
{
	gtk_tree_view_set_tooltip_column([self castedGObject], column);
}

- (void)setTooltipRowWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path
{
	gtk_tree_view_set_tooltip_row([self castedGObject], [tooltip castedGObject], path);
}

- (void)unsetRowsDragDest
{
	gtk_tree_view_unset_rows_drag_dest([self castedGObject]);
}

- (void)unsetRowsDragSource
{
	gtk_tree_view_unset_rows_drag_source([self castedGObject]);
}


@end