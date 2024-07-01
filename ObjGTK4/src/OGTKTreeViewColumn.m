/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeViewColumn.h"

#import "OGTKCellArea.h"
#import "OGTKCellRenderer.h"
#import "OGTKWidget.h"

@implementation OGTKTreeViewColumn

- (instancetype)init
{
	GtkTreeViewColumn* gobjectValue = GTK_TREE_VIEW_COLUMN(gtk_tree_view_column_new());

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
	GtkTreeViewColumn* gobjectValue = GTK_TREE_VIEW_COLUMN(gtk_tree_view_column_new_with_area([area castedGObject]));

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

- (GtkTreeViewColumn*)castedGObject
{
	return GTK_TREE_VIEW_COLUMN([self gObject]);
}

- (void)addAttributeWithCellRenderer:(OGTKCellRenderer*)cellRenderer attribute:(OFString*)attribute column:(int)column
{
	gtk_tree_view_column_add_attribute([self castedGObject], [cellRenderer castedGObject], [attribute UTF8String], column);
}

- (bool)cellGetPositionWithCellRenderer:(OGTKCellRenderer*)cellRenderer xoffset:(int*)xoffset width:(int*)width
{
	bool returnValue = gtk_tree_view_column_cell_get_position([self castedGObject], [cellRenderer castedGObject], xoffset, width);

	return returnValue;
}

- (void)cellGetSizeWithXoffset:(int*)xoffset yoffset:(int*)yoffset width:(int*)width height:(int*)height
{
	gtk_tree_view_column_cell_get_size([self castedGObject], xoffset, yoffset, width, height);
}

- (bool)cellIsVisible
{
	bool returnValue = gtk_tree_view_column_cell_is_visible([self castedGObject]);

	return returnValue;
}

- (void)cellSetCellDataWithTreeModel:(GtkTreeModel*)treeModel iter:(GtkTreeIter*)iter isExpander:(bool)isExpander isExpanded:(bool)isExpanded
{
	gtk_tree_view_column_cell_set_cell_data([self castedGObject], treeModel, iter, isExpander, isExpanded);
}

- (void)clear
{
	gtk_tree_view_column_clear([self castedGObject]);
}

- (void)clearAttributes:(OGTKCellRenderer*)cellRenderer
{
	gtk_tree_view_column_clear_attributes([self castedGObject], [cellRenderer castedGObject]);
}

- (void)clicked
{
	gtk_tree_view_column_clicked([self castedGObject]);
}

- (void)focusCell:(OGTKCellRenderer*)cell
{
	gtk_tree_view_column_focus_cell([self castedGObject], [cell castedGObject]);
}

- (float)alignment
{
	float returnValue = gtk_tree_view_column_get_alignment([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)button
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_tree_view_column_get_button([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)clickable
{
	bool returnValue = gtk_tree_view_column_get_clickable([self castedGObject]);

	return returnValue;
}

- (bool)expand
{
	bool returnValue = gtk_tree_view_column_get_expand([self castedGObject]);

	return returnValue;
}

- (int)fixedWidth
{
	int returnValue = gtk_tree_view_column_get_fixed_width([self castedGObject]);

	return returnValue;
}

- (int)maxWidth
{
	int returnValue = gtk_tree_view_column_get_max_width([self castedGObject]);

	return returnValue;
}

- (int)minWidth
{
	int returnValue = gtk_tree_view_column_get_min_width([self castedGObject]);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = gtk_tree_view_column_get_reorderable([self castedGObject]);

	return returnValue;
}

- (bool)resizable
{
	bool returnValue = gtk_tree_view_column_get_resizable([self castedGObject]);

	return returnValue;
}

- (GtkTreeViewColumnSizing)sizing
{
	GtkTreeViewColumnSizing returnValue = gtk_tree_view_column_get_sizing([self castedGObject]);

	return returnValue;
}

- (int)sortColumnId
{
	int returnValue = gtk_tree_view_column_get_sort_column_id([self castedGObject]);

	return returnValue;
}

- (bool)sortIndicator
{
	bool returnValue = gtk_tree_view_column_get_sort_indicator([self castedGObject]);

	return returnValue;
}

- (GtkSortType)sortOrder
{
	GtkSortType returnValue = gtk_tree_view_column_get_sort_order([self castedGObject]);

	return returnValue;
}

- (int)spacing
{
	int returnValue = gtk_tree_view_column_get_spacing([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_tree_view_column_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)treeView
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_tree_view_column_get_tree_view([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)visible
{
	bool returnValue = gtk_tree_view_column_get_visible([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_tree_view_column_get_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (int)width
{
	int returnValue = gtk_tree_view_column_get_width([self castedGObject]);

	return returnValue;
}

- (int)xoffset
{
	int returnValue = gtk_tree_view_column_get_x_offset([self castedGObject]);

	return returnValue;
}

- (void)packEndWithCell:(OGTKCellRenderer*)cell expand:(bool)expand
{
	gtk_tree_view_column_pack_end([self castedGObject], [cell castedGObject], expand);
}

- (void)packStartWithCell:(OGTKCellRenderer*)cell expand:(bool)expand
{
	gtk_tree_view_column_pack_start([self castedGObject], [cell castedGObject], expand);
}

- (void)queueResize
{
	gtk_tree_view_column_queue_resize([self castedGObject]);
}

- (void)setAlignment:(float)xalign
{
	gtk_tree_view_column_set_alignment([self castedGObject], xalign);
}

- (void)setCellDataFuncWithCellRenderer:(OGTKCellRenderer*)cellRenderer func:(GtkTreeCellDataFunc)func funcData:(gpointer)funcData destroy:(GDestroyNotify)destroy
{
	gtk_tree_view_column_set_cell_data_func([self castedGObject], [cellRenderer castedGObject], func, funcData, destroy);
}

- (void)setClickable:(bool)clickable
{
	gtk_tree_view_column_set_clickable([self castedGObject], clickable);
}

- (void)setExpand:(bool)expand
{
	gtk_tree_view_column_set_expand([self castedGObject], expand);
}

- (void)setFixedWidth:(int)fixedWidth
{
	gtk_tree_view_column_set_fixed_width([self castedGObject], fixedWidth);
}

- (void)setMaxWidth:(int)maxWidth
{
	gtk_tree_view_column_set_max_width([self castedGObject], maxWidth);
}

- (void)setMinWidth:(int)minWidth
{
	gtk_tree_view_column_set_min_width([self castedGObject], minWidth);
}

- (void)setReorderable:(bool)reorderable
{
	gtk_tree_view_column_set_reorderable([self castedGObject], reorderable);
}

- (void)setResizable:(bool)resizable
{
	gtk_tree_view_column_set_resizable([self castedGObject], resizable);
}

- (void)setSizing:(GtkTreeViewColumnSizing)type
{
	gtk_tree_view_column_set_sizing([self castedGObject], type);
}

- (void)setSortColumnId:(int)sortColumnId
{
	gtk_tree_view_column_set_sort_column_id([self castedGObject], sortColumnId);
}

- (void)setSortIndicator:(bool)setting
{
	gtk_tree_view_column_set_sort_indicator([self castedGObject], setting);
}

- (void)setSortOrder:(GtkSortType)order
{
	gtk_tree_view_column_set_sort_order([self castedGObject], order);
}

- (void)setSpacing:(int)spacing
{
	gtk_tree_view_column_set_spacing([self castedGObject], spacing);
}

- (void)setTitle:(OFString*)title
{
	gtk_tree_view_column_set_title([self castedGObject], [title UTF8String]);
}

- (void)setVisible:(bool)visible
{
	gtk_tree_view_column_set_visible([self castedGObject], visible);
}

- (void)setWidget:(OGTKWidget*)widget
{
	gtk_tree_view_column_set_widget([self castedGObject], [widget castedGObject]);
}


@end