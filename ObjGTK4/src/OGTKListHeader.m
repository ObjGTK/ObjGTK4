/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListHeader.h"

#import "OGTKWidget.h"

@implementation OGTKListHeader

- (GtkListHeader*)castedGObject
{
	return GTK_LIST_HEADER([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_list_header_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (guint)end
{
	guint returnValue = gtk_list_header_get_end([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = gtk_list_header_get_item([self castedGObject]);

	return returnValue;
}

- (guint)nitems
{
	guint returnValue = gtk_list_header_get_n_items([self castedGObject]);

	return returnValue;
}

- (guint)start
{
	guint returnValue = gtk_list_header_get_start([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_list_header_set_child([self castedGObject], [child castedGObject]);
}


@end