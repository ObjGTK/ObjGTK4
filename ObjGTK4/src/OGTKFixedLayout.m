/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFixedLayout.h"

@implementation OGTKFixedLayout

- (instancetype)init
{
	GtkFixedLayout* gobjectValue = GTK_FIXED_LAYOUT(gtk_fixed_layout_new());

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

- (GtkFixedLayout*)castedGObject
{
	return GTK_FIXED_LAYOUT([self gObject]);
}


@end