/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewColumn.h"

#import "OGTKColumnView.h"
#import "OGTKListItemFactory.h"
#import <OGio/OGMenuModel.h>
#import "OGTKSorter.h"

@implementation OGTKColumnViewColumn

- (instancetype)initWithTitle:(OFString*)title factory:(OGTKListItemFactory*)factory
{
	GtkColumnViewColumn* gobjectValue = GTK_COLUMN_VIEW_COLUMN(gtk_column_view_column_new([title UTF8String], [factory castedGObject]));

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

- (GtkColumnViewColumn*)castedGObject
{
	return GTK_COLUMN_VIEW_COLUMN([self gObject]);
}

- (OGTKColumnView*)columnView
{
	GtkColumnView* gobjectValue = GTK_COLUMN_VIEW(gtk_column_view_column_get_column_view([self castedGObject]));

	OGTKColumnView* returnValue = [OGTKColumnView withGObject:gobjectValue];
	return returnValue;
}

- (bool)expand
{
	bool returnValue = gtk_column_view_column_get_expand([self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = GTK_LIST_ITEM_FACTORY(gtk_column_view_column_get_factory([self castedGObject]));

	OGTKListItemFactory* returnValue = [OGTKListItemFactory withGObject:gobjectValue];
	return returnValue;
}

- (int)fixedWidth
{
	int returnValue = gtk_column_view_column_get_fixed_width([self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)headerMenu
{
	GMenuModel* gobjectValue = G_MENU_MODEL(gtk_column_view_column_get_header_menu([self castedGObject]));

	OGMenuModel* returnValue = [OGMenuModel withGObject:gobjectValue];
	return returnValue;
}

- (bool)resizable
{
	bool returnValue = gtk_column_view_column_get_resizable([self castedGObject]);

	return returnValue;
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = GTK_SORTER(gtk_column_view_column_get_sorter([self castedGObject]));

	OGTKSorter* returnValue = [OGTKSorter withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_column_view_column_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)visible
{
	bool returnValue = gtk_column_view_column_get_visible([self castedGObject]);

	return returnValue;
}

- (void)setExpand:(bool)expand
{
	gtk_column_view_column_set_expand([self castedGObject], expand);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_column_view_column_set_factory([self castedGObject], [factory castedGObject]);
}

- (void)setFixedWidth:(int)fixedWidth
{
	gtk_column_view_column_set_fixed_width([self castedGObject], fixedWidth);
}

- (void)setHeaderMenu:(OGMenuModel*)menu
{
	gtk_column_view_column_set_header_menu([self castedGObject], [menu castedGObject]);
}

- (void)setResizable:(bool)resizable
{
	gtk_column_view_column_set_resizable([self castedGObject], resizable);
}

- (void)setSorter:(OGTKSorter*)sorter
{
	gtk_column_view_column_set_sorter([self castedGObject], [sorter castedGObject]);
}

- (void)setTitle:(OFString*)title
{
	gtk_column_view_column_set_title([self castedGObject], [title UTF8String]);
}

- (void)setVisible:(bool)visible
{
	gtk_column_view_column_set_visible([self castedGObject], visible);
}


@end