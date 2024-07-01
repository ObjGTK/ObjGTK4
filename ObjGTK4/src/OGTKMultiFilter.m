/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiFilter.h"

@implementation OGTKMultiFilter

- (GtkMultiFilter*)castedGObject
{
	return GTK_MULTI_FILTER([self gObject]);
}

- (void)append:(OGTKFilter*)filter
{
	gtk_multi_filter_append([self castedGObject], [filter castedGObject]);
}

- (void)remove:(guint)position
{
	gtk_multi_filter_remove([self castedGObject], position);
}


@end