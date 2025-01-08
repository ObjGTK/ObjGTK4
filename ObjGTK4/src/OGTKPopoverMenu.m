/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPopoverMenu.h"

#import <OGio/OGMenuModel.h>
#import "OGTKWidget.h"

@implementation OGTKPopoverMenu

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_POPOVER_MENU;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithModelFromModel:(OGMenuModel*)model
{
	GtkPopoverMenu* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_popover_menu_new_from_model([model castedGObject]), GtkPopoverMenu, GtkPopoverMenu);

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

- (instancetype)initFromModelFullWithModel:(OGMenuModel*)model flags:(GtkPopoverMenuFlags)flags
{
	GtkPopoverMenu* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_popover_menu_new_from_model_full([model castedGObject], flags), GtkPopoverMenu, GtkPopoverMenu);

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

- (GtkPopoverMenu*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPopoverMenu, GtkPopoverMenu);
}

- (bool)addChildWithChild:(OGTKWidget*)child identifier:(OFString*)identifier
{
	bool returnValue = (bool)gtk_popover_menu_add_child([self castedGObject], [child castedGObject], [identifier UTF8String]);

	return returnValue;
}

- (GtkPopoverMenuFlags)flags
{
	GtkPopoverMenuFlags returnValue = (GtkPopoverMenuFlags)gtk_popover_menu_get_flags([self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)menuModel
{
	GMenuModel* gobjectValue = gtk_popover_menu_get_menu_model([self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)removeChild:(OGTKWidget*)child
{
	bool returnValue = (bool)gtk_popover_menu_remove_child([self castedGObject], [child castedGObject]);

	return returnValue;
}

- (void)setFlags:(GtkPopoverMenuFlags)flags
{
	gtk_popover_menu_set_flags([self castedGObject], flags);
}

- (void)setMenuModel:(OGMenuModel*)model
{
	gtk_popover_menu_set_menu_model([self castedGObject], [model castedGObject]);
}


@end