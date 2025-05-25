/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

@implementation OGTKFilter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FILTER);
	return gObjectClass;
}

- (GtkFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FILTER, GtkFilter);
}

- (void)changedWithChange:(GtkFilterChange)change
{
	gtk_filter_changed((GtkFilter*)[self castedGObject], change);
}

- (GtkFilterMatch)strictness
{
	GtkFilterMatch returnValue = (GtkFilterMatch)gtk_filter_get_strictness((GtkFilter*)[self castedGObject]);

	return returnValue;
}

- (bool)matchWithItem:(gpointer)item
{
	bool returnValue = (bool)gtk_filter_match((GtkFilter*)[self castedGObject], item);

	return returnValue;
}


@end