/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPopoverMenuBar.h"

#import <OGio/OGMenuModel.h>

@implementation OGTKPopoverMenuBar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_POPOVER_MENU_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_POPOVER_MENU_BAR);
	return gObjectClass;
}

+ (instancetype)popoverMenuBarFromModel:(OGMenuModel*)model
{
	GtkPopoverMenuBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_popover_menu_bar_new_from_model([model castedGObject]), GTK_TYPE_POPOVER_MENU_BAR, GtkPopoverMenuBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPopoverMenuBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKPopoverMenuBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPopoverMenuBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_POPOVER_MENU_BAR, GtkPopoverMenuBar);
}

- (bool)addChild:(OGTKWidget*)child identifier:(OFString*)identifier
{
	bool returnValue = (bool)gtk_popover_menu_bar_add_child((GtkPopoverMenuBar*)[self castedGObject], [child castedGObject], [identifier UTF8String]);

	return returnValue;
}

- (OGMenuModel*)menuModel
{
	GMenuModel* gobjectValue = gtk_popover_menu_bar_get_menu_model((GtkPopoverMenuBar*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)removeChild:(OGTKWidget*)child
{
	bool returnValue = (bool)gtk_popover_menu_bar_remove_child((GtkPopoverMenuBar*)[self castedGObject], [child castedGObject]);

	return returnValue;
}

- (void)setMenuModel:(OGMenuModel*)model
{
	gtk_popover_menu_bar_set_menu_model((GtkPopoverMenuBar*)[self castedGObject], [model castedGObject]);
}


@end