/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIconView.h"

#import "OGTKCellArea.h"
#import "OGTKCellRenderer.h"
#import "OGTKTooltip.h"

@implementation OGTKIconView

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ICON_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ICON_VIEW);
	return gObjectClass;
}

+ (instancetype)iconView
{
	GtkIconView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_icon_view_new(), GTK_TYPE_ICON_VIEW, GtkIconView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKIconView* wrapperObject;
	@try {
		wrapperObject = [[OGTKIconView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)iconViewWithArea:(OGTKCellArea*)area
{
	GtkIconView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_icon_view_new_with_area([area castedGObject]), GTK_TYPE_ICON_VIEW, GtkIconView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKIconView* wrapperObject;
	@try {
		wrapperObject = [[OGTKIconView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)iconViewWithModel:(GtkTreeModel*)model
{
	GtkIconView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_icon_view_new_with_model(model), GTK_TYPE_ICON_VIEW, GtkIconView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKIconView* wrapperObject;
	@try {
		wrapperObject = [[OGTKIconView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkIconView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ICON_VIEW, GtkIconView);
}

- (GdkPaintable*)createDragIconWithPath:(GtkTreePath*)path
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_icon_view_create_drag_icon((GtkIconView*)[self castedGObject], path);

	return returnValue;
}

- (void)enableModelDragDestWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_icon_view_enable_model_drag_dest((GtkIconView*)[self castedGObject], formats, actions);
}

- (void)enableModelDragSourceWithStartButtonMask:(GdkModifierType)startButtonMask formats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	gtk_icon_view_enable_model_drag_source((GtkIconView*)[self castedGObject], startButtonMask, formats, actions);
}

- (bool)activateOnSingleClick
{
	bool returnValue = (bool)gtk_icon_view_get_activate_on_single_click((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (bool)cellRectWithPath:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell rect:(GdkRectangle*)rect
{
	bool returnValue = (bool)gtk_icon_view_get_cell_rect((GtkIconView*)[self castedGObject], path, [cell castedGObject], rect);

	return returnValue;
}

- (int)columnSpacing
{
	int returnValue = (int)gtk_icon_view_get_column_spacing((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)columns
{
	int returnValue = (int)gtk_icon_view_get_columns((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (bool)cursorWithPath:(GtkTreePath**)path cell:(GtkCellRenderer**)cell
{
	bool returnValue = (bool)gtk_icon_view_get_cursor((GtkIconView*)[self castedGObject], path, cell);

	return returnValue;
}

- (bool)destItemAtPosWithDragX:(int)dragX dragY:(int)dragY path:(GtkTreePath**)path pos:(GtkIconViewDropPosition*)pos
{
	bool returnValue = (bool)gtk_icon_view_get_dest_item_at_pos((GtkIconView*)[self castedGObject], dragX, dragY, path, pos);

	return returnValue;
}

- (void)dragDestItemWithPath:(GtkTreePath**)path pos:(GtkIconViewDropPosition*)pos
{
	gtk_icon_view_get_drag_dest_item((GtkIconView*)[self castedGObject], path, pos);
}

- (bool)itemAtPosWithX:(int)x y:(int)y path:(GtkTreePath**)path cell:(GtkCellRenderer**)cell
{
	bool returnValue = (bool)gtk_icon_view_get_item_at_pos((GtkIconView*)[self castedGObject], x, y, path, cell);

	return returnValue;
}

- (int)itemColumnWithPath:(GtkTreePath*)path
{
	int returnValue = (int)gtk_icon_view_get_item_column((GtkIconView*)[self castedGObject], path);

	return returnValue;
}

- (GtkOrientation)itemOrientation
{
	GtkOrientation returnValue = (GtkOrientation)gtk_icon_view_get_item_orientation((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)itemPadding
{
	int returnValue = (int)gtk_icon_view_get_item_padding((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)itemRowWithPath:(GtkTreePath*)path
{
	int returnValue = (int)gtk_icon_view_get_item_row((GtkIconView*)[self castedGObject], path);

	return returnValue;
}

- (int)itemWidth
{
	int returnValue = (int)gtk_icon_view_get_item_width((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)margin
{
	int returnValue = (int)gtk_icon_view_get_margin((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)markupColumn
{
	int returnValue = (int)gtk_icon_view_get_markup_column((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = (GtkTreeModel*)gtk_icon_view_get_model((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (GtkTreePath*)pathAtPosWithX:(int)x y:(int)y
{
	GtkTreePath* returnValue = (GtkTreePath*)gtk_icon_view_get_path_at_pos((GtkIconView*)[self castedGObject], x, y);

	return returnValue;
}

- (int)pixbufColumn
{
	int returnValue = (int)gtk_icon_view_get_pixbuf_column((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = (bool)gtk_icon_view_get_reorderable((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)rowSpacing
{
	int returnValue = (int)gtk_icon_view_get_row_spacing((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (GList*)selectedItems
{
	GList* returnValue = (GList*)gtk_icon_view_get_selected_items((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (GtkSelectionMode)selectionMode
{
	GtkSelectionMode returnValue = (GtkSelectionMode)gtk_icon_view_get_selection_mode((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)spacing
{
	int returnValue = (int)gtk_icon_view_get_spacing((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)textColumn
{
	int returnValue = (int)gtk_icon_view_get_text_column((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (int)tooltipColumn
{
	int returnValue = (int)gtk_icon_view_get_tooltip_column((GtkIconView*)[self castedGObject]);

	return returnValue;
}

- (bool)tooltipContext:(int)x y:(int)y keyboardTip:(bool)keyboardTip model:(GtkTreeModel**)model path:(GtkTreePath**)path iter:(GtkTreeIter*)iter
{
	bool returnValue = (bool)gtk_icon_view_get_tooltip_context((GtkIconView*)[self castedGObject], x, y, keyboardTip, model, path, iter);

	return returnValue;
}

- (bool)visibleRangeWithStartPath:(GtkTreePath**)startPath endPath:(GtkTreePath**)endPath
{
	bool returnValue = (bool)gtk_icon_view_get_visible_range((GtkIconView*)[self castedGObject], startPath, endPath);

	return returnValue;
}

- (void)itemActivatedWithPath:(GtkTreePath*)path
{
	gtk_icon_view_item_activated((GtkIconView*)[self castedGObject], path);
}

- (bool)pathIsSelectedWithPath:(GtkTreePath*)path
{
	bool returnValue = (bool)gtk_icon_view_path_is_selected((GtkIconView*)[self castedGObject], path);

	return returnValue;
}

- (void)scrollToPath:(GtkTreePath*)path useAlign:(bool)useAlign rowAlign:(float)rowAlign colAlign:(float)colAlign
{
	gtk_icon_view_scroll_to_path((GtkIconView*)[self castedGObject], path, useAlign, rowAlign, colAlign);
}

- (void)selectAll
{
	gtk_icon_view_select_all((GtkIconView*)[self castedGObject]);
}

- (void)selectPath:(GtkTreePath*)path
{
	gtk_icon_view_select_path((GtkIconView*)[self castedGObject], path);
}

- (void)selectedForeachWithFunc:(GtkIconViewForeachFunc)func data:(gpointer)data
{
	gtk_icon_view_selected_foreach((GtkIconView*)[self castedGObject], func, data);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_icon_view_set_activate_on_single_click((GtkIconView*)[self castedGObject], single);
}

- (void)setColumnSpacing:(int)columnSpacing
{
	gtk_icon_view_set_column_spacing((GtkIconView*)[self castedGObject], columnSpacing);
}

- (void)setColumns:(int)columns
{
	gtk_icon_view_set_columns((GtkIconView*)[self castedGObject], columns);
}

- (void)setCursorWithPath:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell startEditing:(bool)startEditing
{
	gtk_icon_view_set_cursor((GtkIconView*)[self castedGObject], path, [cell castedGObject], startEditing);
}

- (void)setDragDestItemWithPath:(GtkTreePath*)path pos:(GtkIconViewDropPosition)pos
{
	gtk_icon_view_set_drag_dest_item((GtkIconView*)[self castedGObject], path, pos);
}

- (void)setItemOrientation:(GtkOrientation)orientation
{
	gtk_icon_view_set_item_orientation((GtkIconView*)[self castedGObject], orientation);
}

- (void)setItemPadding:(int)itemPadding
{
	gtk_icon_view_set_item_padding((GtkIconView*)[self castedGObject], itemPadding);
}

- (void)setItemWidth:(int)itemWidth
{
	gtk_icon_view_set_item_width((GtkIconView*)[self castedGObject], itemWidth);
}

- (void)setMargin:(int)margin
{
	gtk_icon_view_set_margin((GtkIconView*)[self castedGObject], margin);
}

- (void)setMarkupColumn:(int)column
{
	gtk_icon_view_set_markup_column((GtkIconView*)[self castedGObject], column);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_icon_view_set_model((GtkIconView*)[self castedGObject], model);
}

- (void)setPixbufColumn:(int)column
{
	gtk_icon_view_set_pixbuf_column((GtkIconView*)[self castedGObject], column);
}

- (void)setReorderable:(bool)reorderable
{
	gtk_icon_view_set_reorderable((GtkIconView*)[self castedGObject], reorderable);
}

- (void)setRowSpacing:(int)rowSpacing
{
	gtk_icon_view_set_row_spacing((GtkIconView*)[self castedGObject], rowSpacing);
}

- (void)setSelectionMode:(GtkSelectionMode)mode
{
	gtk_icon_view_set_selection_mode((GtkIconView*)[self castedGObject], mode);
}

- (void)setSpacing:(int)spacing
{
	gtk_icon_view_set_spacing((GtkIconView*)[self castedGObject], spacing);
}

- (void)setTextColumn:(int)column
{
	gtk_icon_view_set_text_column((GtkIconView*)[self castedGObject], column);
}

- (void)setTooltipCell:(OGTKTooltip*)tooltip path:(GtkTreePath*)path cell:(OGTKCellRenderer*)cell
{
	gtk_icon_view_set_tooltip_cell((GtkIconView*)[self castedGObject], [tooltip castedGObject], path, [cell castedGObject]);
}

- (void)setTooltipColumn:(int)column
{
	gtk_icon_view_set_tooltip_column((GtkIconView*)[self castedGObject], column);
}

- (void)setTooltipItem:(OGTKTooltip*)tooltip path:(GtkTreePath*)path
{
	gtk_icon_view_set_tooltip_item((GtkIconView*)[self castedGObject], [tooltip castedGObject], path);
}

- (void)unselectAll
{
	gtk_icon_view_unselect_all((GtkIconView*)[self castedGObject]);
}

- (void)unselectPath:(GtkTreePath*)path
{
	gtk_icon_view_unselect_path((GtkIconView*)[self castedGObject], path);
}

- (void)unsetModelDragDest
{
	gtk_icon_view_unset_model_drag_dest((GtkIconView*)[self castedGObject]);
}

- (void)unsetModelDragSource
{
	gtk_icon_view_unset_model_drag_source((GtkIconView*)[self castedGObject]);
}


@end