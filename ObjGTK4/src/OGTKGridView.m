/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGridView.h"

#import "OGTKListItemFactory.h"
#import "OGTKWidget.h"

@implementation OGTKGridView

- (instancetype)initWithModel:(GtkSelectionModel*)model factory:(OGTKListItemFactory*)factory
{
	GtkGridView* gobjectValue = GTK_GRID_VIEW(gtk_grid_view_new(model, [factory castedGObject]));

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkGridView*)castedGObject
{
	return GTK_GRID_VIEW([self gObject]);
}

- (bool)enableRubberband
{
	bool returnValue = gtk_grid_view_get_enable_rubberband([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_grid_view_get_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (guint)maxColumns
{
	guint returnValue = gtk_grid_view_get_max_columns([self castedGObject]);

	return returnValue;
}

- (guint)minColumns
{
	guint returnValue = gtk_grid_view_get_min_columns([self castedGObject]);

	return returnValue;
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = gtk_grid_view_get_model([self castedGObject]);

	return returnValue;
}

- (bool)singleClickActivate
{
	bool returnValue = gtk_grid_view_get_single_click_activate([self castedGObject]);

	return returnValue;
}

- (GtkListTabBehavior)tabBehavior
{
	GtkListTabBehavior returnValue = gtk_grid_view_get_tab_behavior([self castedGObject]);

	return returnValue;
}

- (void)scrollToWithPos:(guint)pos flags:(GtkListScrollFlags)flags scroll:(GtkScrollInfo*)scroll
{
	gtk_grid_view_scroll_to([self castedGObject], pos, flags, scroll);
}

- (void)setEnableRubberband:(bool)enableRubberband
{
	gtk_grid_view_set_enable_rubberband([self castedGObject], enableRubberband);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_grid_view_set_factory([self castedGObject], [factory castedGObject]);
}

- (void)setMaxColumns:(guint)maxColumns
{
	gtk_grid_view_set_max_columns([self castedGObject], maxColumns);
}

- (void)setMinColumns:(guint)minColumns
{
	gtk_grid_view_set_min_columns([self castedGObject], minColumns);
}

- (void)setModel:(GtkSelectionModel*)model
{
	gtk_grid_view_set_model([self castedGObject], model);
}

- (void)setSingleClickActivate:(bool)singleClickActivate
{
	gtk_grid_view_set_single_click_activate([self castedGObject], singleClickActivate);
}

- (void)setTabBehavior:(GtkListTabBehavior)tabBehavior
{
	gtk_grid_view_set_tab_behavior([self castedGObject], tabBehavior);
}


@end