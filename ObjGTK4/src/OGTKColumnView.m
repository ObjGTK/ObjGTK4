/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnView.h"

#import "OGTKSorter.h"
#import "OGTKColumnViewColumn.h"
#import "OGTKListItemFactory.h"

@implementation OGTKColumnView

- (instancetype)init:(GtkSelectionModel*)model
{
	GtkColumnView* gobjectValue = GTK_COLUMN_VIEW(gtk_column_view_new(model));

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

- (GtkColumnView*)castedGObject
{
	return GTK_COLUMN_VIEW([self gObject]);
}

- (void)appendColumn:(OGTKColumnViewColumn*)column
{
	gtk_column_view_append_column([self castedGObject], [column castedGObject]);
}

- (GListModel*)columns
{
	GListModel* returnValue = gtk_column_view_get_columns([self castedGObject]);

	return returnValue;
}

- (bool)enableRubberband
{
	bool returnValue = gtk_column_view_get_enable_rubberband([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)headerFactory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_column_view_get_header_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (GtkSelectionModel*)model
{
	GtkSelectionModel* returnValue = gtk_column_view_get_model([self castedGObject]);

	return returnValue;
}

- (bool)reorderable
{
	bool returnValue = gtk_column_view_get_reorderable([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)rowFactory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_column_view_get_row_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (bool)showColumnSeparators
{
	bool returnValue = gtk_column_view_get_show_column_separators([self castedGObject]);

	return returnValue;
}

- (bool)showRowSeparators
{
	bool returnValue = gtk_column_view_get_show_row_separators([self castedGObject]);

	return returnValue;
}

- (bool)singleClickActivate
{
	bool returnValue = gtk_column_view_get_single_click_activate([self castedGObject]);

	return returnValue;
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = GTK_SORTER(gtk_column_view_get_sorter([self castedGObject]));

	OGTKSorter* returnValue = [OGTKSorter withGObject:gobjectValue];
	return returnValue;
}

- (GtkListTabBehavior)tabBehavior
{
	GtkListTabBehavior returnValue = gtk_column_view_get_tab_behavior([self castedGObject]);

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

- (void)sortByColumnWithColumn:(OGTKColumnViewColumn*)column direction:(GtkSortType)direction
{
	gtk_column_view_sort_by_column([self castedGObject], [column castedGObject], direction);
}


@end