/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPasswordEntry.h"

#import <OGio/OGMenuModel.h>

@implementation OGTKPasswordEntry

- (instancetype)init
{
	GtkPasswordEntry* gobjectValue = GTK_PASSWORD_ENTRY(gtk_password_entry_new());

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

- (GtkPasswordEntry*)castedGObject
{
	return GTK_PASSWORD_ENTRY([self gObject]);
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = G_MENU_MODEL(gtk_password_entry_get_extra_menu([self castedGObject]));

	OGMenuModel* returnValue = [OGMenuModel withGObject:gobjectValue];
	return returnValue;
}

- (bool)showPeekIcon
{
	bool returnValue = gtk_password_entry_get_show_peek_icon([self castedGObject]);

	return returnValue;
}

- (void)setExtraMenu:(OGMenuModel*)model
{
	gtk_password_entry_set_extra_menu([self castedGObject], [model castedGObject]);
}

- (void)setShowPeekIcon:(bool)showPeekIcon
{
	gtk_password_entry_set_show_peek_icon([self castedGObject], showPeekIcon);
}


@end