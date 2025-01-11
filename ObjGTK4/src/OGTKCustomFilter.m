/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCustomFilter.h"

@implementation OGTKCustomFilter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CUSTOM_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)customFilterWithMatchFunc:(GtkCustomFilterFunc)matchFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	GtkCustomFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_custom_filter_new(matchFunc, userData, userDestroy), GtkCustomFilter, GtkCustomFilter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKCustomFilter* wrapperObject;
	@try {
		wrapperObject = [[OGTKCustomFilter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCustomFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCustomFilter, GtkCustomFilter);
}

- (void)setFilterFuncWithMatchFunc:(GtkCustomFilterFunc)matchFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy
{
	gtk_custom_filter_set_filter_func([self castedGObject], matchFunc, userData, userDestroy);
}


@end