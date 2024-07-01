/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEveryFilter.h"

@implementation OGTKEveryFilter

- (instancetype)init
{
	GtkEveryFilter* gobjectValue = GTK_EVERY_FILTER(gtk_every_filter_new());

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

- (GtkEveryFilter*)castedGObject
{
	return GTK_EVERY_FILTER([self gObject]);
}


@end