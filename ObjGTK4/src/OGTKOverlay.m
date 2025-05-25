/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKOverlay.h"

@implementation OGTKOverlay

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_OVERLAY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_OVERLAY);
	return gObjectClass;
}

+ (instancetype)overlay
{
	GtkOverlay* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_overlay_new(), GTK_TYPE_OVERLAY, GtkOverlay);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKOverlay* wrapperObject;
	@try {
		wrapperObject = [[OGTKOverlay alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkOverlay*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_OVERLAY, GtkOverlay);
}

- (void)addOverlayWithWidget:(OGTKWidget*)widget
{
	gtk_overlay_add_overlay((GtkOverlay*)[self castedGObject], [widget castedGObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_overlay_get_child((GtkOverlay*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)clipOverlayWithWidget:(OGTKWidget*)widget
{
	bool returnValue = (bool)gtk_overlay_get_clip_overlay((GtkOverlay*)[self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (bool)measureOverlayWithWidget:(OGTKWidget*)widget
{
	bool returnValue = (bool)gtk_overlay_get_measure_overlay((GtkOverlay*)[self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (void)removeOverlayWithWidget:(OGTKWidget*)widget
{
	gtk_overlay_remove_overlay((GtkOverlay*)[self castedGObject], [widget castedGObject]);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_overlay_set_child((GtkOverlay*)[self castedGObject], [child castedGObject]);
}

- (void)setClipOverlayWithWidget:(OGTKWidget*)widget clipOverlay:(bool)clipOverlay
{
	gtk_overlay_set_clip_overlay((GtkOverlay*)[self castedGObject], [widget castedGObject], clipOverlay);
}

- (void)setMeasureOverlayWithWidget:(OGTKWidget*)widget measure:(bool)measure
{
	gtk_overlay_set_measure_overlay((GtkOverlay*)[self castedGObject], [widget castedGObject], measure);
}


@end