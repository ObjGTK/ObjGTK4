/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiFilter.h"

@implementation OGTKMultiFilter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MULTI_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MULTI_FILTER);
	return gObjectClass;
}

- (GtkMultiFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MULTI_FILTER, GtkMultiFilter);
}

- (void)appendWithFilter:(OGTKFilter*)filter
{
	gtk_multi_filter_append((GtkMultiFilter*)[self castedGObject], [filter castedGObject]);
}

- (void)removeWithPosition:(guint)position
{
	gtk_multi_filter_remove((GtkMultiFilter*)[self castedGObject], position);
}


@end