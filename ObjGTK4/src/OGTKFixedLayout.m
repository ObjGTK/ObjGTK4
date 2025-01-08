/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFixedLayout.h"

@implementation OGTKFixedLayout

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FIXED_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkFixedLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_fixed_layout_new(), GtkFixedLayout, GtkFixedLayout);

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

- (GtkFixedLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFixedLayout, GtkFixedLayout);
}


@end