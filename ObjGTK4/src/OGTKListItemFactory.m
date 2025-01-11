/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKListItemFactory.h"

@implementation OGTKListItemFactory

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LIST_ITEM_FACTORY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkListItemFactory*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkListItemFactory, GtkListItemFactory);
}


@end