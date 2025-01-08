/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEveryFilter.h"

@implementation OGTKEveryFilter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EVERY_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkEveryFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_every_filter_new(), GtkEveryFilter, GtkEveryFilter);

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

- (GtkEveryFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkEveryFilter, GtkEveryFilter);
}


@end