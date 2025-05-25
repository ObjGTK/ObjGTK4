/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeView.h"

#import "OGTKCellRenderer.h"
#import "OGTKTooltip.h"
#import "OGTKTreeSelection.h"
#import "OGTKTreeViewColumn.h"

@implementation OGTKTreeView

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TREE_VIEW);
	return gObjectClass;
}

+ (instancetype)treeView
{
	GtkTreeView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_view_new(), GTK_TYPE_TREE_VIEW, GtkTreeView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKTreeView* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)treeViewWithModel:(GtkTreeModel*)model
{
	GtkTreeView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_view_new_with_model(model), GTK_TYPE_TREE_VIEW, GtkTreeView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKTreeView* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTreeView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TREE_VIEW, GtkTreeView);
}

- (int)appendColumn:(OGTKTreeViewColumn*)column
{
	int returnValue = (int)gtk_tree_view_append_column((GtkTreeView*)[self castedGObject], [column castedGObject]);

	return returnValue;
}

- (void)collapseAll
{
	gtk_tree_view_collapse_all((GtkTreeView*)[self castedGObject]);
}

- (bool)collapseRowWithPath:(GtkTreePath*)path
{
	bool returnValue = (bool)gtk_tree_view_collapse_row((GtkTreeView*)[self castedGObject], path);

	return returnValue;
}

- (void)columnsAutosize
{
	gtk_tree_view_columns_autosize((GtkTreeView*)[self castedGObject]);
}

- (void)convertBinWindowToTreeCoordsWithBx:(int)bx by:(int)by tx:(int*)tx ty:(int*)ty
{
	gtk_tree_view_convert_bin_window_to_tree_coords((GtkTreeView*)[self castedGObject], bx, by, tx, ty);
}

- (void)convertBinWindowToWidgetCoordsWithBx:(int)bx by:(int)by wx:(int*)wx wy:(int*)wy
{
	gtk_tree_view_convert_bin_window_to_widget_coords((GtkTreeView*)[self castedGObject], bx, by, wx, wy);
}

- (void)convertTreeToBinWindowCoordsWithTx:(int)tx ty:(int)ty bx:(int*)bx by:(int*)by
{
	gtk_tree_view_convert_tree_to_bin_window_coords((GtkTreeView*)[self castedGObject], tx, ty, bx, by);
}

- (void)convertTreeToWidgetCoordsWithTx:(int)tx ty:(int)ty wx:(int*)wx wy:(int*)wy
{
	gtk_tree_view_convert_tree_to_widget_coords((GtkTreeView*)[self castedGObject], tx, ty, wx, wy);
}

- (void)convertWidgetToBinWindowCoordsWithWx:(int)wx wy:(int)wy bx:(int*)bx by:(int*)by
{
	gtk_tree_view_convert_widget_to_bin_window_coords((GtkTreeView*)[self castedGObject], wx, wy, bx, by);
}

- (void)convertWidgetToTreeCoordsWithWx:(int)wx wy:(int)wy tx:(int*)tx ty:(int*)ty
{
	gtk_tree_view_convert_widget_to_tree_coords((GtkTreeView*)[self castedGObject], wx, wy, tx, ty);
}

- (GdkPaintable*)createRowDragIconWithPath:(GtkTreePath*)path
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_tree_view_create_row_drag_icon((GtkTreeView*)[self castedGObject], path);

	return returnValue;
}

- (void)enableModelDragDestWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_tree_view_enable_model_drag_dest((GtkTreeView*)[self castedGObject], formats, actions);
}

- (void)enableModelDragSourceWithStartButtonMask:(GdkModifierType)startButtonMask formats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_tree_view_enable_model_drag_source((GtkTreeView*)[self castedGObject], startButtonMask, formats, actions);
}

- (void)expandAll
{
	gtk_tree_view_expand_all((GtkTreeView*)[self castedGObject]);
}

- (bool)expandRowWithPath:(GtkTreePath*)path openAll:(bool)openAll
{
	bool returnValue = (bool)gtk_tree_view_expand_row((GtkTreeView*)[self castedGObject], path, openAll);

	return returnValue;
}

- (void)expandToPath:(GtkTreePath*)path
{
	gtk_tree_view_expand_to_path((GtkTreeView*)[self castedGObject], path);
}

- (bool)activateOnSingleClick
{
	bool returnValue = (bool)gtk_tree_view_get_activate_on_single_click((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (void)backgroundAreaWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column rect:(GdkRectangle*)rect
{
	gtk_tree_view_get_background_area((GtkTreeView*)[self castedGObject], path, [column castedGObject], rect);
}

- (void)cellAreaWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column rect:(GdkRectangle*)rect
{
	gtk_tree_view_get_cell_area((GtkTreeView*)[self castedGObject], path, [column castedGObject], rect);
}

- (OGTKTreeViewColumn*)column:(int)n
{
	GtkTreeViewColumn* gobjectValue = gtk_tree_view_get_column((GtkTreeView*)[self castedGObject], n);

	OGTKTreeViewColumn* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)columns
{
	GList* returnValue = (GList*)gtk_tree_view_get_columns((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (void)cursorWithPath:(GtkTreePath**)path focusColumn:(GtkTreeViewColumn**)focusColumn
{
	gtk_tree_view_get_cursor((GtkTreeView*)[self castedGObject], path, focusColumn);
}

- (bool)destRowAtPosWithDragX:(int)dragX dragY:(int)dragY path:(GtkTreePath**)path pos:(GtkTreeViewDropPosition*)pos
{
	bool returnValue = (bool)gtk_tree_view_get_dest_row_at_pos((GtkTreeView*)[self castedGObject], dragX, dragY, path, pos);

	return returnValue;
}

- (void)dragDestRowWithPath:(GtkTreePath**)path pos:(GtkTreeViewDropPosition*)pos
{
	gtk_tree_view_get_drag_dest_row((GtkTreeView*)[self castedGObject], path, pos);
}

- (bool)enableSearch
{
	bool returnValue = (bool)gtk_tree_view_get_enable_search((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)enableTreeLines
{
	bool returnValue = (bool)gtk_tree_view_get_enable_tree_lines((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (OGTKTreeViewColumn*)expanderColumn
{
	GtkTreeViewColumn* gobjectValue = gtk_tree_view_get_expander_column((GtkTreeView*)[self castedGObject]);

	OGTKTreeViewColumn* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)fixedHeightMode
{
	bool returnValue = (bool)gtk_tree_view_get_fixed_height_mode((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (GtkTreeViewGridLines)gridLines
{
	GtkTreeViewGridLines returnValue = (GtkTreeViewGridLines)gtk_tree_view_get_grid_lines((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)headersClickable
{
	bool returnValue = (bool)gtk_tree_view_get_headers_clickable((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)headersVisible
{
	bool returnValue = (bool)gtk_tree_view_get_headers_visible((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)hoverExpand
{
	bool returnValue = (bool)gtk_tree_view_get_hover_expand((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)hoverSelection
{
	bool returnValue = (bool)gtk_tree_view_get_hover_selection((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (int)levelIndentation
{
	int returnValue = (int)gtk_tree_view_get_level_indentation((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = (GtkTreeModel*)gtk_tree_view_get_model((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (guint)ncolumns
{
	guint returnValue = (guint)gtk_tree_view_get_n_columns((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)pathAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path column:(GtkTreeViewColumn**)column cellX:(int*)cellX cellY:(int*)cellY
{
	bool returnValue = (bool)gtk_tree_view_get_path_at_pos((GtkTreeView*)[self castedGObject], x, y, path, column, cellX, cellY);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = (bool)gtk_tree_view_get_reorderable((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (GtkTreeViewRowSeparatorFunc)rowSeparatorFunc
{
	GtkTreeViewRowSeparatorFunc returnValue = (GtkTreeViewRowSeparatorFunc)gtk_tree_view_get_row_separator_func((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)rubberBanding
{
	bool returnValue = (bool)gtk_tree_view_get_rubber_banding((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (int)searchColumn
{
	int returnValue = (int)gtk_tree_view_get_search_column((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (GtkEditable*)searchEntry
{
	GtkEditable* returnValue = (GtkEditable*)gtk_tree_view_get_search_entry((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (GtkTreeViewSearchEqualFunc)searchEqualFunc
{
	GtkTreeViewSearchEqualFunc returnValue = (GtkTreeViewSearchEqualFunc)gtk_tree_view_get_search_equal_func((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (OGTKTreeSelection*)selection
{
	GtkTreeSelection* gobjectValue = gtk_tree_view_get_selection((GtkTreeView*)[self castedGObject]);

	OGTKTreeSelection* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)showExpanders
{
	bool returnValue = (bool)gtk_tree_view_get_show_expanders((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (int)tooltipColumn
{
	int returnValue = (int)gtk_tree_view_get_tooltip_column((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (bool)tooltipContext:(int)x y:(int)y keyboardTip:(bool)keyboardTip model:(GtkTreeModel**)model path:(GtkTreePath**)path iter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_tree_view_get_tooltip_context((GtkTreeView*)[self castedGObject], x, y, keyboardTip, model, path, iter);

	return returnValue;
}

- (bool)visibleRangeWithStartPath:(GtkTreePath**)startPath endPath:(GtkTreePath**)endPath
{
	bool returnValue = (bool)gtk_tree_view_get_visible_range((GtkTreeView*)[self castedGObject], startPath, endPath);

	return returnValue;
}

- (void)visibleRect:(GdkRectangle*)visibleRect
{
	gtk_tree_view_get_visible_rect((GtkTreeView*)[self castedGObject], visibleRect);
}

- (int)insertColumn:(OGTKTreeViewColumn*)column position:(int)position
{
	int returnValue = (int)gtk_tree_view_insert_column((GtkTreeView*)[self castedGObject], [column castedGObject], position);

	return returnValue;
}

- (int)insertColumnWithDataFuncWithPosition:(int)position title:(OFString*)title cell:(OGTKCellRenderer*)cell func:(GtkTreeCellDataFunc)func data:(gpointer)data dnotify:(GDestroyNotify)dnotify
{
	int returnValue = (int)gtk_tree_view_insert_column_with_data_func((GtkTreeView*)[self castedGObject], position, [title UTF8String], [cell castedGObject], func, data, dnotify);

	return returnValue;
}

- (bool)isBlankAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path column:(GtkTreeViewColumn**)column cellX:(int*)cellX cellY:(int*)cellY
{
	bool returnValue = (bool)gtk_tree_view_is_blank_at_pos((GtkTreeView*)[self castedGObject], x, y, path, column, cellX, cellY);

	return returnValue;
}

- (bool)isRubberBandingActive
{
	bool returnValue = (bool)gtk_tree_view_is_rubber_banding_active((GtkTreeView*)[self castedGObject]);

	return returnValue;
}

- (void)mapExpandedRowsWithFunc:(GtkTreeViewMappingFunc)func data:(gpointer)data
{
	gtk_tree_view_map_expanded_rows((GtkTreeView*)[self castedGObject], func, data);
}

- (void)moveColumnAfter:(OGTKTreeViewColumn*)column baseColumn:(OGTKTreeViewColumn*)baseColumn
{
	gtk_tree_view_move_column_after((GtkTreeView*)[self castedGObject], [column castedGObject], [baseColumn castedGObject]);
}

- (int)removeColumn:(OGTKTreeViewColumn*)column
{
	int returnValue = (int)gtk_tree_view_remove_column((GtkTreeView*)[self castedGObject], [column castedGObject]);

	return returnValue;
}

- (void)rowActivatedWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column
{
	gtk_tree_view_row_activated((GtkTreeView*)[self castedGObject], path, [column castedGObject]);
}

- (bool)rowExpandedWithPath:(GtkTreePath*)path
{
	bool returnValue = (bool)gtk_tree_view_row_expanded((GtkTreeView*)[self castedGObject], path);

	return returnValue;
}

- (void)scrollToCellWithPath:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column useAlign:(bool)useAlign rowAlign:(float)rowAlign colAlign:(float)colAlign
{
	gtk_tree_view_scroll_to_cell((GtkTreeView*)[self castedGObject], path, [column castedGObject], useAlign, rowAlign, colAlign);
}

- (void)scrollToPointWithTreeX:(int)treeX treeY:(int)treeY
{
	gtk_tree_view_scroll_to_point((GtkTreeView*)[self castedGObject], treeX, treeY);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_tree_view_set_activate_on_single_click((GtkTreeView*)[self castedGObject], single);
}

- (void)setColumnDragFunction:(GtkTreeViewColumnDropFunc)func userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_tree_view_set_column_drag_function((GtkTreeView*)[self castedGObject], func, userData, destroy);
}

- (void)setCursorWithPath:(GtkTreePath*)path focusColumn:(OGTKTreeViewColumn*)focusColumn startEditing:(bool)startEditing
{
	gtk_tree_view_set_cursor((GtkTreeView*)[self castedGObject], path, [focusColumn castedGObject], startEditing);
}

- (void)setCursorOnCellWithPath:(GtkTreePath*)path focusColumn:(OGTKTreeViewColumn*)focusColumn focusCell:(OGTKCellRenderer*)focusCell startEditing:(bool)startEditing
{
	gtk_tree_view_set_cursor_on_cell((GtkTreeView*)[self castedGObject], path, [focusColumn castedGObject], [focusCell castedGObject], startEditing);
}

- (void)setDragDestRowWithPath:(GtkTreePath*)path pos:(GtkTreeViewDropPosition)pos
{
	gtk_tree_view_set_drag_dest_row((GtkTreeView*)[self castedGObject], path, pos);
}

- (void)setEnableSearch:(bool)enableSearch
{
	gtk_tree_view_set_enable_search((GtkTreeView*)[self castedGObject], enableSearch);
}

- (void)setEnableTreeLinesWithEnabled:(bool)enabled
{
	gtk_tree_view_set_enable_tree_lines((GtkTreeView*)[self castedGObject], enabled);
}

- (void)setExpanderColumn:(OGTKTreeViewColumn*)column
{
	gtk_tree_view_set_expander_column((GtkTreeView*)[self castedGObject], [column castedGObject]);
}

- (void)setFixedHeightModeWithEnable:(bool)enable
{
	gtk_tree_view_set_fixed_height_mode((GtkTreeView*)[self castedGObject], enable);
}

- (void)setGridLines:(GtkTreeViewGridLines)gridLines
{
	gtk_tree_view_set_grid_lines((GtkTreeView*)[self castedGObject], gridLines);
}

- (void)setHeadersClickableWithSetting:(bool)setting
{
	gtk_tree_view_set_headers_clickable((GtkTreeView*)[self castedGObject], setting);
}

- (void)setHeadersVisible:(bool)headersVisible
{
	gtk_tree_view_set_headers_visible((GtkTreeView*)[self castedGObject], headersVisible);
}

- (void)setHoverExpand:(bool)expand
{
	gtk_tree_view_set_hover_expand((GtkTreeView*)[self castedGObject], expand);
}

- (void)setHoverSelection:(bool)hover
{
	gtk_tree_view_set_hover_selection((GtkTreeView*)[self castedGObject], hover);
}

- (void)setLevelIndentation:(int)indentation
{
	gtk_tree_view_set_level_indentation((GtkTreeView*)[self castedGObject], indentation);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_tree_view_set_model((GtkTreeView*)[self castedGObject], model);
}

- (void)setReorderable:(bool)reorderable
{
	gtk_tree_view_set_reorderable((GtkTreeView*)[self castedGObject], reorderable);
}

- (void)setRowSeparatorFunc:(GtkTreeViewRowSeparatorFunc)func data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_tree_view_set_row_separator_func((GtkTreeView*)[self castedGObject], func, data, destroy);
}

- (void)setRubberBandingWithEnable:(bool)enable
{
	gtk_tree_view_set_rubber_banding((GtkTreeView*)[self castedGObject], enable);
}

- (void)setSearchColumn:(int)column
{
	gtk_tree_view_set_search_column((GtkTreeView*)[self castedGObject], column);
}

- (void)setSearchEntry:(GtkEditable*)entry
{
	gtk_tree_view_set_search_entry((GtkTreeView*)[self castedGObject], entry);
}

- (void)setSearchEqualFunc:(GtkTreeViewSearchEqualFunc)searchEqualFunc searchUserData:(gpointer)searchUserData searchDestroy:(GDestroyNotify)searchDestroy
{
	gtk_tree_view_set_search_equal_func((GtkTreeView*)[self castedGObject], searchEqualFunc, searchUserData, searchDestroy);
}

- (void)setShowExpandersWithEnabled:(bool)enabled
{
	gtk_tree_view_set_show_expanders((GtkTreeView*)[self castedGObject], enabled);
}

- (void)setTooltipCell:(OGTKTooltip*)tooltip path:(GtkTreePath*)path column:(OGTKTreeViewColumn*)column cell:(OGTKCellRenderer*)cell
{
	gtk_tree_view_set_tooltip_cell((GtkTreeView*)[self castedGObject], [tooltip castedGObject], path, [column castedGObject], [cell castedGObject]);
}

- (void)setTooltipColumn:(int)column
{
	gtk_tree_view_set_tooltip_column((GtkTreeView*)[self castedGObject], column);
}

- (void)setTooltipRow:(OGTKTooltip*)tooltip path:(GtkTreePath*)path
{
	gtk_tree_view_set_tooltip_row((GtkTreeView*)[self castedGObject], [tooltip castedGObject], path);
}

- (void)unsetRowsDragDest
{
	gtk_tree_view_unset_rows_drag_dest((GtkTreeView*)[self castedGObject]);
}

- (void)unsetRowsDragSource
{
	gtk_tree_view_unset_rows_drag_source((GtkTreeView*)[self castedGObject]);
}


@end