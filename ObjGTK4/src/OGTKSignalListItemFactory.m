/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSignalListItemFactory.h"

@implementation OGTKSignalListItemFactory

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SIGNAL_LIST_ITEM_FACTORY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)signalListItemFactory
{
	GtkSignalListItemFactory* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_signal_list_item_factory_new(), GtkSignalListItemFactory, GtkSignalListItemFactory);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSignalListItemFactory* wrapperObject;
	@try {
		wrapperObject = [[OGTKSignalListItemFactory alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSignalListItemFactory*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSignalListItemFactory, GtkSignalListItemFactory);
}


@end