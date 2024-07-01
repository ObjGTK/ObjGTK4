/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

@implementation OGTKSorter

- (GtkSorter*)castedGObject
{
	return GTK_SORTER([self gObject]);
}

- (void)changed:(GtkSorterChange)change
{
	gtk_sorter_changed([self castedGObject], change);
}

- (GtkOrdering)compareWithItem1:(gpointer)item1 item2:(gpointer)item2
{
	GtkOrdering returnValue = gtk_sorter_compare([self castedGObject], item1, item2);

	return returnValue;
}

- (GtkSorterOrder)order
{
	GtkSorterOrder returnValue = gtk_sorter_get_order([self castedGObject]);

	return returnValue;
}


@end