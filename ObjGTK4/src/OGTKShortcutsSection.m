/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutsSection.h"

#import "OGTKShortcutsGroup.h"

@implementation OGTKShortcutsSection

- (GtkShortcutsSection*)castedGObject
{
	return GTK_SHORTCUTS_SECTION([self gObject]);
}

- (void)addGroup:(OGTKShortcutsGroup*)group
{
	gtk_shortcuts_section_add_group([self castedGObject], [group castedGObject]);
}


@end