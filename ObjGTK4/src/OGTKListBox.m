/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListBox.h"

#import "OGTKAdjustment.h"
#import "OGTKListBoxRow.h"

@implementation OGTKListBox

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LIST_BOX);
	return gObjectClass;
}

+ (instancetype)listBox
{
	GtkListBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_list_box_new(), GTK_TYPE_LIST_BOX, GtkListBox);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LIST_BOX, GtkListBox);
}

- (void)appendWithChild:(OGTKWidget*)child
{
	gtk_list_box_append((GtkListBox*)[self castedGObject], [child castedGObject]);
}

- (void)bindModel:(GListModel*)model createWidgetFunc:(GtkListBoxCreateWidgetFunc)createWidgetFunc userData:(gpointer)userData userDataFreeFunc:(GDestroyNotify)userDataFreeFunc
{
	gtk_list_box_bind_model((GtkListBox*)[self castedGObject], model, createWidgetFunc, userData, userDataFreeFunc);
}

- (void)dragHighlightRow:(OGTKListBoxRow*)row
{
	gtk_list_box_drag_highlight_row((GtkListBox*)[self castedGObject], [row castedGObject]);
}

- (void)dragUnhighlightRow
{
	gtk_list_box_drag_unhighlight_row((GtkListBox*)[self castedGObject]);
}

- (bool)activateOnSingleClick
{
	bool returnValue = (bool)gtk_list_box_get_activate_on_single_click((GtkListBox*)[self castedGObject]);

	return returnValue;
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = gtk_list_box_get_adjustment((GtkListBox*)[self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListBoxRow*)rowAtIndex:(int)index
{
	GtkListBoxRow* gobjectValue = gtk_list_box_get_row_at_index((GtkListBox*)[self castedGObject], index);

	OGTKListBoxRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListBoxRow*)rowAtY:(int)y
{
	GtkListBoxRow* gobjectValue = gtk_list_box_get_row_at_y((GtkListBox*)[self castedGObject], y);

	OGTKListBoxRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListBoxRow*)selectedRow
{
	GtkListBoxRow* gobjectValue = gtk_list_box_get_selected_row((GtkListBox*)[self castedGObject]);

	OGTKListBoxRow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)selectedRows
{
	GList* returnValue = (GList*)gtk_list_box_get_selected_rows((GtkListBox*)[self castedGObject]);

	return returnValue;
}

- (GtkSelectionMode)selectionMode
{
	GtkSelectionMode returnValue = (GtkSelectionMode)gtk_list_box_get_selection_mode((GtkListBox*)[self castedGObject]);

	return returnValue;
}

- (bool)showSeparators
{
	bool returnValue = (bool)gtk_list_box_get_show_separators((GtkListBox*)[self castedGObject]);

	return returnValue;
}

- (void)insertWithChild:(OGTKWidget*)child position:(int)position
{
	gtk_list_box_insert((GtkListBox*)[self castedGObject], [child castedGObject], position);
}

- (void)invalidateFilter
{
	gtk_list_box_invalidate_filter((GtkListBox*)[self castedGObject]);
}

- (void)invalidateHeaders
{
	gtk_list_box_invalidate_headers((GtkListBox*)[self castedGObject]);
}

- (void)invalidateSort
{
	gtk_list_box_invalidate_sort((GtkListBox*)[self castedGObject]);
}

- (void)prependWithChild:(OGTKWidget*)child
{
	gtk_list_box_prepend((GtkListBox*)[self castedGObject], [child castedGObject]);
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_list_box_remove((GtkListBox*)[self castedGObject], [child castedGObject]);
}

- (void)removeAll
{
	gtk_list_box_remove_all((GtkListBox*)[self castedGObject]);
}

- (void)selectAll
{
	gtk_list_box_select_all((GtkListBox*)[self castedGObject]);
}

- (void)selectRow:(OGTKListBoxRow*)row
{
	gtk_list_box_select_row((GtkListBox*)[self castedGObject], [row castedGObject]);
}

- (void)selectedForeachWithFunc:(GtkListBoxForeachFunc)func data:(gpointer)data
{
	gtk_list_box_selected_foreach((GtkListBox*)[self castedGObject], func, data);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_list_box_set_activate_on_single_click((GtkListBox*)[self castedGObject], single);
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_list_box_set_adjustment((GtkListBox*)[self castedGObject], [adjustment castedGObject]);
}

- (void)setFilterFunc:(GtkListBoxFilterFunc)filterFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_list_box_set_filter_func((GtkListBox*)[self castedGObject], filterFunc, userData, destroy);
}

- (void)setHeaderFuncWithUpdateHeader:(GtkListBoxUpdateHeaderFunc)updateHeader userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_list_box_set_header_func((GtkListBox*)[self castedGObject], updateHeader, userData, destroy);
}

- (void)setPlaceholder:(OGTKWidget*)placeholder
{
	gtk_list_box_set_placeholder((GtkListBox*)[self castedGObject], [placeholder castedGObject]);
}

- (void)setSelectionMode:(GtkSelectionMode)mode
{
	gtk_list_box_set_selection_mode((GtkListBox*)[self castedGObject], mode);
}

- (void)setShowSeparators:(bool)showSeparators
{
	gtk_list_box_set_show_separators((GtkListBox*)[self castedGObject], showSeparators);
}

- (void)setSortFunc:(GtkListBoxSortFunc)sortFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_list_box_set_sort_func((GtkListBox*)[self castedGObject], sortFunc, userData, destroy);
}

- (void)unselectAll
{
	gtk_list_box_unselect_all((GtkListBox*)[self castedGObject]);
}

- (void)unselectRow:(OGTKListBoxRow*)row
{
	gtk_list_box_unselect_row((GtkListBox*)[self castedGObject], [row castedGObject]);
}


@end