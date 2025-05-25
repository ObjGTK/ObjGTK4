/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKApplication.h"

#import <OGio/OGMenu.h>
#import <OGio/OGMenuModel.h>
#import "OGTKWindow.h"

@implementation OGTKApplication

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_APPLICATION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_APPLICATION);
	return gObjectClass;
}

+ (instancetype)applicationWithApplicationId:(OFString*)applicationId flags:(GApplicationFlags)flags
{
	GtkApplication* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_application_new([applicationId UTF8String], flags), GTK_TYPE_APPLICATION, GtkApplication);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKApplication* wrapperObject;
	@try {
		wrapperObject = [[OGTKApplication alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkApplication*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_APPLICATION, GtkApplication);
}

- (void)addWindow:(OGTKWindow*)window
{
	gtk_application_add_window((GtkApplication*)[self castedGObject], [window castedGObject]);
}

- (char**)accelsForActionWithDetailedActionName:(OFString*)detailedActionName
{
	char** returnValue = (char**)gtk_application_get_accels_for_action((GtkApplication*)[self castedGObject], [detailedActionName UTF8String]);

	return returnValue;
}

- (char**)actionsForAccel:(OFString*)accel
{
	char** returnValue = (char**)gtk_application_get_actions_for_accel((GtkApplication*)[self castedGObject], [accel UTF8String]);

	return returnValue;
}

- (OGTKWindow*)activeWindow
{
	GtkWindow* gobjectValue = gtk_application_get_active_window((GtkApplication*)[self castedGObject]);

	OGTKWindow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGMenu*)menuByIdWithIdentifier:(OFString*)identifier
{
	GMenu* gobjectValue = gtk_application_get_menu_by_id((GtkApplication*)[self castedGObject], [identifier UTF8String]);

	OGMenu* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGMenuModel*)menubar
{
	GMenuModel* gobjectValue = gtk_application_get_menubar((GtkApplication*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWindow*)windowByIdWithIdentifier:(guint)identifier
{
	GtkWindow* gobjectValue = gtk_application_get_window_by_id((GtkApplication*)[self castedGObject], identifier);

	OGTKWindow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)windows
{
	GList* returnValue = (GList*)gtk_application_get_windows((GtkApplication*)[self castedGObject]);

	return returnValue;
}

- (guint)inhibitWithWindow:(OGTKWindow*)window flags:(GtkApplicationInhibitFlags)flags reason:(OFString*)reason
{
	guint returnValue = (guint)gtk_application_inhibit((GtkApplication*)[self castedGObject], [window castedGObject], flags, [reason UTF8String]);

	return returnValue;
}

- (char**)listActionDescriptions
{
	char** returnValue = (char**)gtk_application_list_action_descriptions((GtkApplication*)[self castedGObject]);

	return returnValue;
}

- (void)removeWindow:(OGTKWindow*)window
{
	gtk_application_remove_window((GtkApplication*)[self castedGObject], [window castedGObject]);
}

- (void)setAccelsForActionWithDetailedActionName:(OFString*)detailedActionName accels:(const char* const*)accels
{
	gtk_application_set_accels_for_action((GtkApplication*)[self castedGObject], [detailedActionName UTF8String], accels);
}

- (void)setMenubar:(OGMenuModel*)menubar
{
	gtk_application_set_menubar((GtkApplication*)[self castedGObject], [menubar castedGObject]);
}

- (void)uninhibitWithCookie:(guint)cookie
{
	gtk_application_uninhibit((GtkApplication*)[self castedGObject], cookie);
}


@end