/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIconView.h"

#import "OGTKCellArea.h"
#import "OGTKCellRenderer.h"
#import "OGTKTooltip.h"

@implementation OGTKIconView

- (instancetype)init
{
	GtkIconView* gobjectValue = GTK_ICON_VIEW(gtk_icon_view_new());

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

- (instancetype)initWithArea:(OGTKCellArea*)area
{
	GtkIconView* gobjectValue = GTK_ICON_VIEW(gtk_icon_view_new_with_area([area castedGObject]));

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
	GtkIconView* gobjectValue = GTK_ICON_VIEW(gtk_icon_view_new_with_model(model));

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

- (GtkIconView*)castedGObject
{
	return GTK_ICON_VIEW([self gObject]);
}

- (GdkPaintable*)createDragIcon:(GtkTreePath*)path
{
	GdkPaintable* returnValue = gtk_icon_view_create_drag_icon([self castedGObject], path);

	return returnValue;
}

- (void)enableModelDragDestWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_icon_view_enable_model_drag_dest([self castedGObject], formats, actions);
}

- (void)enableModelDragSourceWithStartButtonMask:(GdkModifierType)startButtonMask formats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_icon_view_enable_model_drag_source([self castedGObject], startButtonMask, formats, actions);
}

- (bool)activateOnSingleClick
{
	bool returnValue = gtk_icon_view_get_activate_on_single_click([self castedGObject]);

	return returnValue;
}

- (bool)cellRectWithPath:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell rect:(GdkRectangle*)rect
{
	bool returnValue = gtk_icon_view_get_cell_rect([self castedGObject], path, [cell castedGObject], rect);

	return returnValue;
}

- (int)columnSpacing
{
	int returnValue = gtk_icon_view_get_column_spacing([self castedGObject]);

	return returnValue;
}

- (int)columns
{
	int returnValue = gtk_icon_view_get_columns([self castedGObject]);

	return returnValue;
}

- (bool)cursorWithPath:(GtkTreePath**)path cell:(GtkCellRenderer**)cell
{
	bool returnValue = gtk_icon_view_get_cursor([self castedGObject], path, cell);

	return returnValue;
}

- (bool)destItemAtPosWithDragX:(int)dragX dragY:(int)dragY path:(GtkTreePath**)path pos:(GtkIconViewDropPosition*)pos
{
	bool returnValue = gtk_icon_view_get_dest_item_at_pos([self castedGObject], dragX, dragY, path, pos);

	return returnValue;
}

- (void)dragDestItemWithPath:(GtkTreePath**)path pos:(GtkIconViewDropPosition*)pos
{
	gtk_icon_view_get_drag_dest_item([self castedGObject], path, pos);
}

- (bool)itemAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path cell:(GtkCellRenderer**)cell
{
	bool returnValue = gtk_icon_view_get_item_at_pos([self castedGObject], x, y, path, cell);

	return returnValue;
}

- (int)itemColumn:(GtkTreePath*)path
{
	int returnValue = gtk_icon_view_get_item_column([self castedGObject], path);

	return returnValue;
}

- (GtkOrientation)itemOrientation
{
	GtkOrientation returnValue = gtk_icon_view_get_item_orientation([self castedGObject]);

	return returnValue;
}

- (int)itemPadding
{
	int returnValue = gtk_icon_view_get_item_padding([self castedGObject]);

	return returnValue;
}

- (int)itemRow:(GtkTreePath*)path
{
	int returnValue = gtk_icon_view_get_item_row([self castedGObject], path);

	return returnValue;
}

- (int)itemWidth
{
	int returnValue = gtk_icon_view_get_item_width([self castedGObject]);

	return returnValue;
}

- (int)margin
{
	int returnValue = gtk_icon_view_get_margin([self castedGObject]);

	return returnValue;
}

- (int)markupColumn
{
	int returnValue = gtk_icon_view_get_markup_column([self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = gtk_icon_view_get_model([self castedGObject]);

	return returnValue;
}

- (GtkTreePath*)pathAtPosWithX:(int)x y:(int)y
{
	GtkTreePath* returnValue = gtk_icon_view_get_path_at_pos([self castedGObject], x, y);

	return returnValue;
}

- (int)pixbufColumn
{
	int returnValue = gtk_icon_view_get_pixbuf_column([self castedGObject]);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = gtk_icon_view_get_reorderable([self castedGObject]);

	return returnValue;
}

- (int)rowSpacing
{
	int returnValue = gtk_icon_view_get_row_spacing([self castedGObject]);

	return returnValue;
}

- (GList*)selectedItems
{
	GList* returnValue = gtk_icon_view_get_selected_items([self castedGObject]);

	return returnValue;
}

- (GtkSelectionMode)selectionMode
{
	GtkSelectionMode returnValue = gtk_icon_view_get_selection_mode([self castedGObject]);

	return returnValue;
}

- (int)spacing
{
	int returnValue = gtk_icon_view_get_spacing([self castedGObject]);

	return returnValue;
}

- (int)textColumn
{
	int returnValue = gtk_icon_view_get_text_column([self castedGObject]);

	return returnValue;
}

- (int)tooltipColumn
{
	int returnValue = gtk_icon_view_get_tooltip_column([self castedGObject]);

	return returnValue;
}

- (bool)tooltipContextWithX:(int)x y:(int)y keyboardTip:(bool)keyboardTip model:(GtkTreeModel**)model path:(GtkTreePath**)path iter:(GtkTreeIter*)iter
{
	bool returnValue = gtk_icon_view_get_tooltip_context([self castedGObject], x, y, keyboardTip, model, path, iter);

	return returnValue;
}

- (bool)visibleRangeWithStartPath:(GtkTreePath**)startPath endPath:(GtkTreePath**)endPath
{
	bool returnValue = gtk_icon_view_get_visible_range([self castedGObject], startPath, endPath);

	return returnValue;
}

- (void)itemActivated:(GtkTreePath*)path
{
	gtk_icon_view_item_activated([self castedGObject], path);
}

- (bool)pathIsSelected:(GtkTreePath*)path
{
	bool returnValue = gtk_icon_view_path_is_selected([self castedGObject], path);

	return returnValue;
}

- (void)scrollToPathWithPath:(GtkTreePath*)path useAlign:(bool)useAlign rowAlign:(float)rowAlign colAlign:(float)colAlign
{
	gtk_icon_view_scroll_to_path([self castedGObject], path, useAlign, rowAlign, colAlign);
}

- (void)selectAll
{
	gtk_icon_view_select_all([self castedGObject]);
}

- (void)selectPath:(GtkTreePath*)path
{
	gtk_icon_view_select_path([self castedGObject], path);
}

- (void)selectedForeachWithFunc:(GtkIconViewForeachFunc)func data:(gpointer)data
{
	gtk_icon_view_selected_foreach([self castedGObject], func, data);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_icon_view_set_activate_on_single_click([self castedGObject], single);
}

- (void)setColumnSpacing:(int)columnSpacing
{
	gtk_icon_view_set_column_spacing([self castedGObject], columnSpacing);
}

- (void)setColumns:(int)columns
{
	gtk_icon_view_set_columns([self castedGObject], columns);
}

- (void)setCursorWithPath:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell startEditing:(bool)startEditing
{
	gtk_icon_view_set_cursor([self castedGObject], path, [cell castedGObject], startEditing);
}

- (void)setDragDestItemWithPath:(GtkTreePath*)path pos:(GtkIconViewDropPosition)pos
{
	gtk_icon_view_set_drag_dest_item([self castedGObject], path, pos);
}

- (void)setItemOrientation:(GtkOrientation)orientation
{
	gtk_icon_view_set_item_orientation([self castedGObject], orientation);
}

- (void)setItemPadding:(int)itemPadding
{
	gtk_icon_view_set_item_padding([self castedGObject], itemPadding);
}

- (void)setItemWidth:(int)itemWidth
{
	gtk_icon_view_set_item_width([self castedGObject], itemWidth);
}

- (void)setMargin:(int)margin
{
	gtk_icon_view_set_margin([self castedGObject], margin);
}

- (void)setMarkupColumn:(int)column
{
	gtk_icon_view_set_markup_column([self castedGObject], column);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_icon_view_set_model([self castedGObject], model);
}

- (void)setPixbufColumn:(int)column
{
	gtk_icon_view_set_pixbuf_column([self castedGObject], column);
}

- (void)setReorderable:(bool)reorderable
{
	gtk_icon_view_set_reorderable([self castedGObject], reorderable);
}

- (void)setRowSpacing:(int)rowSpacing
{
	gtk_icon_view_set_row_spacing([self castedGObject], rowSpacing);
}

- (void)setSelectionMode:(GtkSelectionMode)mode
{
	gtk_icon_view_set_selection_mode([self castedGObject], mode);
}

- (void)setSpacing:(int)spacing
{
	gtk_icon_view_set_spacing([self castedGObject], spacing);
}

- (void)setTextColumn:(int)column
{
	gtk_icon_view_set_text_column([self castedGObject], column);
}

- (void)setTooltipCellWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell
{
	gtk_icon_view_set_tooltip_cell([self castedGObject], [tooltip castedGObject], path, [cell castedGObject]);
}

- (void)setTooltipColumn:(int)column
{
	gtk_icon_view_set_tooltip_column([self castedGObject], column);
}

- (void)setTooltipItemWithTooltip:(OGTKTooltip*)tooltip path:(GtkTreePath*)path
{
	gtk_icon_view_set_tooltip_item([self castedGObject], [tooltip castedGObject], path);
}

- (void)unselectAll
{
	gtk_icon_view_unselect_all([self castedGObject]);
}

- (void)unselectPath:(GtkTreePath*)path
{
	gtk_icon_view_unselect_path([self castedGObject], path);
}

- (void)unsetModelDragDest
{
	gtk_icon_view_unset_model_drag_dest([self castedGObject]);
}

- (void)unsetModelDragSource
{
	gtk_icon_view_unset_model_drag_source([self castedGObject]);
}


@end