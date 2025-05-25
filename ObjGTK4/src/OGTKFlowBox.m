/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFlowBox.h"

#import "OGTKAdjustment.h"
#import "OGTKFlowBoxChild.h"

@implementation OGTKFlowBox

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FLOW_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FLOW_BOX);
	return gObjectClass;
}

+ (instancetype)flowBox
{
	GtkFlowBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_flow_box_new(), GTK_TYPE_FLOW_BOX, GtkFlowBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKFlowBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKFlowBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFlowBox*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FLOW_BOX, GtkFlowBox);
}

- (void)appendWithChild:(OGTKWidget*)child
{
	gtk_flow_box_append((GtkFlowBox*)[self castedGObject], [child castedGObject]);
}

- (void)bindModel:(GListModel*)model createWidgetFunc:(GtkFlowBoxCreateWidgetFunc)createWidgetFunc userData:(gpointer)userData userDataFreeFunc:(GDestroyNotify)userDataFreeFunc
{
	gtk_flow_box_bind_model((GtkFlowBox*)[self castedGObject], model, createWidgetFunc, userData, userDataFreeFunc);
}

- (bool)activateOnSingleClick
{
	bool returnValue = (bool)gtk_flow_box_get_activate_on_single_click((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (OGTKFlowBoxChild*)childAtIndexWithIdx:(int)idx
{
	GtkFlowBoxChild* gobjectValue = gtk_flow_box_get_child_at_index((GtkFlowBox*)[self castedGObject], idx);

	OGTKFlowBoxChild* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKFlowBoxChild*)childAtPosWithX:(int)x y:(int)y
{
	GtkFlowBoxChild* gobjectValue = gtk_flow_box_get_child_at_pos((GtkFlowBox*)[self castedGObject], x, y);

	OGTKFlowBoxChild* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)columnSpacing
{
	guint returnValue = (guint)gtk_flow_box_get_column_spacing((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (bool)homogeneous
{
	bool returnValue = (bool)gtk_flow_box_get_homogeneous((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (guint)maxChildrenPerLine
{
	guint returnValue = (guint)gtk_flow_box_get_max_children_per_line((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (guint)minChildrenPerLine
{
	guint returnValue = (guint)gtk_flow_box_get_min_children_per_line((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (guint)rowSpacing
{
	guint returnValue = (guint)gtk_flow_box_get_row_spacing((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (GList*)selectedChildren
{
	GList* returnValue = (GList*)gtk_flow_box_get_selected_children((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (GtkSelectionMode)selectionMode
{
	GtkSelectionMode returnValue = (GtkSelectionMode)gtk_flow_box_get_selection_mode((GtkFlowBox*)[self castedGObject]);

	return returnValue;
}

- (void)insertWithWidget:(OGTKWidget*)widget position:(int)position
{
	gtk_flow_box_insert((GtkFlowBox*)[self castedGObject], [widget castedGObject], position);
}

- (void)invalidateFilter
{
	gtk_flow_box_invalidate_filter((GtkFlowBox*)[self castedGObject]);
}

- (void)invalidateSort
{
	gtk_flow_box_invalidate_sort((GtkFlowBox*)[self castedGObject]);
}

- (void)prependWithChild:(OGTKWidget*)child
{
	gtk_flow_box_prepend((GtkFlowBox*)[self castedGObject], [child castedGObject]);
}

- (void)removeWithWidget:(OGTKWidget*)widget
{
	gtk_flow_box_remove((GtkFlowBox*)[self castedGObject], [widget castedGObject]);
}

- (void)removeAll
{
	gtk_flow_box_remove_all((GtkFlowBox*)[self castedGObject]);
}

- (void)selectAll
{
	gtk_flow_box_select_all((GtkFlowBox*)[self castedGObject]);
}

- (void)selectChild:(OGTKFlowBoxChild*)child
{
	gtk_flow_box_select_child((GtkFlowBox*)[self castedGObject], [child castedGObject]);
}

- (void)selectedForeachWithFunc:(GtkFlowBoxForeachFunc)func data:(gpointer)data
{
	gtk_flow_box_selected_foreach((GtkFlowBox*)[self castedGObject], func, data);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_flow_box_set_activate_on_single_click((GtkFlowBox*)[self castedGObject], single);
}

- (void)setColumnSpacing:(guint)spacing
{
	gtk_flow_box_set_column_spacing((GtkFlowBox*)[self castedGObject], spacing);
}

- (void)setFilterFunc:(GtkFlowBoxFilterFunc)filterFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_flow_box_set_filter_func((GtkFlowBox*)[self castedGObject], filterFunc, userData, destroy);
}

- (void)setHadjustment:(OGTKAdjustment*)adjustment
{
	gtk_flow_box_set_hadjustment((GtkFlowBox*)[self castedGObject], [adjustment castedGObject]);
}

- (void)setHomogeneous:(bool)homogeneous
{
	gtk_flow_box_set_homogeneous((GtkFlowBox*)[self castedGObject], homogeneous);
}

- (void)setMaxChildrenPerLineWithNchildren:(guint)nchildren
{
	gtk_flow_box_set_max_children_per_line((GtkFlowBox*)[self castedGObject], nchildren);
}

- (void)setMinChildrenPerLine:(guint)nchildren
{
	gtk_flow_box_set_min_children_per_line((GtkFlowBox*)[self castedGObject], nchildren);
}

- (void)setRowSpacing:(guint)spacing
{
	gtk_flow_box_set_row_spacing((GtkFlowBox*)[self castedGObject], spacing);
}

- (void)setSelectionMode:(GtkSelectionMode)mode
{
	gtk_flow_box_set_selection_mode((GtkFlowBox*)[self castedGObject], mode);
}

- (void)setSortFunc:(GtkFlowBoxSortFunc)sortFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_flow_box_set_sort_func((GtkFlowBox*)[self castedGObject], sortFunc, userData, destroy);
}

- (void)setVadjustment:(OGTKAdjustment*)adjustment
{
	gtk_flow_box_set_vadjustment((GtkFlowBox*)[self castedGObject], [adjustment castedGObject]);
}

- (void)unselectAll
{
	gtk_flow_box_unselect_all((GtkFlowBox*)[self castedGObject]);
}

- (void)unselectChild:(OGTKFlowBoxChild*)child
{
	gtk_flow_box_unselect_child((GtkFlowBox*)[self castedGObject], [child castedGObject]);
}


@end