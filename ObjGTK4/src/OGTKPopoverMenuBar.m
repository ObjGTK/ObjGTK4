/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPopoverMenuBar.h"

#import <OGio/OGMenuModel.h>

@implementation OGTKPopoverMenuBar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_POPOVER_MENU_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithModelFromModel:(OGMenuModel*)model
{
	GtkPopoverMenuBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_popover_menu_bar_new_from_model([model castedGObject]), GtkPopoverMenuBar, GtkPopoverMenuBar);

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

- (GtkPopoverMenuBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPopoverMenuBar, GtkPopoverMenuBar);
}

- (bool)addChildWithChild:(OGTKWidget*)child identifier:(OFString*)identifier
{
	bool returnValue = (bool)gtk_popover_menu_bar_add_child([self castedGObject], [child castedGObject], [identifier UTF8String]);

	return returnValue;
}

- (OGMenuModel*)menuModel
{
	GMenuModel* gobjectValue = gtk_popover_menu_bar_get_menu_model([self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)removeChild:(OGTKWidget*)child
{
	bool returnValue = (bool)gtk_popover_menu_bar_remove_child([self castedGObject], [child castedGObject]);

	return returnValue;
}

- (void)setMenuModel:(OGMenuModel*)model
{
	gtk_popover_menu_bar_set_menu_model([self castedGObject], [model castedGObject]);
}


@end