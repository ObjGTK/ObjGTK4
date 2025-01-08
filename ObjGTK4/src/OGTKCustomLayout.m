/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCustomLayout.h"

@implementation OGTKCustomLayout

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CUSTOM_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithRequestMode:(GtkCustomRequestModeFunc)requestMode measure:(GtkCustomMeasureFunc)measure allocate:(GtkCustomAllocateFunc)allocate
{
	GtkCustomLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_custom_layout_new(requestMode, measure, allocate), GtkCustomLayout, GtkCustomLayout);

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

- (GtkCustomLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCustomLayout, GtkCustomLayout);
}


@end