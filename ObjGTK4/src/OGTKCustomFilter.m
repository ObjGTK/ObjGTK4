/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCustomFilter.h"

@implementation OGTKCustomFilter

- (instancetype)initWithMatchFunc:(GtkCustomFilterFunc)matchFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkCustomFilter* gobjectValue = GTK_CUSTOM_FILTER(gtk_custom_filter_new(matchFunc, userData, userDestroy));

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

- (GtkCustomFilter*)castedGObject
{
	return GTK_CUSTOM_FILTER([self gObject]);
}

- (void)setFilterFuncWithMatchFunc:(GtkCustomFilterFunc)matchFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	gtk_custom_filter_set_filter_func([self castedGObject], matchFunc, userData, userDestroy);
}


@end