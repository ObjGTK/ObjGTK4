/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKOverlayLayout.h"

@implementation OGTKOverlayLayout

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_OVERLAY_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)overlayLayout
{
	GtkOverlayLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_overlay_layout_new(), GtkOverlayLayout, GtkOverlayLayout);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKOverlayLayout* wrapperObject;
	@try {
		wrapperObject = [[OGTKOverlayLayout alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkOverlayLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkOverlayLayout, GtkOverlayLayout);
}


@end