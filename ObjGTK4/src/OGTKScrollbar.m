/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScrollbar.h"

#import "OGTKAdjustment.h"

@implementation OGTKScrollbar

- (instancetype)initWithOrientation:(GtkOrientation)orientation adjustment:(OGTKAdjustment*)adjustment
{
	GtkScrollbar* gobjectValue = GTK_SCROLLBAR(gtk_scrollbar_new(orientation, [adjustment castedGObject]));

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

- (GtkScrollbar*)castedGObject
{
	return GTK_SCROLLBAR([self gObject]);
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = GTK_ADJUSTMENT(gtk_scrollbar_get_adjustment([self castedGObject]));

	OGTKAdjustment* returnValue = [OGTKAdjustment withGObject:gobjectValue];
	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_scrollbar_set_adjustment([self castedGObject], [adjustment castedGObject]);
}


@end