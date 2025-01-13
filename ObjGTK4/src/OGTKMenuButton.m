/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMenuButton.h"

#import <OGio/OGMenuModel.h>
#import "OGTKPopover.h"

@implementation OGTKMenuButton

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MENU_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)menuButton
{
	GtkMenuButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_menu_button_new(), GtkMenuButton, GtkMenuButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKMenuButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKMenuButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkMenuButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkMenuButton, GtkMenuButton);
}

- (bool)active
{
	bool returnValue = (bool)gtk_menu_button_get_active([self castedGObject]);

	return returnValue;
}

- (bool)alwaysShowArrow
{
	bool returnValue = (bool)gtk_menu_button_get_always_show_arrow([self castedGObject]);

	return returnValue;
}

- (bool)canShrink
{
	bool returnValue = (bool)gtk_menu_button_get_can_shrink([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_menu_button_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GtkArrowType)direction
{
	GtkArrowType returnValue = (GtkArrowType)gtk_menu_button_get_direction([self castedGObject]);

	return returnValue;
}

- (bool)hasFrame
{
	bool returnValue = (bool)gtk_menu_button_get_has_frame([self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_menu_button_get_icon_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_menu_button_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGMenuModel*)menuModel
{
	GMenuModel* gobjectValue = gtk_menu_button_get_menu_model([self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKPopover*)popover
{
	GtkPopover* gobjectValue = gtk_menu_button_get_popover([self castedGObject]);

	OGTKPopover* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)primary
{
	bool returnValue = (bool)gtk_menu_button_get_primary([self castedGObject]);

	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = (bool)gtk_menu_button_get_use_underline([self castedGObject]);

	return returnValue;
}

- (void)popdown
{
	gtk_menu_button_popdown([self castedGObject]);
}

- (void)popup
{
	gtk_menu_button_popup([self castedGObject]);
}

- (void)setActive:(bool)active
{
	gtk_menu_button_set_active([self castedGObject], active);
}

- (void)setAlwaysShowArrow:(bool)alwaysShowArrow
{
	gtk_menu_button_set_always_show_arrow([self castedGObject], alwaysShowArrow);
}

- (void)setCanShrink:(bool)canShrink
{
	gtk_menu_button_set_can_shrink([self castedGObject], canShrink);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_menu_button_set_child([self castedGObject], [child castedGObject]);
}

- (void)setCreatePopupFunc:(GtkMenuButtonCreatePopupFunc)func userData:(gpointer)userData destroyNotify:(GDestroyNotify)destroyNotify
{
	gtk_menu_button_set_create_popup_func([self castedGObject], func, userData, destroyNotify);
}

- (void)setDirection:(GtkArrowType)direction
{
	gtk_menu_button_set_direction([self castedGObject], direction);
}

- (void)setHasFrame:(bool)hasFrame
{
	gtk_menu_button_set_has_frame([self castedGObject], hasFrame);
}

- (void)setIconName:(OFString*)iconName
{
	gtk_menu_button_set_icon_name([self castedGObject], [iconName UTF8String]);
}

- (void)setLabel:(OFString*)label
{
	gtk_menu_button_set_label([self castedGObject], [label UTF8String]);
}

- (void)setMenuModel:(OGMenuModel*)menuModel
{
	gtk_menu_button_set_menu_model([self castedGObject], [menuModel castedGObject]);
}

- (void)setPopover:(OGTKWidget*)popover
{
	gtk_menu_button_set_popover([self castedGObject], [popover castedGObject]);
}

- (void)setPrimary:(bool)primary
{
	gtk_menu_button_set_primary([self castedGObject], primary);
}

- (void)setUseUnderline:(bool)useUnderline
{
	gtk_menu_button_set_use_underline([self castedGObject], useUnderline);
}


@end