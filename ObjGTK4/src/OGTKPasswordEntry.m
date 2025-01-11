/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPasswordEntry.h"

#import <OGio/OGMenuModel.h>

@implementation OGTKPasswordEntry

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PASSWORD_ENTRY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)passwordEntry
{
	GtkPasswordEntry* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_password_entry_new(), GtkPasswordEntry, GtkPasswordEntry);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPasswordEntry* wrapperObject;
	@try {
		wrapperObject = [[OGTKPasswordEntry alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPasswordEntry*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPasswordEntry, GtkPasswordEntry);
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_password_entry_get_extra_menu([self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)showPeekIcon
{
	bool returnValue = (bool)gtk_password_entry_get_show_peek_icon([self castedGObject]);

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