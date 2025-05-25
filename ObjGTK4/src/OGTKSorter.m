/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

@implementation OGTKSorter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SORTER);
	return gObjectClass;
}

- (GtkSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SORTER, GtkSorter);
}

- (void)changedWithChange:(GtkSorterChange)change
{
	gtk_sorter_changed((GtkSorter*)[self castedGObject], change);
}

- (GtkOrdering)compareWithItem1:(gpointer)item1 item2:(gpointer)item2
{
	GtkOrdering returnValue = (GtkOrdering)gtk_sorter_compare((GtkSorter*)[self castedGObject], item1, item2);

	return returnValue;
}

- (GtkSorterOrder)order
{
	GtkSorterOrder returnValue = (GtkSorterOrder)gtk_sorter_get_order((GtkSorter*)[self castedGObject]);

	return returnValue;
}


@end