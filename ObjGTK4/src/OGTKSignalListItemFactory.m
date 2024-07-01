/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSignalListItemFactory.h"

@implementation OGTKSignalListItemFactory

- (instancetype)init
{
	GtkSignalListItemFactory* gobjectValue = GTK_SIGNAL_LIST_ITEM_FACTORY(gtk_signal_list_item_factory_new());

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

- (GtkSignalListItemFactory*)castedGObject
{
	return GTK_SIGNAL_LIST_ITEM_FACTORY([self gObject]);
}


@end