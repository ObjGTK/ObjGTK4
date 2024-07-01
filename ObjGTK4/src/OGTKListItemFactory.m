/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListItemFactory.h"

@implementation OGTKListItemFactory

- (GtkListItemFactory*)castedGObject
{
	return GTK_LIST_ITEM_FACTORY([self gObject]);
}


@end