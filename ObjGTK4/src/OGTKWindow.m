/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindow.h"

#import <OGdk4/OGGdkMonitor.h>
#import "OGTKWindowGroup.h"
#import "OGTKApplication.h"
#import <OGdk4/OGGdkDisplay.h>

@implementation OGTKWindow

+ (OFString*)defaultIconName
{
	const char* gobjectValue = gtk_window_get_default_icon_name();

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

+ (GListModel*)toplevels
{
	GListModel* returnValue = gtk_window_get_toplevels();

	return returnValue;
}

+ (GList*)listToplevels
{
	GList* returnValue = gtk_window_list_toplevels();

	return returnValue;
}

+ (void)setAutoStartupNotification:(bool)setting
{
	gtk_window_set_auto_startup_notification(setting);
}

+ (void)setDefaultIconName:(OFString*)name
{
	gtk_window_set_default_icon_name([name UTF8String]);
}

+ (void)setInteractiveDebugging:(bool)enable
{
	gtk_window_set_interactive_debugging(enable);
}

- (instancetype)init
{
	GtkWindow* gobjectValue = GTK_WINDOW(gtk_window_new());

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkWindow*)castedGObject
{
	return GTK_WINDOW([self gObject]);
}

- (void)close
{
	gtk_window_close([self castedGObject]);
}

- (void)destroy
{
	gtk_window_destroy([self castedGObject]);
}

- (void)fullscreen
{
	gtk_window_fullscreen([self castedGObject]);
}

- (void)fullscreenOnMonitor:(OGGdkMonitor*)monitor
{
	gtk_window_fullscreen_on_monitor([self castedGObject], [monitor castedGObject]);
}

- (OGTKApplication*)application
{
	GtkApplication* gobjectValue = GTK_APPLICATION(gtk_window_get_application([self castedGObject]));

	OGTKApplication* returnValue = [OGTKApplication withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_window_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)decorated
{
	bool returnValue = gtk_window_get_decorated([self castedGObject]);

	return returnValue;
}

- (void)defaultSizeWithWidth:(int*)width height:(int*)height
{
	gtk_window_get_default_size([self castedGObject], width, height);
}

- (OGTKWidget*)defaultWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_window_get_default_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)deletable
{
	bool returnValue = gtk_window_get_deletable([self castedGObject]);

	return returnValue;
}

- (bool)destroyWithParent
{
	bool returnValue = gtk_window_get_destroy_with_parent([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)focus
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_window_get_focus([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)focusVisible
{
	bool returnValue = gtk_window_get_focus_visible([self castedGObject]);

	return returnValue;
}

- (OGTKWindowGroup*)group
{
	GtkWindowGroup* gobjectValue = GTK_WINDOW_GROUP(gtk_window_get_group([self castedGObject]));

	OGTKWindowGroup* returnValue = [OGTKWindowGroup withGObject:gobjectValue];
	return returnValue;
}

- (bool)handleMenubarAccel
{
	bool returnValue = gtk_window_get_handle_menubar_accel([self castedGObject]);

	return returnValue;
}

- (bool)hideOnClose
{
	bool returnValue = gtk_window_get_hide_on_close([self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_window_get_icon_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)mnemonicsVisible
{
	bool returnValue = gtk_window_get_mnemonics_visible([self castedGObject]);

	return returnValue;
}

- (bool)modal
{
	bool returnValue = gtk_window_get_modal([self castedGObject]);

	return returnValue;
}

- (bool)resizable
{
	bool returnValue = gtk_window_get_resizable([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_window_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)titlebar
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_window_get_titlebar([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWindow*)transientFor
{
	GtkWindow* gobjectValue = GTK_WINDOW(gtk_window_get_transient_for([self castedGObject]));

	OGTKWindow* returnValue = [OGTKWindow withGObject:gobjectValue];
	return returnValue;
}

- (bool)hasGroup
{
	bool returnValue = gtk_window_has_group([self castedGObject]);

	return returnValue;
}

- (bool)isActive
{
	bool returnValue = gtk_window_is_active([self castedGObject]);

	return returnValue;
}

- (bool)isFullscreen
{
	bool returnValue = gtk_window_is_fullscreen([self castedGObject]);

	return returnValue;
}

- (bool)isMaximized
{
	bool returnValue = gtk_window_is_maximized([self castedGObject]);

	return returnValue;
}

- (bool)isSuspended
{
	bool returnValue = gtk_window_is_suspended([self castedGObject]);

	return returnValue;
}

- (void)maximize
{
	gtk_window_maximize([self castedGObject]);
}

- (void)minimize
{
	gtk_window_minimize([self castedGObject]);
}

- (void)present
{
	gtk_window_present([self castedGObject]);
}

- (void)presentWithTime:(guint32)timestamp
{
	gtk_window_present_with_time([self castedGObject], timestamp);
}

- (void)setApplication:(OGTKApplication*)application
{
	gtk_window_set_application([self castedGObject], [application castedGObject]);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_window_set_child([self castedGObject], [child castedGObject]);
}

- (void)setDecorated:(bool)setting
{
	gtk_window_set_decorated([self castedGObject], setting);
}

- (void)setDefaultSizeWithWidth:(int)width height:(int)height
{
	gtk_window_set_default_size([self castedGObject], width, height);
}

- (void)setDefaultWidget:(OGTKWidget*)defaultWidget
{
	gtk_window_set_default_widget([self castedGObject], [defaultWidget castedGObject]);
}

- (void)setDeletable:(bool)setting
{
	gtk_window_set_deletable([self castedGObject], setting);
}

- (void)setDestroyWithParent:(bool)setting
{
	gtk_window_set_destroy_with_parent([self castedGObject], setting);
}

- (void)setDisplay:(OGGdkDisplay*)display
{
	gtk_window_set_display([self castedGObject], [display castedGObject]);
}

- (void)setFocus:(OGTKWidget*)focus
{
	gtk_window_set_focus([self castedGObject], [focus castedGObject]);
}

- (void)setFocusVisible:(bool)setting
{
	gtk_window_set_focus_visible([self castedGObject], setting);
}

- (void)setHandleMenubarAccel:(bool)handleMenubarAccel
{
	gtk_window_set_handle_menubar_accel([self castedGObject], handleMenubarAccel);
}

- (void)setHideOnClose:(bool)setting
{
	gtk_window_set_hide_on_close([self castedGObject], setting);
}

- (void)setIconName:(OFString*)name
{
	gtk_window_set_icon_name([self castedGObject], [name UTF8String]);
}

- (void)setMnemonicsVisible:(bool)setting
{
	gtk_window_set_mnemonics_visible([self castedGObject], setting);
}

- (void)setModal:(bool)modal
{
	gtk_window_set_modal([self castedGObject], modal);
}

- (void)setResizable:(bool)resizable
{
	gtk_window_set_resizable([self castedGObject], resizable);
}

- (void)setStartupId:(OFString*)startupId
{
	gtk_window_set_startup_id([self castedGObject], [startupId UTF8String]);
}

- (void)setTitle:(OFString*)title
{
	gtk_window_set_title([self castedGObject], [title UTF8String]);
}

- (void)setTitlebar:(OGTKWidget*)titlebar
{
	gtk_window_set_titlebar([self castedGObject], [titlebar castedGObject]);
}

- (void)setTransientFor:(OGTKWindow*)parent
{
	gtk_window_set_transient_for([self castedGObject], [parent castedGObject]);
}

- (void)unfullscreen
{
	gtk_window_unfullscreen([self castedGObject]);
}

- (void)unmaximize
{
	gtk_window_unmaximize([self castedGObject]);
}

- (void)unminimize
{
	gtk_window_unminimize([self castedGObject]);
}


@end