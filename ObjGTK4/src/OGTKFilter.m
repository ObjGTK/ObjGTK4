/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

@implementation OGTKFilter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFilter, GtkFilter);
}

- (void)changed:(GtkFilterChange)change
{
	gtk_filter_changed([self castedGObject], change);
}

- (GtkFilterMatch)strictness
{
	GtkFilterMatch returnValue = (GtkFilterMatch)gtk_filter_get_strictness([self castedGObject]);

	return returnValue;
}

- (bool)match:(gpointer)item
{
	bool returnValue = (bool)gtk_filter_match([self castedGObject], item);

	return returnValue;
}


@end