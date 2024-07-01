/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKOverlayLayout.h"

@implementation OGTKOverlayLayout

- (instancetype)init
{
	GtkOverlayLayout* gobjectValue = GTK_OVERLAY_LAYOUT(gtk_overlay_layout_new());

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

- (GtkOverlayLayout*)castedGObject
{
	return GTK_OVERLAY_LAYOUT([self gObject]);
}


@end