/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGraphicsOffload.h"

@implementation OGTKGraphicsOffload

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GRAPHICS_OFFLOAD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)graphicsOffloadWithChild:(OGTKWidget*)child
{
	GtkGraphicsOffload* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_graphics_offload_new([child castedGObject]), GtkGraphicsOffload, GtkGraphicsOffload);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGraphicsOffload, GtkGraphicsOffload);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_graphics_offload_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkGraphicsOffloadEnabled)enabled
{
	GtkGraphicsOffloadEnabled returnValue = (GtkGraphicsOffloadEnabled)gtk_graphics_offload_get_enabled([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_graphics_offload_set_child([self castedGObject], [child castedGObject]);
}

- (void)setEnabled:(GtkGraphicsOffloadEnabled)enabled
{
	gtk_graphics_offload_set_enabled([self castedGObject], enabled);
}


@end