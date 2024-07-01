/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

@implementation OGTKFilter

- (GtkFilter*)castedGObject
{
	return GTK_FILTER([self gObject]);
}

- (void)changed:(GtkFilterChange)change
{
	gtk_filter_changed([self castedGObject], change);
}

- (GtkFilterMatch)strictness
{
	GtkFilterMatch returnValue = gtk_filter_get_strictness([self castedGObject]);

	return returnValue;
}

- (bool)match:(gpointer)item
{
	bool returnValue = gtk_filter_match([self castedGObject], item);

	return returnValue;
}


@end