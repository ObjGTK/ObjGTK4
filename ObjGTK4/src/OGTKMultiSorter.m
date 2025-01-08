/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiSorter.h"

@implementation OGTKMultiSorter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MULTI_SORTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkMultiSorter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_multi_sorter_new(), GtkMultiSorter, GtkMultiSorter);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkMultiSorter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkMultiSorter, GtkMultiSorter);
}

- (void)append:(OGTKSorter*)sorter
{
	gtk_multi_sorter_append([self castedGObject], [sorter castedGObject]);
}

- (void)remove:(guint)position
{
	gtk_multi_sorter_remove([self castedGObject], position);
}


@end