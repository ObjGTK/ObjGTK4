/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKViewport.h"

#import "OGTKAdjustment.h"

@implementation OGTKViewport

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_VIEWPORT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_VIEWPORT);
	return gObjectClass;
}

+ (instancetype)viewportWithHadjustment:(OGTKAdjustment*)hadjustment vadjustment:(OGTKAdjustment*)vadjustment
{
	GtkViewport* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_viewport_new([hadjustment castedGObject], [vadjustment castedGObject]), GTK_TYPE_VIEWPORT, GtkViewport);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKViewport* wrapperObject;
	@try {
		wrapperObject = [[OGTKViewport alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkViewport*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_VIEWPORT, GtkViewport);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_viewport_get_child((GtkViewport*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)scrollToFocus
{
	bool returnValue = (bool)gtk_viewport_get_scroll_to_focus((GtkViewport*)[self castedGObject]);

	return returnValue;
}

- (void)scrollToWithDescendant:(OGTKWidget*)descendant scroll:(GtkScrollInfo*)scroll
{
	gtk_viewport_scroll_to((GtkViewport*)[self castedGObject], [descendant castedGObject], scroll);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_viewport_set_child((GtkViewport*)[self castedGObject], [child castedGObject]);
}

- (void)setScrollToFocus:(bool)scrollToFocus
{
	gtk_viewport_set_scroll_to_focus((GtkViewport*)[self castedGObject], scrollToFocus);
}


@end