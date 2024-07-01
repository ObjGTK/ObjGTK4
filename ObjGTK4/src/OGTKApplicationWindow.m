/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKApplicationWindow.h"

#import "OGTKShortcutsWindow.h"
#import "OGTKWidget.h"
#import "OGTKApplication.h"

@implementation OGTKApplicationWindow

- (instancetype)init:(OGTKApplication*)application
{
	GtkApplicationWindow* gobjectValue = GTK_APPLICATION_WINDOW(gtk_application_window_new([application castedGObject]));

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

- (GtkApplicationWindow*)castedGObject
{
	return GTK_APPLICATION_WINDOW([self gObject]);
}

- (OGTKShortcutsWindow*)helpOverlay
{
	GtkShortcutsWindow* gobjectValue = GTK_SHORTCUTS_WINDOW(gtk_application_window_get_help_overlay([self castedGObject]));

	OGTKShortcutsWindow* returnValue = [OGTKShortcutsWindow withGObject:gobjectValue];
	return returnValue;
}

- (guint)id
{
	guint returnValue = gtk_application_window_get_id([self castedGObject]);

	return returnValue;
}

- (bool)showMenubar
{
	bool returnValue = gtk_application_window_get_show_menubar([self castedGObject]);

	return returnValue;
}

- (void)setHelpOverlay:(OGTKShortcutsWindow*)helpOverlay
{
	gtk_application_window_set_help_overlay([self castedGObject], [helpOverlay castedGObject]);
}

- (void)setShowMenubar:(bool)showMenubar
{
	gtk_application_window_set_show_menubar([self castedGObject], showMenubar);
}


@end