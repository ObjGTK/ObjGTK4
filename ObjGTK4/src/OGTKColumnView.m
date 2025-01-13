/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnView.h"

#import "OGTKColumnViewColumn.h"
#import "OGTKListItemFactory.h"
#import "OGTKSorter.h"

@implementation OGTKColumnView

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLUMN_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)columnViewWithModel:(GtkSelectionModel*)model
{
	GtkColumnView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_column_view_new(model), GtkColumnView, GtkColumnView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKColumnView* wrapperObject;
	@try {
		wrapperObject = [[OGTKColumnView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkColumnView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkColumnView, GtkColumnView);
}

- (void)appendColumn:(OGTKColumnViewColumn*)column
{
	gtk_column_view_append_column([self castedGObject], [column castedGObject]);
}

- (GListModel*)columns
{
	GListModel* returnValue = (GListModel*)gtk_column_view_get_columns([self castedGObject]);

	return returnValue;
}

- (bool)enableRubberband
{
	bool returnValue = (bool)gtk_column_view_get_enable_rubberband([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)headerFactory
{
	GtkListItemFactory* gobjectValue = gtk_column_view_get_header_factory([self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = (GtkSelectionModel*)gtk_column_view_get_model([self castedGObject]);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = (bool)gtk_column_view_get_reorderable([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)rowFactory
{
	GtkListItemFactory* gobjectValue = gtk_column_view_get_row_factory([self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)showColumnSeparators
{
	bool returnValue = (bool)gtk_column_view_get_show_column_separators([self castedGObject]);

	return returnValue;
}

- (bool)showRowSeparators
{
	bool returnValue = (bool)gtk_column_view_get_show_row_separators([self castedGObject]);

	return returnValue;
}

- (bool)singleClickActivate
{
	bool returnValue = (bool)gtk_column_view_get_single_click_activate([self castedGObject]);

	return returnValue;
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = gtk_column_view_get_sorter([self castedGObject]);

	OGTKSorter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkListTabBehavior)tabBehavior
{
	GtkListTabBehavior returnValue = (GtkListTabBehavior)gtk_column_view_get_tab_behavior([self castedGObject]);

	return returnValue;
}

- (void)insertColumnWithPosition:(guint)position column:(OGTKColumnViewColumn*)column
{
	gtk_column_view_insert_column([self castedGObject], position, [column castedGObject]);
}

- (void)removeColumn:(OGTKColumnViewColumn*)column
{
	gtk_column_view_remove_column([self castedGObject], [column castedGObject]);
}

- (void)scrollToWithPos:(guint)pos column:(OGTKColumnViewColumn*)column flags:(GtkListScrollFlags)flags scroll:(GtkScrollInfo*)scroll
{
	gtk_column_view_scroll_to([self castedGObject], pos, [column castedGObject], flags, scroll);
}

- (void)setEnableRubberband:(bool)enableRubberband
{
	gtk_column_view_set_enable_rubberband([self castedGObject], enableRubberband);
}

- (void)setHeaderFactory:(OGTKListItemFactory*)factory
{
	gtk_column_view_set_header_factory([self castedGObject], [factory castedGObject]);
}

- (void)setModel:(GtkSelectionModel*)model
{
	gtk_column_view_set_model([self castedGObject], model);
}

- (void)setReorderable:(bool)reorderable
{
	gtk_column_view_set_reorderable([self castedGObject], reorderable);
}

- (void)setRowFactory:(OGTKListItemFactory*)factory
{
	gtk_column_view_set_row_factory([self castedGObject], [factory castedGObject]);
}

- (void)setShowColumnSeparators:(bool)showColumnSeparators
{
	gtk_column_view_set_show_column_separators([self castedGObject], showColumnSeparators);
}

- (void)setShowRowSeparators:(bool)showRowSeparators
{
	gtk_column_view_set_show_row_separators([self castedGObject], showRowSeparators);
}

- (void)setSingleClickActivate:(bool)singleClickActivate
{
	gtk_column_view_set_single_click_activate([self castedGObject], singleClickActivate);
}

- (void)setTabBehavior:(GtkListTabBehavior)tabBehavior
{
	gtk_column_view_set_tab_behavior([self castedGObject], tabBehavior);
}

- (void)sortByColumn:(OGTKColumnViewColumn*)column direction:(GtkSortType)direction
{
	gtk_column_view_sort_by_column([self castedGObject], [column castedGObject], direction);
}


@end