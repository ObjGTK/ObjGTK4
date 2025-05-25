/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutsWindow.h"

#import "OGTKShortcutsSection.h"

@implementation OGTKShortcutsWindow

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUTS_WINDOW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SHORTCUTS_WINDOW);
	return gObjectClass;
}

- (GtkShortcutsWindow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SHORTCUTS_WINDOW, GtkShortcutsWindow);
}

- (void)addSection:(OGTKShortcutsSection*)section
{
	gtk_shortcuts_window_add_section((GtkShortcutsWindow*)[self castedGObject], [section castedGObject]);
}


@end