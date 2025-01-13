/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKApplicationWindow.h"

#import "OGTKApplication.h"
#import "OGTKShortcutsWindow.h"
#import "OGTKWidget.h"

@implementation OGTKApplicationWindow

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_APPLICATION_WINDOW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)applicationWindowWithApplication:(OGTKApplication*)application
{
	GtkApplicationWindow* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_application_window_new([application castedGObject]), GtkApplicationWindow, GtkApplicationWindow);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKApplicationWindow* wrapperObject;
	@try {
		wrapperObject = [[OGTKApplicationWindow alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkApplicationWindow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkApplicationWindow, GtkApplicationWindow);
}

- (OGTKShortcutsWindow*)helpOverlay
{
	GtkShortcutsWindow* gobjectValue = gtk_application_window_get_help_overlay([self castedGObject]);

	OGTKShortcutsWindow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)id
{
	guint returnValue = (guint)gtk_application_window_get_id([self castedGObject]);

	return returnValue;
}

- (bool)showMenubar
{
	bool returnValue = (bool)gtk_application_window_get_show_menubar([self castedGObject]);

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