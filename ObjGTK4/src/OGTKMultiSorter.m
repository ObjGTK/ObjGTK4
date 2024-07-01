/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiSorter.h"

@implementation OGTKMultiSorter

- (instancetype)init
{
	GtkMultiSorter* gobjectValue = GTK_MULTI_SORTER(gtk_multi_sorter_new());

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
	return GTK_MULTI_SORTER([self gObject]);
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