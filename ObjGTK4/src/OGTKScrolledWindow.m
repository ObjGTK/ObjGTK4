/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScrolledWindow.h"

#import "OGTKAdjustment.h"

@implementation OGTKScrolledWindow

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SCROLLED_WINDOW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SCROLLED_WINDOW);
	return gObjectClass;
}

+ (instancetype)scrolledWindow
{
	GtkScrolledWindow* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_scrolled_window_new(), GTK_TYPE_SCROLLED_WINDOW, GtkScrolledWindow);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKScrolledWindow* wrapperObject;
	@try {
		wrapperObject = [[OGTKScrolledWindow alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkScrolledWindow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SCROLLED_WINDOW, GtkScrolledWindow);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_scrolled_window_get_child((GtkScrolledWindow*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKAdjustment*)hadjustment
{
	GtkAdjustment* gobjectValue = gtk_scrolled_window_get_hadjustment((GtkScrolledWindow*)[self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasFrame
{
	bool returnValue = (bool)gtk_scrolled_window_get_has_frame((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)hscrollbar
{
	GtkWidget* gobjectValue = gtk_scrolled_window_get_hscrollbar((GtkScrolledWindow*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)kineticScrolling
{
	bool returnValue = (bool)gtk_scrolled_window_get_kinetic_scrolling((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (int)maxContentHeight
{
	int returnValue = (int)gtk_scrolled_window_get_max_content_height((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (int)maxContentWidth
{
	int returnValue = (int)gtk_scrolled_window_get_max_content_width((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (int)minContentHeight
{
	int returnValue = (int)gtk_scrolled_window_get_min_content_height((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (int)minContentWidth
{
	int returnValue = (int)gtk_scrolled_window_get_min_content_width((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)overlayScrolling
{
	bool returnValue = (bool)gtk_scrolled_window_get_overlay_scrolling((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (GtkCornerType)placement
{
	GtkCornerType returnValue = (GtkCornerType)gtk_scrolled_window_get_placement((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (void)policyWithHscrollbarPolicy:(GtkPolicyType*)hscrollbarPolicy vscrollbarPolicy:(GtkPolicyType*)vscrollbarPolicy
{
	gtk_scrolled_window_get_policy((GtkScrolledWindow*)[self castedGObject], hscrollbarPolicy, vscrollbarPolicy);
}

- (bool)propagateNaturalHeight
{
	bool returnValue = (bool)gtk_scrolled_window_get_propagate_natural_height((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)propagateNaturalWidth
{
	bool returnValue = (bool)gtk_scrolled_window_get_propagate_natural_width((GtkScrolledWindow*)[self castedGObject]);

	return returnValue;
}

- (OGTKAdjustment*)vadjustment
{
	GtkAdjustment* gobjectValue = gtk_scrolled_window_get_vadjustment((GtkScrolledWindow*)[self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)vscrollbar
{
	GtkWidget* gobjectValue = gtk_scrolled_window_get_vscrollbar((GtkScrolledWindow*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_scrolled_window_set_child((GtkScrolledWindow*)[self castedGObject], [child castedGObject]);
}

- (void)setHadjustment:(OGTKAdjustment*)hadjustment
{
	gtk_scrolled_window_set_hadjustment((GtkScrolledWindow*)[self castedGObject], [hadjustment castedGObject]);
}

- (void)setHasFrame:(bool)hasFrame
{
	gtk_scrolled_window_set_has_frame((GtkScrolledWindow*)[self castedGObject], hasFrame);
}

- (void)setKineticScrolling:(bool)kineticScrolling
{
	gtk_scrolled_window_set_kinetic_scrolling((GtkScrolledWindow*)[self castedGObject], kineticScrolling);
}

- (void)setMaxContentHeight:(int)height
{
	gtk_scrolled_window_set_max_content_height((GtkScrolledWindow*)[self castedGObject], height);
}

- (void)setMaxContentWidth:(int)width
{
	gtk_scrolled_window_set_max_content_width((GtkScrolledWindow*)[self castedGObject], width);
}

- (void)setMinContentHeight:(int)height
{
	gtk_scrolled_window_set_min_content_height((GtkScrolledWindow*)[self castedGObject], height);
}

- (void)setMinContentWidth:(int)width
{
	gtk_scrolled_window_set_min_content_width((GtkScrolledWindow*)[self castedGObject], width);
}

- (void)setOverlayScrolling:(bool)overlayScrolling
{
	gtk_scrolled_window_set_overlay_scrolling((GtkScrolledWindow*)[self castedGObject], overlayScrolling);
}

- (void)setPlacementWithWindowPlacement:(GtkCornerType)windowPlacement
{
	gtk_scrolled_window_set_placement((GtkScrolledWindow*)[self castedGObject], windowPlacement);
}

- (void)setPolicyWithHscrollbarPolicy:(GtkPolicyType)hscrollbarPolicy vscrollbarPolicy:(GtkPolicyType)vscrollbarPolicy
{
	gtk_scrolled_window_set_policy((GtkScrolledWindow*)[self castedGObject], hscrollbarPolicy, vscrollbarPolicy);
}

- (void)setPropagateNaturalHeight:(bool)propagate
{
	gtk_scrolled_window_set_propagate_natural_height((GtkScrolledWindow*)[self castedGObject], propagate);
}

- (void)setPropagateNaturalWidth:(bool)propagate
{
	gtk_scrolled_window_set_propagate_natural_width((GtkScrolledWindow*)[self castedGObject], propagate);
}

- (void)setVadjustment:(OGTKAdjustment*)vadjustment
{
	gtk_scrolled_window_set_vadjustment((GtkScrolledWindow*)[self castedGObject], [vadjustment castedGObject]);
}

- (void)unsetPlacement
{
	gtk_scrolled_window_unset_placement((GtkScrolledWindow*)[self castedGObject]);
}


@end