/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPopover.h"

@implementation OGTKPopover

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_POPOVER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_POPOVER);
	return gObjectClass;
}

+ (instancetype)popover
{
	GtkPopover* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_popover_new(), GTK_TYPE_POPOVER, GtkPopover);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPopover* wrapperObject;
	@try {
		wrapperObject = [[OGTKPopover alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPopover*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_POPOVER, GtkPopover);
}

- (bool)autohide
{
	bool returnValue = (bool)gtk_popover_get_autohide((GtkPopover*)[self castedGObject]);

	return returnValue;
}

- (bool)cascadePopdown
{
	bool returnValue = (bool)gtk_popover_get_cascade_popdown((GtkPopover*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_popover_get_child((GtkPopover*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasArrow
{
	bool returnValue = (bool)gtk_popover_get_has_arrow((GtkPopover*)[self castedGObject]);

	return returnValue;
}

- (bool)mnemonicsVisible
{
	bool returnValue = (bool)gtk_popover_get_mnemonics_visible((GtkPopover*)[self castedGObject]);

	return returnValue;
}

- (void)offsetWithXoffset:(int*)xoffset yoffset:(int*)yoffset
{
	gtk_popover_get_offset((GtkPopover*)[self castedGObject], xoffset, yoffset);
}

- (bool)pointingToWithRect:(GdkRectangle*)rect
{
	bool returnValue = (bool)gtk_popover_get_pointing_to((GtkPopover*)[self castedGObject], rect);

	return returnValue;
}

- (GtkPositionType)position
{
	GtkPositionType returnValue = (GtkPositionType)gtk_popover_get_position((GtkPopover*)[self castedGObject]);

	return returnValue;
}

- (void)popdown
{
	gtk_popover_popdown((GtkPopover*)[self castedGObject]);
}

- (void)popup
{
	gtk_popover_popup((GtkPopover*)[self castedGObject]);
}

- (void)present
{
	gtk_popover_present((GtkPopover*)[self castedGObject]);
}

- (void)setAutohide:(bool)autohide
{
	gtk_popover_set_autohide((GtkPopover*)[self castedGObject], autohide);
}

- (void)setCascadePopdown:(bool)cascadePopdown
{
	gtk_popover_set_cascade_popdown((GtkPopover*)[self castedGObject], cascadePopdown);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_popover_set_child((GtkPopover*)[self castedGObject], [child castedGObject]);
}

- (void)setDefaultWidget:(OGTKWidget*)widget
{
	gtk_popover_set_default_widget((GtkPopover*)[self castedGObject], [widget castedGObject]);
}

- (void)setHasArrow:(bool)hasArrow
{
	gtk_popover_set_has_arrow((GtkPopover*)[self castedGObject], hasArrow);
}

- (void)setMnemonicsVisible:(bool)mnemonicsVisible
{
	gtk_popover_set_mnemonics_visible((GtkPopover*)[self castedGObject], mnemonicsVisible);
}

- (void)setOffsetWithXoffset:(int)xoffset yoffset:(int)yoffset
{
	gtk_popover_set_offset((GtkPopover*)[self castedGObject], xoffset, yoffset);
}

- (void)setPointingToWithRect:(const GdkRectangle*)rect
{
	gtk_popover_set_pointing_to((GtkPopover*)[self castedGObject], rect);
}

- (void)setPosition:(GtkPositionType)position
{
	gtk_popover_set_position((GtkPopover*)[self castedGObject], position);
}


@end