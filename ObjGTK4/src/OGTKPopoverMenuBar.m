/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPopoverMenuBar.h"

#import <OGio/OGMenuModel.h>

@implementation OGTKPopoverMenuBar

- (instancetype)initFromModel:(OGMenuModel*)model
{
	GtkPopoverMenuBar* gobjectValue = GTK_POPOVER_MENU_BAR(gtk_popover_menu_bar_new_from_model([model castedGObject]));

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

- (GtkPopoverMenuBar*)castedGObject
{
	return GTK_POPOVER_MENU_BAR([self gObject]);
}

- (bool)addChildWithChild:(OGTKWidget*)child id:(OFString*)id
{
	bool returnValue = gtk_popover_menu_bar_add_child([self castedGObject], [child castedGObject], [id UTF8String]);

	return returnValue;
}

- (OGMenuModel*)menuModel
{
	GMenuModel* gobjectValue = G_MENU_MODEL(gtk_popover_menu_bar_get_menu_model([self castedGObject]));

	OGMenuModel* returnValue = [OGMenuModel withGObject:gobjectValue];
	return returnValue;
}

- (bool)removeChild:(OGTKWidget*)child
{
	bool returnValue = gtk_popover_menu_bar_remove_child([self castedGObject], [child castedGObject]);

	return returnValue;
}

- (void)setMenuModel:(OGMenuModel*)model
{
	gtk_popover_menu_bar_set_menu_model([self castedGObject], [model castedGObject]);
}


@end