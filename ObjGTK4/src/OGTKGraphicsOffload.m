/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGraphicsOffload.h"

@implementation OGTKGraphicsOffload

- (instancetype)init:(OGTKWidget*)child
{
	GtkGraphicsOffload* gobjectValue = GTK_GRAPHICS_OFFLOAD(gtk_graphics_offload_new([child castedGObject]));

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

- (GtkGraphicsOffload*)castedGObject
{
	return GTK_GRAPHICS_OFFLOAD([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_graphics_offload_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (GtkGraphicsOffloadEnabled)enabled
{
	GtkGraphicsOffloadEnabled returnValue = gtk_graphics_offload_get_enabled([self castedGObject]);

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