/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKOverlay.h"

@implementation OGTKOverlay

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_OVERLAY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkOverlay* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_overlay_new(), GtkOverlay, GtkOverlay);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkOverlay, GtkOverlay);
}

- (void)addOverlay:(OGTKWidget*)widget
{
	gtk_overlay_add_overlay([self castedGObject], [widget castedGObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_overlay_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)clipOverlay:(OGTKWidget*)widget
{
	bool returnValue = (bool)gtk_overlay_get_clip_overlay([self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (bool)measureOverlay:(OGTKWidget*)widget
{
	bool returnValue = (bool)gtk_overlay_get_measure_overlay([self castedGObject], [widget castedGObject]);

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