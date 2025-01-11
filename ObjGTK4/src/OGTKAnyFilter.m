/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAnyFilter.h"

@implementation OGTKAnyFilter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ANY_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)anyFilter
{
	GtkAnyFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_any_filter_new(), GtkAnyFilter, GtkAnyFilter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKAnyFilter* wrapperObject;
	@try {
		wrapperObject = [[OGTKAnyFilter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAnyFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkAnyFilter, GtkAnyFilter);
}


@end