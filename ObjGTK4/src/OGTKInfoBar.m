/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKInfoBar.h"

@implementation OGTKInfoBar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_INFO_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_INFO_BAR);
	return gObjectClass;
}

+ (instancetype)infoBar
{
	GtkInfoBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_info_bar_new(), GTK_TYPE_INFO_BAR, GtkInfoBar);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_INFO_BAR, GtkInfoBar);
}

- (void)addActionWidgetWithChild:(OGTKWidget*)child responseId:(int)responseId
{
	gtk_info_bar_add_action_widget((GtkInfoBar*)[self castedGObject], [child castedGObject], responseId);
}

- (OGTKWidget*)addButtonWithButtonText:(OFString*)buttonText responseId:(int)responseId
{
	GtkWidget* gobjectValue = gtk_info_bar_add_button((GtkInfoBar*)[self castedGObject], [buttonText UTF8String], responseId);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)addChildWithWidget:(OGTKWidget*)widget
{
	gtk_info_bar_add_child((GtkInfoBar*)[self castedGObject], [widget castedGObject]);
}

- (GtkMessageType)messageType
{
	GtkMessageType returnValue = (GtkMessageType)gtk_info_bar_get_message_type((GtkInfoBar*)[self castedGObject]);

	return returnValue;
}

- (bool)revealed
{
	bool returnValue = (bool)gtk_info_bar_get_revealed((GtkInfoBar*)[self castedGObject]);

	return returnValue;
}

- (bool)showCloseButton
{
	bool returnValue = (bool)gtk_info_bar_get_show_close_button((GtkInfoBar*)[self castedGObject]);

	return returnValue;
}

- (void)removeActionWidget:(OGTKWidget*)widget
{
	gtk_info_bar_remove_action_widget((GtkInfoBar*)[self castedGObject], [widget castedGObject]);
}

- (void)removeChildWithWidget:(OGTKWidget*)widget
{
	gtk_info_bar_remove_child((GtkInfoBar*)[self castedGObject], [widget castedGObject]);
}

- (void)responseWithResponseId:(int)responseId
{
	gtk_info_bar_response((GtkInfoBar*)[self castedGObject], responseId);
}

- (void)setDefaultResponseWithResponseId:(int)responseId
{
	gtk_info_bar_set_default_response((GtkInfoBar*)[self castedGObject], responseId);
}

- (void)setMessageType:(GtkMessageType)messageType
{
	gtk_info_bar_set_message_type((GtkInfoBar*)[self castedGObject], messageType);
}

- (void)setResponseSensitiveWithResponseId:(int)responseId setting:(bool)setting
{
	gtk_info_bar_set_response_sensitive((GtkInfoBar*)[self castedGObject], responseId, setting);
}

- (void)setRevealed:(bool)revealed
{
	gtk_info_bar_set_revealed((GtkInfoBar*)[self castedGObject], revealed);
}

- (void)setShowCloseButtonWithSetting:(bool)setting
{
	gtk_info_bar_set_show_close_button((GtkInfoBar*)[self castedGObject], setting);
}


@end