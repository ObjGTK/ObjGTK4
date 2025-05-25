/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutsGroup.h"

#import "OGTKShortcutsShortcut.h"

@implementation OGTKShortcutsGroup

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUTS_GROUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SHORTCUTS_GROUP);
	return gObjectClass;
}

- (GtkShortcutsGroup*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SHORTCUTS_GROUP, GtkShortcutsGroup);
}

- (void)addShortcut:(OGTKShortcutsShortcut*)shortcut
{
	gtk_shortcuts_group_add_shortcut((GtkShortcutsGroup*)[self castedGObject], [shortcut castedGObject]);
}


@end