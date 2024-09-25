/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutsGroup.h"

#import "OGTKShortcutsShortcut.h"

@implementation OGTKShortcutsGroup

- (GtkShortcutsGroup*)castedGObject
{
	return GTK_SHORTCUTS_GROUP([self gObject]);
}

- (void)addShortcut:(OGTKShortcutsShortcut*)shortcut
{
	gtk_shortcuts_group_add_shortcut([self castedGObject], [shortcut castedGObject]);
}


@end