/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKInfoBar.h"

@implementation OGTKInfoBar

- (instancetype)init
{
	GtkInfoBar* gobjectValue = GTK_INFO_BAR(gtk_info_bar_new());

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

- (GtkInfoBar*)castedGObject
{
	return GTK_INFO_BAR([self gObject]);
}

- (void)addActionWidgetWithChild:(OGTKWidget*)child responseId:(int)responseId
{
	gtk_info_bar_add_action_widget([self castedGObject], [child castedGObject], responseId);
}

- (OGTKWidget*)addButtonWithButtonText:(OFString*)buttonText responseId:(int)responseId
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_info_bar_add_button([self castedGObject], [buttonText UTF8String], responseId));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)addChild:(OGTKWidget*)widget
{
	gtk_info_bar_add_child([self castedGObject], [widget castedGObject]);
}

- (GtkMessageType)messageType
{
	GtkMessageType returnValue = gtk_info_bar_get_message_type([self castedGObject]);

	return returnValue;
}

- (bool)revealed
{
	bool returnValue = gtk_info_bar_get_revealed([self castedGObject]);

	return returnValue;
}

- (bool)showCloseButton
{
	bool returnValue = gtk_info_bar_get_show_close_button([self castedGObject]);

	return returnValue;
}

- (void)removeActionWidget:(OGTKWidget*)widget
{
	gtk_info_bar_remove_action_widget([self castedGObject], [widget castedGObject]);
}

- (void)removeChild:(OGTKWidget*)widget
{
	gtk_info_bar_remove_child([self castedGObject], [widget castedGObject]);
}

- (void)response:(int)responseId
{
	gtk_info_bar_response([self castedGObject], responseId);
}

- (void)setDefaultResponse:(int)responseId
{
	gtk_info_bar_set_default_response([self castedGObject], responseId);
}

- (void)setMessageType:(GtkMessageType)messageType
{
	gtk_info_bar_set_message_type([self castedGObject], messageType);
}

- (void)setResponseSensitiveWithResponseId:(int)responseId setting:(bool)setting
{
	gtk_info_bar_set_response_sensitive([self castedGObject], responseId, setting);
}

- (void)setRevealed:(bool)revealed
{
	gtk_info_bar_set_revealed([self castedGObject], revealed);
}

- (void)setShowCloseButton:(bool)setting
{
	gtk_info_bar_set_show_close_button([self castedGObject], setting);
}


@end