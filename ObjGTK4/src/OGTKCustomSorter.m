/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCustomSorter.h"

@implementation OGTKCustomSorter

- (instancetype)initWithSortFunc:(GCompareDataFunc)sortFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkCustomSorter* gobjectValue = GTK_CUSTOM_SORTER(gtk_custom_sorter_new(sortFunc, userData, userDestroy));

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

- (GtkCustomSorter*)castedGObject
{
	return GTK_CUSTOM_SORTER([self gObject]);
}

- (void)setSortFuncWithSortFunc:(GCompareDataFunc)sortFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	gtk_custom_sorter_set_sort_func([self castedGObject], sortFunc, userData, userDestroy);
}


@end