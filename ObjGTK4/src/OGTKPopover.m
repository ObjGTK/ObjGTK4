/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPopover.h"

@implementation OGTKPopover

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_POPOVER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)popover
{
	GtkPopover* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_popover_new(), GtkPopover, GtkPopover);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPopover, GtkPopover);
}

- (bool)autohide
{
	bool returnValue = (bool)gtk_popover_get_autohide([self castedGObject]);

	return returnValue;
}

- (bool)cascadePopdown
{
	bool returnValue = (bool)gtk_popover_get_cascade_popdown([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_popover_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasArrow
{
	bool returnValue = (bool)gtk_popover_get_has_arrow([self castedGObject]);

	return returnValue;
}

- (bool)mnemonicsVisible
{
	bool returnValue = (bool)gtk_popover_get_mnemonics_visible([self castedGObject]);

	return returnValue;
}

- (void)offsetWithXoffset:(int*)xoffset yoffset:(int*)yoffset
{
	gtk_popover_get_offset([self castedGObject], xoffset, yoffset);
}

- (bool)pointingTo:(GdkRectangle*)rect
{
	bool returnValue = (bool)gtk_popover_get_pointing_to([self castedGObject], rect);

	return returnValue;
}

- (GtkPositionType)position
{
	GtkPositionType returnValue = (GtkPositionType)gtk_popover_get_position([self castedGObject]);

	return returnValue;
}

- (void)popdown
{
	gtk_popover_popdown([self castedGObject]);
}

- (void)popup
{
	gtk_popover_popup([self castedGObject]);
}

- (void)present
{
	gtk_popover_present([self castedGObject]);
}

- (void)setAutohide:(bool)autohide
{
	gtk_popover_set_autohide([self castedGObject], autohide);
}

- (void)setCascadePopdown:(bool)cascadePopdown
{
	gtk_popover_set_cascade_popdown([self castedGObject], cascadePopdown);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_popover_set_child([self castedGObject], [child castedGObject]);
}

- (void)setDefaultWidget:(OGTKWidget*)widget
{
	gtk_popover_set_default_widget([self castedGObject], [widget castedGObject]);
}

- (void)setHasArrow:(bool)hasArrow
{
	gtk_popover_set_has_arrow([self castedGObject], hasArrow);
}

- (void)setMnemonicsVisible:(bool)mnemonicsVisible
{
	gtk_popover_set_mnemonics_visible([self castedGObject], mnemonicsVisible);
}

- (void)setOffsetWithXoffset:(int)xoffset yoffset:(int)yoffset
{
	gtk_popover_set_offset([self castedGObject], xoffset, yoffset);
}

- (void)setPointingTo:(const GdkRectangle*)rect
{
	gtk_popover_set_pointing_to([self castedGObject], rect);
}

- (void)setPosition:(GtkPositionType)position
{
	gtk_popover_set_position([self castedGObject], position);
}


@end