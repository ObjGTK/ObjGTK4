/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutsWindow.h"

#import "OGTKShortcutsSection.h"

@implementation OGTKShortcutsWindow

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUTS_WINDOW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkShortcutsWindow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcutsWindow, GtkShortcutsWindow);
}

- (void)addSection:(OGTKShortcutsSection*)section
{
	gtk_shortcuts_window_add_section([self castedGObject], [section castedGObject]);
}


@end