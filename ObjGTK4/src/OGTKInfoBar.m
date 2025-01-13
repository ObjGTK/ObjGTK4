/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKInfoBar.h"

@implementation OGTKInfoBar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_INFO_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)infoBar
{
	GtkInfoBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_info_bar_new(), GtkInfoBar, GtkInfoBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKInfoBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKInfoBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkInfoBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkInfoBar, GtkInfoBar);
}

- (void)addActionWidgetWithChild:(OGTKWidget*)child responseId:(int)responseId
{
	gtk_info_bar_add_action_widget([self castedGObject], [child castedGObject], responseId);
}

- (OGTKWidget*)addButtonWithButtonText:(OFString*)buttonText responseId:(int)responseId
{
	GtkWidget* gobjectValue = gtk_info_bar_add_button([self castedGObject], [buttonText UTF8String], responseId);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)addChildWithWidget:(OGTKWidget*)widget
{
	gtk_info_bar_add_child([self castedGObject], [widget castedGObject]);
}

- (GtkMessageType)messageType
{
	GtkMessageType returnValue = (GtkMessageType)gtk_info_bar_get_message_type([self castedGObject]);

	return returnValue;
}

- (bool)revealed
{
	bool returnValue = (bool)gtk_info_bar_get_revealed([self castedGObject]);

	return returnValue;
}

- (bool)showCloseButton
{
	bool returnValue = (bool)gtk_info_bar_get_show_close_button([self castedGObject]);

	return returnValue;
}

- (void)removeActionWidget:(OGTKWidget*)widget
{
	gtk_info_bar_remove_action_widget([self castedGObject], [widget castedGObject]);
}

- (void)removeChildWithWidget:(OGTKWidget*)widget
{
	gtk_info_bar_remove_child([self castedGObject], [widget castedGObject]);
}

- (void)responseWithResponseId:(int)responseId
{
	gtk_info_bar_response([self castedGObject], responseId);
}

- (void)setDefaultResponseWithResponseId:(int)responseId
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

- (void)setShowCloseButtonWithSetting:(bool)setting
{
	gtk_info_bar_set_show_close_button([self castedGObject], setting);
}


@end