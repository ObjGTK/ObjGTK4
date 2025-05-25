/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListView.h"

#import "OGTKListItemFactory.h"
#import "OGTKWidget.h"

@implementation OGTKListView

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LIST_VIEW);
	return gObjectClass;
}

+ (instancetype)listViewWithModel:(GtkSelectionModel*)model factory:(OGTKListItemFactory*)factory
{
	GtkListView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_list_view_new(model, [factory castedGObject]), GTK_TYPE_LIST_VIEW, GtkListView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKListView* wrapperObject;
	@try {
		wrapperObject = [[OGTKListView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkListView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LIST_VIEW, GtkListView);
}

- (bool)enableRubberband
{
	bool returnValue = (bool)gtk_list_view_get_enable_rubberband((GtkListView*)[self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = gtk_list_view_get_factory((GtkListView*)[self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKListItemFactory*)headerFactory
{
	GtkListItemFactory* gobjectValue = gtk_list_view_get_header_factory((GtkListView*)[self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = (GtkSelectionModel*)gtk_list_view_get_model((GtkListView*)[self castedGObject]);

	return returnValue;
}

- (bool)showSeparators
{
	bool returnValue = (bool)gtk_list_view_get_show_separators((GtkListView*)[self castedGObject]);

	return returnValue;
}

- (bool)singleClickActivate
{
	bool returnValue = (bool)gtk_list_view_get_single_click_activate((GtkListView*)[self castedGObject]);

	return returnValue;
}

- (GtkListTabBehavior)tabBehavior
{
	GtkListTabBehavior returnValue = (GtkListTabBehavior)gtk_list_view_get_tab_behavior((GtkListView*)[self castedGObject]);

	return returnValue;
}

- (void)scrollToWithPos:(guint)pos flags:(GtkListScrollFlags)flags scroll:(GtkScrollInfo*)scroll
{
	gtk_list_view_scroll_to((GtkListView*)[self castedGObject], pos, flags, scroll);
}

- (void)setEnableRubberband:(bool)enableRubberband
{
	gtk_list_view_set_enable_rubberband((GtkListView*)[self castedGObject], enableRubberband);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_list_view_set_factory((GtkListView*)[self castedGObject], [factory castedGObject]);
}

- (void)setHeaderFactory:(OGTKListItemFactory*)factory
{
	gtk_list_view_set_header_factory((GtkListView*)[self castedGObject], [factory castedGObject]);
}

- (void)setModel:(GtkSelectionModel*)model
{
	gtk_list_view_set_model((GtkListView*)[self castedGObject], model);
}

- (void)setShowSeparators:(bool)showSeparators
{
	gtk_list_view_set_show_separators((GtkListView*)[self castedGObject], showSeparators);
}

- (void)setSingleClickActivate:(bool)singleClickActivate
{
	gtk_list_view_set_single_click_activate((GtkListView*)[self castedGObject], singleClickActivate);
}

- (void)setTabBehavior:(GtkListTabBehavior)tabBehavior
{
	gtk_list_view_set_tab_behavior((GtkListView*)[self castedGObject], tabBehavior);
}


@end