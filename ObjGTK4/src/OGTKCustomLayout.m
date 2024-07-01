/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCustomLayout.h"

@implementation OGTKCustomLayout

- (instancetype)initWithRequestMode:(GtkCustomRequestModeFunc)requestMode measure:(GtkCustomMeasureFunc)measure allocate:(GtkCustomAllocateFunc)allocate
{
	GtkCustomLayout* gobjectValue = GTK_CUSTOM_LAYOUT(gtk_custom_layout_new(requestMode, measure, allocate));

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

- (GtkCustomLayout*)castedGObject
{
	return GTK_CUSTOM_LAYOUT([self gObject]);
}


@end