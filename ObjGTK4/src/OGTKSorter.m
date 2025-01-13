/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

@implementation OGTKSorter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSorter, GtkSorter);
}

- (void)changedWithChange:(GtkSorterChange)change
{
	gtk_sorter_changed([self castedGObject], change);
}

- (GtkOrdering)compareWithItem1:(gpointer)item1 item2:(gpointer)item2
{
	GtkOrdering returnValue = (GtkOrdering)gtk_sorter_compare([self castedGObject], item1, item2);

	return returnValue;
}

- (GtkSorterOrder)order
{
	GtkSorterOrder returnValue = (GtkSorterOrder)gtk_sorter_get_order([self castedGObject]);

	return returnValue;
}


@end