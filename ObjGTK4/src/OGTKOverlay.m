/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKOverlay.h"

@implementation OGTKOverlay

- (instancetype)init
{
	GtkOverlay* gobjectValue = GTK_OVERLAY(gtk_overlay_new());

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

- (GtkOverlay*)castedGObject
{
	return GTK_OVERLAY([self gObject]);
}

- (void)addOverlay:(OGTKWidget*)widget
{
	gtk_overlay_add_overlay([self castedGObject], [widget castedGObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_overlay_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)clipOverlay:(OGTKWidget*)widget
{
	bool returnValue = gtk_overlay_get_clip_overlay([self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (bool)measureOverlay:(OGTKWidget*)widget
{
	bool returnValue = gtk_overlay_get_measure_overlay([self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (void)removeOverlay:(OGTKWidget*)widget
{
	gtk_overlay_remove_overlay([self castedGObject], [widget castedGObject]);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_overlay_set_child([self castedGObject], [child castedGObject]);
}

- (void)setClipOverlayWithWidget:(OGTKWidget*)widget clipOverlay:(bool)clipOverlay
{
	gtk_overlay_set_clip_overlay([self castedGObject], [widget castedGObject], clipOverlay);
}

- (void)setMeasureOverlayWithWidget:(OGTKWidget*)widget measure:(bool)measure
{
	gtk_overlay_set_measure_overlay([self castedGObject], [widget castedGObject], measure);
}


@end