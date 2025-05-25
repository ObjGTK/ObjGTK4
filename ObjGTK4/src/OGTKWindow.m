/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindow.h"

#import <OGdk4/OGdkDisplay.h>
#import <OGdk4/OGdkMonitor.h>
#import "OGTKApplication.h"
#import "OGTKWindowGroup.h"

@implementation OGTKWindow

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WINDOW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_WINDOW);
	return gObjectClass;
}

+ (OFString*)defaultIconName
{
	const char* gobjectValue = gtk_window_get_default_icon_name();

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (GListModel*)toplevels
{
	GListModel* returnValue = (GListModel*)gtk_window_get_toplevels();

	return returnValue;
}

+ (GList*)listToplevels
{
	GList* returnValue = (GList*)gtk_window_list_toplevels();

	return returnValue;
}

+ (void)setAutoStartupNotificationWithSetting:(bool)setting
{
	gtk_window_set_auto_startup_notification(setting);
}

+ (void)setDefaultIconName:(OFString*)name
{
	gtk_window_set_default_icon_name([name UTF8String]);
}

+ (void)setInteractiveDebuggingWithEnable:(bool)enable
{
	gtk_window_set_interactive_debugging(enable);
}

+ (instancetype)window
{
	GtkWindow* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_window_new(), GTK_TYPE_WINDOW, GtkWindow);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKWindow* wrapperObject;
	@try {
		wrapperObject = [[OGTKWindow alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkWindow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_WINDOW, GtkWindow);
}

- (void)close
{
	gtk_window_close((GtkWindow*)[self castedGObject]);
}

- (void)destroy
{
	gtk_window_destroy((GtkWindow*)[self castedGObject]);
}

- (void)fullscreen
{
	gtk_window_fullscreen((GtkWindow*)[self castedGObject]);
}

- (void)fullscreenOnMonitor:(OGdkMonitor*)monitor
{
	gtk_window_fullscreen_on_monitor((GtkWindow*)[self castedGObject], [monitor castedGObject]);
}

- (OGTKApplication*)application
{
	GtkApplication* gobjectValue = gtk_window_get_application((GtkWindow*)[self castedGObject]);

	OGTKApplication* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_window_get_child((GtkWindow*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)decorated
{
	bool returnValue = (bool)gtk_window_get_decorated((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (void)defaultSizeWithWidth:(int*)width height:(int*)height
{
	gtk_window_get_default_size((GtkWindow*)[self castedGObject], width, height);
}

- (OGTKWidget*)defaultWidget
{
	GtkWidget* gobjectValue = gtk_window_get_default_widget((GtkWindow*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)deletable
{
	bool returnValue = (bool)gtk_window_get_deletable((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)destroyWithParent
{
	bool returnValue = (bool)gtk_window_get_destroy_with_parent((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)focus
{
	GtkWidget* gobjectValue = gtk_window_get_focus((GtkWindow*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)focusVisible
{
	bool returnValue = (bool)gtk_window_get_focus_visible((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (OGTKWindowGroup*)group
{
	GtkWindowGroup* gobjectValue = gtk_window_get_group((GtkWindow*)[self castedGObject]);

	OGTKWindowGroup* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)handleMenubarAccel
{
	bool returnValue = (bool)gtk_window_get_handle_menubar_accel((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)hideOnClose
{
	bool returnValue = (bool)gtk_window_get_hide_on_close((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_window_get_icon_name((GtkWindow*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)mnemonicsVisible
{
	bool returnValue = (bool)gtk_window_get_mnemonics_visible((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)modal
{
	bool returnValue = (bool)gtk_window_get_modal((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)resizable
{
	bool returnValue = (bool)gtk_window_get_resizable((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_window_get_title((GtkWindow*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)titlebar
{
	GtkWidget* gobjectValue = gtk_window_get_titlebar((GtkWindow*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWindow*)transientFor
{
	GtkWindow* gobjectValue = gtk_window_get_transient_for((GtkWindow*)[self castedGObject]);

	OGTKWindow* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasGroup
{
	bool returnValue = (bool)gtk_window_has_group((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)isActive
{
	bool returnValue = (bool)gtk_window_is_active((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)isFullscreen
{
	bool returnValue = (bool)gtk_window_is_fullscreen((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)isMaximized
{
	bool returnValue = (bool)gtk_window_is_maximized((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (bool)isSuspended
{
	bool returnValue = (bool)gtk_window_is_suspended((GtkWindow*)[self castedGObject]);

	return returnValue;
}

- (void)maximize
{
	gtk_window_maximize((GtkWindow*)[self castedGObject]);
}

- (void)minimize
{
	gtk_window_minimize((GtkWindow*)[self castedGObject]);
}

- (void)present
{
	gtk_window_present((GtkWindow*)[self castedGObject]);
}

- (void)presentWithTimeWithTimestamp:(guint32)timestamp
{
	gtk_window_present_with_time((GtkWindow*)[self castedGObject], timestamp);
}

- (void)setApplication:(OGTKApplication*)application
{
	gtk_window_set_application((GtkWindow*)[self castedGObject], [application castedGObject]);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_window_set_child((GtkWindow*)[self castedGObject], [child castedGObject]);
}

- (void)setDecoratedWithSetting:(bool)setting
{
	gtk_window_set_decorated((GtkWindow*)[self castedGObject], setting);
}

- (void)setDefaultSizeWithWidth:(int)width height:(int)height
{
	gtk_window_set_default_size((GtkWindow*)[self castedGObject], width, height);
}

- (void)setDefaultWidget:(OGTKWidget*)defaultWidget
{
	gtk_window_set_default_widget((GtkWindow*)[self castedGObject], [defaultWidget castedGObject]);
}

- (void)setDeletableWithSetting:(bool)setting
{
	gtk_window_set_deletable((GtkWindow*)[self castedGObject], setting);
}

- (void)setDestroyWithParentWithSetting:(bool)setting
{
	gtk_window_set_destroy_with_parent((GtkWindow*)[self castedGObject], setting);
}

- (void)setDisplay:(OGdkDisplay*)display
{
	gtk_window_set_display((GtkWindow*)[self castedGObject], [display castedGObject]);
}

- (void)setFocus:(OGTKWidget*)focus
{
	gtk_window_set_focus((GtkWindow*)[self castedGObject], [focus castedGObject]);
}

- (void)setFocusVisibleWithSetting:(bool)setting
{
	gtk_window_set_focus_visible((GtkWindow*)[self castedGObject], setting);
}

- (void)setHandleMenubarAccel:(bool)handleMenubarAccel
{
	gtk_window_set_handle_menubar_accel((GtkWindow*)[self castedGObject], handleMenubarAccel);
}

- (void)setHideOnCloseWithSetting:(bool)setting
{
	gtk_window_set_hide_on_close((GtkWindow*)[self castedGObject], setting);
}

- (void)setIconName:(OFString*)name
{
	gtk_window_set_icon_name((GtkWindow*)[self castedGObject], [name UTF8String]);
}

- (void)setMnemonicsVisibleWithSetting:(bool)setting
{
	gtk_window_set_mnemonics_visible((GtkWindow*)[self castedGObject], setting);
}

- (void)setModal:(bool)modal
{
	gtk_window_set_modal((GtkWindow*)[self castedGObject], modal);
}

- (void)setResizable:(bool)resizable
{
	gtk_window_set_resizable((GtkWindow*)[self castedGObject], resizable);
}

- (void)setStartupId:(OFString*)startupId
{
	gtk_window_set_startup_id((GtkWindow*)[self castedGObject], [startupId UTF8String]);
}

- (void)setTitle:(OFString*)title
{
	gtk_window_set_title((GtkWindow*)[self castedGObject], [title UTF8String]);
}

- (void)setTitlebar:(OGTKWidget*)titlebar
{
	gtk_window_set_titlebar((GtkWindow*)[self castedGObject], [titlebar castedGObject]);
}

- (void)setTransientForWithParent:(OGTKWindow*)parent
{
	gtk_window_set_transient_for((GtkWindow*)[self castedGObject], [parent castedGObject]);
}

- (void)unfullscreen
{
	gtk_window_unfullscreen((GtkWindow*)[self castedGObject]);
}

- (void)unmaximize
{
	gtk_window_unmaximize((GtkWindow*)[self castedGObject]);
}

- (void)unminimize
{
	gtk_window_unminimize((GtkWindow*)[self castedGObject]);
}


@end