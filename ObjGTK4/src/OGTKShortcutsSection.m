/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutsSection.h"

#import "OGTKShortcutsGroup.h"

@implementation OGTKShortcutsSection

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUTS_SECTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkShortcutsSection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcutsSection, GtkShortcutsSection);
}

- (void)addGroup:(OGTKShortcutsGroup*)group
{
	gtk_shortcuts_section_add_group([self castedGObject], [group castedGObject]);
}


@end