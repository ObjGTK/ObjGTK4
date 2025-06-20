/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewColumn.h"

#import <OGio/OGMenuModel.h>
#import "OGTKColumnView.h"
#import "OGTKListItemFactory.h"
#import "OGTKSorter.h"

@implementation OGTKColumnViewColumn

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLUMN_VIEW_COLUMN;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COLUMN_VIEW_COLUMN);
	return gObjectClass;
}

+ (instancetype)columnViewColumnWithTitle:(OFString*)title factory:(OGTKListItemFactory*)factory
{
	GtkColumnViewColumn* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_column_view_column_new([title UTF8String], [factory castedGObject]), GTK_TYPE_COLUMN_VIEW_COLUMN, GtkColumnViewColumn);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKColumnViewColumn* wrapperObject;
	@try {
		wrapperObject = [[OGTKColumnViewColumn alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkColumnViewColumn*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COLUMN_VIEW_COLUMN, GtkColumnViewColumn);
}

- (OGTKColumnView*)columnView
{
	GtkColumnView* gobjectValue = gtk_column_view_column_get_column_view((GtkColumnViewColumn*)[self castedGObject]);

	OGTKColumnView* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)expand
{
	bool returnValue = (bool)gtk_column_view_column_get_expand((GtkColumnViewColumn*)[self castedGObject]);

	return returnValue;
}

- (OGTKListItemFactory*)factory
{
	GtkListItemFactory* gobjectValue = gtk_column_view_column_get_factory((GtkColumnViewColumn*)[self castedGObject]);

	OGTKListItemFactory* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)fixedWidth
{
	int returnValue = (int)gtk_column_view_column_get_fixed_width((GtkColumnViewColumn*)[self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)headerMenu
{
	GMenuModel* gobjectValue = gtk_column_view_column_get_header_menu((GtkColumnViewColumn*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)id
{
	const char* gobjectValue = gtk_column_view_column_get_id((GtkColumnViewColumn*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)resizable
{
	bool returnValue = (bool)gtk_column_view_column_get_resizable((GtkColumnViewColumn*)[self castedGObject]);

	return returnValue;
}

- (OGTKSorter*)sorter
{
	GtkSorter* gobjectValue = gtk_column_view_column_get_sorter((GtkColumnViewColumn*)[self castedGObject]);

	OGTKSorter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_column_view_column_get_title((GtkColumnViewColumn*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)visible
{
	bool returnValue = (bool)gtk_column_view_column_get_visible((GtkColumnViewColumn*)[self castedGObject]);

	return returnValue;
}

- (void)setExpand:(bool)expand
{
	gtk_column_view_column_set_expand((GtkColumnViewColumn*)[self castedGObject], expand);
}

- (void)setFactory:(OGTKListItemFactory*)factory
{
	gtk_column_view_column_set_factory((GtkColumnViewColumn*)[self castedGObject], [factory castedGObject]);
}

- (void)setFixedWidth:(int)fixedWidth
{
	gtk_column_view_column_set_fixed_width((GtkColumnViewColumn*)[self castedGObject], fixedWidth);
}

- (void)setHeaderMenu:(OGMenuModel*)menu
{
	gtk_column_view_column_set_header_menu((GtkColumnViewColumn*)[self castedGObject], [menu castedGObject]);
}

- (void)setIdWithIdentifier:(OFString*)identifier
{
	gtk_column_view_column_set_id((GtkColumnViewColumn*)[self castedGObject], [identifier UTF8String]);
}

- (void)setResizable:(bool)resizable
{
	gtk_column_view_column_set_resizable((GtkColumnViewColumn*)[self castedGObject], resizable);
}

- (void)setSorter:(OGTKSorter*)sorter
{
	gtk_column_view_column_set_sorter((GtkColumnViewColumn*)[self castedGObject], [sorter castedGObject]);
}

- (void)setTitle:(OFString*)title
{
	gtk_column_view_column_set_title((GtkColumnViewColumn*)[self castedGObject], [title UTF8String]);
}

- (void)setVisible:(bool)visible
{
	gtk_column_view_column_set_visible((GtkColumnViewColumn*)[self castedGObject], visible);
}


@end