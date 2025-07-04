/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPasswordEntry.h"

#import <OGio/OGMenuModel.h>

@implementation OGTKPasswordEntry

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PASSWORD_ENTRY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PASSWORD_ENTRY);
	return gObjectClass;
}

+ (instancetype)passwordEntry
{
	GtkPasswordEntry* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_password_entry_new(), GTK_TYPE_PASSWORD_ENTRY, GtkPasswordEntry);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PASSWORD_ENTRY, GtkPasswordEntry);
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_password_entry_get_extra_menu((GtkPasswordEntry*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)showPeekIcon
{
	bool returnValue = (bool)gtk_password_entry_get_show_peek_icon((GtkPasswordEntry*)[self castedGObject]);

	return returnValue;
}

- (void)setExtraMenuWithModel:(OGMenuModel*)model
{
	gtk_password_entry_set_extra_menu((GtkPasswordEntry*)[self castedGObject], [model castedGObject]);
}

- (void)setShowPeekIcon:(bool)showPeekIcon
{
	gtk_password_entry_set_show_peek_icon((GtkPasswordEntry*)[self castedGObject], showPeekIcon);
}


@end