/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDialog.h"

#import "OGTKWidget.h"

@implementation OGTKDialog

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)dialog
{
	GtkDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_dialog_new(), GtkDialog, GtkDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkDialog, GtkDialog);
}

- (void)addActionWidgetWithChild:(OGTKWidget*)child responseId:(int)responseId
{
	gtk_dialog_add_action_widget([self castedGObject], [child castedGObject], responseId);
}

- (OGTKWidget*)addButtonWithButtonText:(OFString*)buttonText responseId:(int)responseId
{
	GtkWidget* gobjectValue = gtk_dialog_add_button([self castedGObject], [buttonText UTF8String], responseId);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)contentArea
{
	GtkWidget* gobjectValue = gtk_dialog_get_content_area([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)headerBar
{
	GtkWidget* gobjectValue = gtk_dialog_get_header_bar([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)responseForWidget:(OGTKWidget*)widget
{
	int returnValue = (int)gtk_dialog_get_response_for_widget([self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widgetForResponse:(int)responseId
{
	GtkWidget* gobjectValue = gtk_dialog_get_widget_for_response([self castedGObject], responseId);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)response:(int)responseId
{
	gtk_dialog_response([self castedGObject], responseId);
}

- (void)setDefaultResponse:(int)responseId
{
	gtk_dialog_set_default_response([self castedGObject], responseId);
}

- (void)setResponseSensitiveWithResponseId:(int)responseId setting:(bool)setting
{
	gtk_dialog_set_response_sensitive([self castedGObject], responseId, setting);
}


@end