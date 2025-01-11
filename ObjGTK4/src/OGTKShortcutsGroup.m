/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutsGroup.h"

#import "OGTKShortcutsShortcut.h"

@implementation OGTKShortcutsGroup

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUTS_GROUP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkShortcutsGroup*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcutsGroup, GtkShortcutsGroup);
}

- (void)addShortcut:(OGTKShortcutsShortcut*)shortcut
{
	gtk_shortcuts_group_add_shortcut([self castedGObject], [shortcut castedGObject]);
}


@end