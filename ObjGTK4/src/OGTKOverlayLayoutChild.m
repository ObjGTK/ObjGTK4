/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKOverlayLayoutChild.h"

@implementation OGTKOverlayLayoutChild

- (GtkOverlayLayoutChild*)castedGObject
{
	return GTK_OVERLAY_LAYOUT_CHILD([self gObject]);
}

- (bool)clipOverlay
{
	bool returnValue = gtk_overlay_layout_child_get_clip_overlay([self castedGObject]);

	return returnValue;
}

- (bool)measure
{
	bool returnValue = gtk_overlay_layout_child_get_measure([self castedGObject]);

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