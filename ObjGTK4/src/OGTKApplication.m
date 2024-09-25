/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKApplication.h"

#import "OGTKWindow.h"
#import <OGio/OGMenuModel.h>
#import <OGio/OGMenu.h>

@implementation OGTKApplication

- (instancetype)initWithApplicationId:(OFString*)applicationId flags:(GApplicationFlags)flags
{
	GtkApplication* gobjectValue = GTK_APPLICATION(gtk_application_new([applicationId UTF8String], flags));

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

- (GtkApplication*)castedGObject
{
	return GTK_APPLICATION([self gObject]);
}

- (void)addWindow:(OGTKWindow*)window
{
	gtk_application_add_window([self castedGObject], [window castedGObject]);
}

- (char**)accelsForAction:(OFString*)detailedActionName
{
	char** returnValue = gtk_application_get_accels_for_action([self castedGObject], [detailedActionName UTF8String]);

	return returnValue;
}

- (char**)actionsForAccel:(OFString*)accel
{
	char** returnValue = gtk_application_get_actions_for_accel([self castedGObject], [accel UTF8String]);

	return returnValue;
}

- (OGTKWindow*)activeWindow
{
	GtkWindow* gobjectValue = GTK_WINDOW(gtk_application_get_active_window([self castedGObject]));

	OGTKWindow* returnValue = [OGTKWindow withGObject:gobjectValue];
	return returnValue;
}

- (OGMenu*)menuById:(OFString*)id
{
	GMenu* gobjectValue = G_MENU(gtk_application_get_menu_by_id([self castedGObject], [id UTF8String]));

	OGMenu* returnValue = [OGMenu withGObject:gobjectValue];
	return returnValue;
}

- (OGMenuModel*)menubar
{
	GMenuModel* gobjectValue = G_MENU_MODEL(gtk_application_get_menubar([self castedGObject]));

	OGMenuModel* returnValue = [OGMenuModel withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWindow*)windowById:(guint)id
{
	GtkWindow* gobjectValue = GTK_WINDOW(gtk_application_get_window_by_id([self castedGObject], id));

	OGTKWindow* returnValue = [OGTKWindow withGObject:gobjectValue];
	return returnValue;
}

- (GList*)windows
{
	GList* returnValue = gtk_application_get_windows([self castedGObject]);

	return returnValue;
}

- (guint)inhibitWithWindow:(OGTKWindow*)window flags:(GtkApplicationInhibitFlags)flags reason:(OFString*)reason
{
	guint returnValue = gtk_application_inhibit([self castedGObject], [window castedGObject], flags, [reason UTF8String]);

	return returnValue;
}

- (char**)listActionDescriptions
{
	char** returnValue = gtk_application_list_action_descriptions([self castedGObject]);

	return returnValue;
}

- (void)removeWindow:(OGTKWindow*)window
{
	gtk_application_remove_window([self castedGObject], [window castedGObject]);
}

- (void)setAccelsForActionWithDetailedActionName:(OFString*)detailedActionName accels:(const char* const*)accels
{
	gtk_application_set_accels_for_action([self castedGObject], [detailedActionName UTF8String], accels);
}

- (void)setMenubar:(OGMenuModel*)menubar
{
	gtk_application_set_menubar([self castedGObject], [menubar castedGObject]);
}

- (void)uninhibit:(guint)cookie
{
	gtk_application_uninhibit([self castedGObject], cookie);
}


@end