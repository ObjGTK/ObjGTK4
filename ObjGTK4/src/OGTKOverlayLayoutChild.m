/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKOverlayLayoutChild.h"

@implementation OGTKOverlayLayoutChild

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_OVERLAY_LAYOUT_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkOverlayLayoutChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkOverlayLayoutChild, GtkOverlayLayoutChild);
}

- (bool)clipOverlay
{
	bool returnValue = (bool)gtk_overlay_layout_child_get_clip_overlay([self castedGObject]);

	return returnValue;
}

- (bool)measure
{
	bool returnValue = (bool)gtk_overlay_layout_child_get_measure([self castedGObject]);

	return returnValue;
}

- (void)setClipOverlay:(bool)clipOverlay
{
	gtk_overlay_layout_child_set_clip_overlay([self castedGObject], clipOverlay);
}

- (void)setMeasure:(bool)measure
{
	gtk_overlay_layout_child_set_measure([self castedGObject], measure);
}


@end