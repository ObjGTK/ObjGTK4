/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTreeViewColumn.h"

#import "OGTKCellArea.h"
#import "OGTKCellRenderer.h"
#import "OGTKWidget.h"

@implementation OGTKTreeViewColumn

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TREE_VIEW_COLUMN;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TREE_VIEW_COLUMN);
	return gObjectClass;
}

+ (instancetype)treeViewColumn
{
	GtkTreeViewColumn* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_view_column_new(), GTK_TYPE_TREE_VIEW_COLUMN, GtkTreeViewColumn);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKTreeViewColumn* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeViewColumn alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)treeViewColumnWithArea:(OGTKCellArea*)area
{
	GtkTreeViewColumn* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_tree_view_column_new_with_area([area castedGObject]), GTK_TYPE_TREE_VIEW_COLUMN, GtkTreeViewColumn);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKTreeViewColumn* wrapperObject;
	@try {
		wrapperObject = [[OGTKTreeViewColumn alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTreeViewColumn*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TREE_VIEW_COLUMN, GtkTreeViewColumn);
}

- (void)addAttributeWithCellRenderer:(OGTKCellRenderer*)cellRenderer attribute:(OFString*)attribute column:(int)column
{
	gtk_tree_view_column_add_attribute((GtkTreeViewColumn*)[self castedGObject], [cellRenderer castedGObject], [attribute UTF8String], column);
}

- (bool)cellGetPositionWithCellRenderer:(OGTKCellRenderer*)cellRenderer xoffset:(int*)xoffset width:(int*)width
{
	bool returnValue = (bool)gtk_tree_view_column_cell_get_position((GtkTreeViewColumn*)[self castedGObject], [cellRenderer castedGObject], xoffset, width);

	return returnValue;
}

- (void)cellGetSizeWithXoffset:(int*)xoffset yoffset:(int*)yoffset width:(int*)width height:(int*)height
{
	gtk_tree_view_column_cell_get_size((GtkTreeViewColumn*)[self castedGObject], xoffset, yoffset, width, height);
}

- (bool)cellIsVisible
{
	bool returnValue = (bool)gtk_tree_view_column_cell_is_visible((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (void)cellSetCellDataWithTreeModel:(GtkTreeModel*)treeModel iter:(GtkTreeIter*)iter isExpander:(bool)isExpander isExpanded:(bool)isExpanded
{
	gtk_tree_view_column_cell_set_cell_data((GtkTreeViewColumn*)[self castedGObject], treeModel, iter, isExpander, isExpanded);
}

- (void)clear
{
	gtk_tree_view_column_clear((GtkTreeViewColumn*)[self castedGObject]);
}

- (void)clearAttributesWithCellRenderer:(OGTKCellRenderer*)cellRenderer
{
	gtk_tree_view_column_clear_attributes((GtkTreeViewColumn*)[self castedGObject], [cellRenderer castedGObject]);
}

- (void)clicked
{
	gtk_tree_view_column_clicked((GtkTreeViewColumn*)[self castedGObject]);
}

- (void)focusCell:(OGTKCellRenderer*)cell
{
	gtk_tree_view_column_focus_cell((GtkTreeViewColumn*)[self castedGObject], [cell castedGObject]);
}

- (float)alignment
{
	float returnValue = (float)gtk_tree_view_column_get_alignment((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)button
{
	GtkWidget* gobjectValue = gtk_tree_view_column_get_button((GtkTreeViewColumn*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)clickable
{
	bool returnValue = (bool)gtk_tree_view_column_get_clickable((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (bool)expand
{
	bool returnValue = (bool)gtk_tree_view_column_get_expand((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (int)fixedWidth
{
	int returnValue = (int)gtk_tree_view_column_get_fixed_width((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (int)maxWidth
{
	int returnValue = (int)gtk_tree_view_column_get_max_width((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (int)minWidth
{
	int returnValue = (int)gtk_tree_view_column_get_min_width((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = (bool)gtk_tree_view_column_get_reorderable((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (bool)resizable
{
	bool returnValue = (bool)gtk_tree_view_column_get_resizable((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (GtkTreeViewColumnSizing)sizing
{
	GtkTreeViewColumnSizing returnValue = (GtkTreeViewColumnSizing)gtk_tree_view_column_get_sizing((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (int)sortColumnId
{
	int returnValue = (int)gtk_tree_view_column_get_sort_column_id((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (bool)sortIndicator
{
	bool returnValue = (bool)gtk_tree_view_column_get_sort_indicator((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (GtkSortType)sortOrder
{
	GtkSortType returnValue = (GtkSortType)gtk_tree_view_column_get_sort_order((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (int)spacing
{
	int returnValue = (int)gtk_tree_view_column_get_spacing((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_tree_view_column_get_title((GtkTreeViewColumn*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)treeView
{
	GtkWidget* gobjectValue = gtk_tree_view_column_get_tree_view((GtkTreeViewColumn*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)visible
{
	bool returnValue = (bool)gtk_tree_view_column_get_visible((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = gtk_tree_view_column_get_widget((GtkTreeViewColumn*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)width
{
	int returnValue = (int)gtk_tree_view_column_get_width((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (int)xoffset
{
	int returnValue = (int)gtk_tree_view_column_get_x_offset((GtkTreeViewColumn*)[self castedGObject]);

	return returnValue;
}

- (void)packEndWithCell:(OGTKCellRenderer*)cell expand:(bool)expand
{
	gtk_tree_view_column_pack_end((GtkTreeViewColumn*)[self castedGObject], [cell castedGObject], expand);
}

- (void)packStartWithCell:(OGTKCellRenderer*)cell expand:(bool)expand
{
	gtk_tree_view_column_pack_start((GtkTreeViewColumn*)[self castedGObject], [cell castedGObject], expand);
}

- (void)queueResize
{
	gtk_tree_view_column_queue_resize((GtkTreeViewColumn*)[self castedGObject]);
}

- (void)setAlignmentWithXalign:(float)xalign
{
	gtk_tree_view_column_set_alignment((GtkTreeViewColumn*)[self castedGObject], xalign);
}

- (void)setCellDataFuncWithCellRenderer:(OGTKCellRenderer*)cellRenderer func:(GtkTreeCellDataFunc)func funcData:(gpointer)funcData destroy:(GDestroyNotify)destroy
{
	gtk_tree_view_column_set_cell_data_func((GtkTreeViewColumn*)[self castedGObject], [cellRenderer castedGObject], func, funcData, destroy);
}

- (void)setClickable:(bool)clickable
{
	gtk_tree_view_column_set_clickable((GtkTreeViewColumn*)[self castedGObject], clickable);
}

- (void)setExpand:(bool)expand
{
	gtk_tree_view_column_set_expand((GtkTreeViewColumn*)[self castedGObject], expand);
}

- (void)setFixedWidth:(int)fixedWidth
{
	gtk_tree_view_column_set_fixed_width((GtkTreeViewColumn*)[self castedGObject], fixedWidth);
}

- (void)setMaxWidth:(int)maxWidth
{
	gtk_tree_view_column_set_max_width((GtkTreeViewColumn*)[self castedGObject], maxWidth);
}

- (void)setMinWidth:(int)minWidth
{
	gtk_tree_view_column_set_min_width((GtkTreeViewColumn*)[self castedGObject], minWidth);
}

- (void)setReorderable:(bool)reorderable
{
	gtk_tree_view_column_set_reorderable((GtkTreeViewColumn*)[self castedGObject], reorderable);
}

- (void)setResizable:(bool)resizable
{
	gtk_tree_view_column_set_resizable((GtkTreeViewColumn*)[self castedGObject], resizable);
}

- (void)setSizingWithType:(GtkTreeViewColumnSizing)type
{
	gtk_tree_view_column_set_sizing((GtkTreeViewColumn*)[self castedGObject], type);
}

- (void)setSortColumnId:(int)sortColumnId
{
	gtk_tree_view_column_set_sort_column_id((GtkTreeViewColumn*)[self castedGObject], sortColumnId);
}

- (void)setSortIndicatorWithSetting:(bool)setting
{
	gtk_tree_view_column_set_sort_indicator((GtkTreeViewColumn*)[self castedGObject], setting);
}

- (void)setSortOrder:(GtkSortType)order
{
	gtk_tree_view_column_set_sort_order((GtkTreeViewColumn*)[self castedGObject], order);
}

- (void)setSpacing:(int)spacing
{
	gtk_tree_view_column_set_spacing((GtkTreeViewColumn*)[self castedGObject], spacing);
}

- (void)setTitle:(OFString*)title
{
	gtk_tree_view_column_set_title((GtkTreeViewColumn*)[self castedGObject], [title UTF8String]);
}

- (void)setVisible:(bool)visible
{
	gtk_tree_view_column_set_visible((GtkTreeViewColumn*)[self castedGObject], visible);
}

- (void)setWidget:(OGTKWidget*)widget
{
	gtk_tree_view_column_set_widget((GtkTreeViewColumn*)[self castedGObject], [widget castedGObject]);
}


@end