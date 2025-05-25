/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGridView.h"

#import "OGTKListItemFactory.h"
#import "OGTKWidget.h"

@implementation OGTKGridView

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GRID_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GRID_VIEW);
	return gObjectClass;
}

+ (instancetype)gridViewWithModel:(GtkSelectionModel*)model factory:(OGTKListItemFactory*)factory
{
	GtkGridView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_grid_view_new(model, [factory castedGObject]), GTK_TYPE_GRID_VIEW, GtkGridView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKGridView* wrapperObject;
	@try {
		wrapperObject = [[OGTKGridView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGridView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GRID_VIEW, GtkGridView);
}

- (bool)enableRubberband
{
	bool returnValue = (bool)gtk_grid_view_get_enable_rubberband((GtkGridView*)[self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = gtk_grid_view_get_factory((GtkGridView*)[self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)maxColumns
{
	guint returnValue = (guint)gtk_grid_view_get_max_columns((GtkGridView*)[self castedGObject]);

	return returnValue;
}

- (guint)minColumns
{
	guint returnValue = (guint)gtk_grid_view_get_min_columns((GtkGridView*)[self castedGObject]);

	return returnValue;
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = (GtkSelectionModel*)gtk_grid_view_get_model((GtkGridView*)[self castedGObject]);

	return returnValue;
}

- (bool)singleClickActivate
{
	bool returnValue = (bool)gtk_grid_view_get_single_click_activate((GtkGridView*)[self castedGObject]);

	return returnValue;
}

- (GtkListTabBehavior)tabBehavior
{
	GtkListTabBehavior returnValue = (GtkListTabBehavior)gtk_grid_view_get_tab_behavior((GtkGridView*)[self castedGObject]);

	return returnValue;
}

- (void)scrollToWithPos:(guint)pos flags:(GtkListScrollFlags)flags scroll:(GtkScrollInfo*)scroll
{
	gtk_grid_view_scroll_to((GtkGridView*)[self castedGObject], pos, flags, scroll);
}

- (void)setEnableRubberband:(bool)enableRubberband
{
	gtk_grid_view_set_enable_rubberband((GtkGridView*)[self castedGObject], enableRubberband);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_grid_view_set_factory((GtkGridView*)[self castedGObject], [factory castedGObject]);
}

- (void)setMaxColumns:(guint)maxColumns
{
	gtk_grid_view_set_max_columns((GtkGridView*)[self castedGObject], maxColumns);
}

- (void)setMinColumns:(guint)minColumns
{
	gtk_grid_view_set_min_columns((GtkGridView*)[self castedGObject], minColumns);
}

- (void)setModel:(GtkSelectionModel*)model
{
	gtk_grid_view_set_model((GtkGridView*)[self castedGObject], model);
}

- (void)setSingleClickActivate:(bool)singleClickActivate
{
	gtk_grid_view_set_single_click_activate((GtkGridView*)[self castedGObject], singleClickActivate);
}

- (void)setTabBehavior:(GtkListTabBehavior)tabBehavior
{
	gtk_grid_view_set_tab_behavior((GtkGridView*)[self castedGObject], tabBehavior);
}


@end