/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListView.h"

#import "OGTKWidget.h"
#import "OGTKListItemFactory.h"

@implementation OGTKListView

- (instancetype)initWithModel:(GtkSelectionModel*)model factory:(OGTKListItemFactory*)factory
{
	GtkListView* gobjectValue = GTK_LIST_VIEW(gtk_list_view_new(model, [factory castedGObject]));

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

- (GtkListView*)castedGObject
{
	return GTK_LIST_VIEW([self gObject]);
}

- (bool)enableRubberband
{
	bool returnValue = gtk_list_view_get_enable_rubberband([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_list_view_get_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (OGTKListItemFactory*)headerFactory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_list_view_get_header_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = gtk_list_view_get_model([self castedGObject]);

	return returnValue;
}

- (bool)showSeparators
{
	bool returnValue = gtk_list_view_get_show_separators([self castedGObject]);

	return returnValue;
}

- (bool)singleClickActivate
{
	bool returnValue = gtk_list_view_get_single_click_activate([self castedGObject]);

	return returnValue;
}

- (GtkListTabBehavior)tabBehavior
{
	GtkListTabBehavior returnValue = gtk_list_view_get_tab_behavior([self castedGObject]);

	return returnValue;
}

- (void)scrollToWithPos:(guint)pos flags:(GtkListScrollFlags)flags scroll:(GtkScrollInfo*)scroll
{
	gtk_list_view_scroll_to([self castedGObject], pos, flags, scroll);
}

- (void)setEnableRubberband:(bool)enableRubberband
{
	gtk_list_view_set_enable_rubberband([self castedGObject], enableRubberband);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_list_view_set_factory([self castedGObject], [factory castedGObject]);
}

- (void)setHeaderFactory:(OGTKListItemFactory*)factory
{
	gtk_list_view_set_header_factory([self castedGObject], [factory castedGObject]);
}

- (void)setModel:(GtkSelectionModel*)model
{
	gtk_list_view_set_model([self castedGObject], model);
}

- (void)setShowSeparators:(bool)showSeparators
{
	gtk_list_view_set_show_separators([self castedGObject], showSeparators);
}

- (void)setSingleClickActivate:(bool)singleClickActivate
{
	gtk_list_view_set_single_click_activate([self castedGObject], singleClickActivate);
}

- (void)setTabBehavior:(GtkListTabBehavior)tabBehavior
{
	gtk_list_view_set_tab_behavior([self castedGObject], tabBehavior);
}


@end