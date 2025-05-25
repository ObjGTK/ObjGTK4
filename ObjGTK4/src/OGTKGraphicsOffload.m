/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGraphicsOffload.h"

@implementation OGTKGraphicsOffload

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GRAPHICS_OFFLOAD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GRAPHICS_OFFLOAD);
	return gObjectClass;
}

+ (instancetype)graphicsOffloadWithChild:(OGTKWidget*)child
{
	GtkGraphicsOffload* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_graphics_offload_new([child castedGObject]), GTK_TYPE_GRAPHICS_OFFLOAD, GtkGraphicsOffload);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKGraphicsOffload* wrapperObject;
	@try {
		wrapperObject = [[OGTKGraphicsOffload alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGraphicsOffload*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GRAPHICS_OFFLOAD, GtkGraphicsOffload);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_graphics_offload_get_child((GtkGraphicsOffload*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkGraphicsOffloadEnabled)enabled
{
	GtkGraphicsOffloadEnabled returnValue = (GtkGraphicsOffloadEnabled)gtk_graphics_offload_get_enabled((GtkGraphicsOffload*)[self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_graphics_offload_set_child((GtkGraphicsOffload*)[self castedGObject], [child castedGObject]);
}

- (void)setEnabled:(GtkGraphicsOffloadEnabled)enabled
{
	gtk_graphics_offload_set_enabled((GtkGraphicsOffload*)[self castedGObject], enabled);
}


@end