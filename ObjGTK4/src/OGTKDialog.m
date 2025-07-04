/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDialog.h"

#import "OGTKWidget.h"

@implementation OGTKDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_DIALOG);
	return gObjectClass;
}

+ (instancetype)dialog
{
	GtkDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_dialog_new(), GTK_TYPE_DIALOG, GtkDialog);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_DIALOG, GtkDialog);
}

- (void)addActionWidgetWithChild:(OGTKWidget*)child responseId:(int)responseId
{
	gtk_dialog_add_action_widget((GtkDialog*)[self castedGObject], [child castedGObject], responseId);
}

- (OGTKWidget*)addButtonWithButtonText:(OFString*)buttonText responseId:(int)responseId
{
	GtkWidget* gobjectValue = gtk_dialog_add_button((GtkDialog*)[self castedGObject], [buttonText UTF8String], responseId);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)contentArea
{
	GtkWidget* gobjectValue = gtk_dialog_get_content_area((GtkDialog*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)headerBar
{
	GtkWidget* gobjectValue = gtk_dialog_get_header_bar((GtkDialog*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)responseForWidget:(OGTKWidget*)widget
{
	int returnValue = (int)gtk_dialog_get_response_for_widget((GtkDialog*)[self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widgetForResponseWithResponseId:(int)responseId
{
	GtkWidget* gobjectValue = gtk_dialog_get_widget_for_response((GtkDialog*)[self castedGObject], responseId);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)responseWithResponseId:(int)responseId
{
	gtk_dialog_response((GtkDialog*)[self castedGObject], responseId);
}

- (void)setDefaultResponseWithResponseId:(int)responseId
{
	gtk_dialog_set_default_response((GtkDialog*)[self castedGObject], responseId);
}

- (void)setResponseSensitiveWithResponseId:(int)responseId setting:(bool)setting
{
	gtk_dialog_set_response_sensitive((GtkDialog*)[self castedGObject], responseId, setting);
}


@end