/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListBox.h"

#import "OGTKAdjustment.h"
#import "OGTKListBoxRow.h"

@implementation OGTKListBox

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)listBox
{
	GtkListBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_list_box_new(), GtkListBox, GtkListBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKListBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKListBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkListBox*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkListBox, GtkListBox);
}

- (void)appendWithChild:(OGTKWidget*)child
{
	gtk_list_box_append([self castedGObject], [child castedGObject]);
}

- (void)bindModel:(GListModel*)model createWidgetFunc:(GtkListBoxCreateWidgetFunc)createWidgetFunc userData:(gpointer)userData userDataFreeFunc:(GDestroyNotify)userDataFreeFunc
{
	gtk_list_box_bind_model([self castedGObject], model, createWidgetFunc, userData, userDataFreeFunc);
}

- (void)dragHighlightRow:(OGTKListBoxRow*)row
{
	gtk_list_box_drag_highlight_row([self castedGObject], [row castedGObject]);
}

- (void)dragUnhighlightRow
{
	gtk_list_box_drag_unhighlight_row([self castedGObject]);
}

- (bool)activateOnSingleClick
{
	bool returnValue = (bool)gtk_list_box_get_activate_on_single_click([self castedGObject]);

	return returnValue;
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = gtk_list_box_get_adjustment([self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListBoxRow*)rowAtIndex:(int)index
{
	GtkListBoxRow* gobjectValue = gtk_list_box_get_row_at_index([self castedGObject], index);

	OGTKListBoxRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListBoxRow*)rowAtY:(int)y
{
	GtkListBoxRow* gobjectValue = gtk_list_box_get_row_at_y([self castedGObject], y);

	OGTKListBoxRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListBoxRow*)selectedRow
{
	GtkListBoxRow* gobjectValue = gtk_list_box_get_selected_row([self castedGObject]);

	OGTKListBoxRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)selectedRows
{
	GList* returnValue = (GList*)gtk_list_box_get_selected_rows([self castedGObject]);

	return returnValue;
}

- (GtkSelectionMode)selectionMode
{
	GtkSelectionMode returnValue = (GtkSelectionMode)gtk_list_box_get_selection_mode([self castedGObject]);

	return returnValue;
}

- (bool)showSeparators
{
	bool returnValue = (bool)gtk_list_box_get_show_separators([self castedGObject]);

	return returnValue;
}

- (void)insertWithChild:(OGTKWidget*)child position:(int)position
{
	gtk_list_box_insert([self castedGObject], [child castedGObject], position);
}

- (void)invalidateFilter
{
	gtk_list_box_invalidate_filter([self castedGObject]);
}

- (void)invalidateHeaders
{
	gtk_list_box_invalidate_headers([self castedGObject]);
}

- (void)invalidateSort
{
	gtk_list_box_invalidate_sort([self castedGObject]);
}

- (void)prependWithChild:(OGTKWidget*)child
{
	gtk_list_box_prepend([self castedGObject], [child castedGObject]);
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_list_box_remove([self castedGObject], [child castedGObject]);
}

- (void)removeAll
{
	gtk_list_box_remove_all([self castedGObject]);
}

- (void)selectAll
{
	gtk_list_box_select_all([self castedGObject]);
}

- (void)selectRow:(OGTKListBoxRow*)row
{
	gtk_list_box_select_row([self castedGObject], [row castedGObject]);
}

- (void)selectedForeachWithFunc:(GtkListBoxForeachFunc)func data:(gpointer)data
{
	gtk_list_box_selected_foreach([self castedGObject], func, data);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_list_box_set_activate_on_single_click([self castedGObject], single);
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_list_box_set_adjustment([self castedGObject], [adjustment castedGObject]);
}

- (void)setFilterFunc:(GtkListBoxFilterFunc)filterFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_list_box_set_filter_func([self castedGObject], filterFunc, userData, destroy);
}

- (void)setHeaderFuncWithUpdateHeader:(GtkListBoxUpdateHeaderFunc)updateHeader userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_list_box_set_header_func([self castedGObject], updateHeader, userData, destroy);
}

- (void)setPlaceholder:(OGTKWidget*)placeholder
{
	gtk_list_box_set_placeholder([self castedGObject], [placeholder castedGObject]);
}

- (void)setSelectionMode:(GtkSelectionMode)mode
{
	gtk_list_box_set_selection_mode([self castedGObject], mode);
}

- (void)setShowSeparators:(bool)showSeparators
{
	gtk_list_box_set_show_separators([self castedGObject], showSeparators);
}

- (void)setSortFunc:(GtkListBoxSortFunc)sortFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_list_box_set_sort_func([self castedGObject], sortFunc, userData, destroy);
}

- (void)unselectAll
{
	gtk_list_box_unselect_all([self castedGObject]);
}

- (void)unselectRow:(OGTKListBoxRow*)row
{
	gtk_list_box_unselect_row([self castedGObject], [row castedGObject]);
}


@end