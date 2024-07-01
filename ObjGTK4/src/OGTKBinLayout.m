/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBinLayout.h"

@implementation OGTKBinLayout

- (instancetype)init
{
	GtkBinLayout* gobjectValue = GTK_BIN_LAYOUT(gtk_bin_layout_new());

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

- (GtkBinLayout*)castedGObject
{
	return GTK_BIN_LAYOUT([self gObject]);
}


@end