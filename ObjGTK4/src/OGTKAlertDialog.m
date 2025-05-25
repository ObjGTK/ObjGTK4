/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAlertDialog.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"

@implementation OGTKAlertDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ALERT_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ALERT_DIALOG);
	return gObjectClass;
}

- (GtkAlertDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ALERT_DIALOG, GtkAlertDialog);
}

- (void)chooseWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_alert_dialog_choose((GtkAlertDialog*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (int)chooseFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	int returnValue = (int)gtk_alert_dialog_choose_finish((GtkAlertDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (const char* const*)buttons
{
	const char* const* returnValue = (const char* const*)gtk_alert_dialog_get_buttons((GtkAlertDialog*)[self castedGObject]);

	return returnValue;
}

- (int)cancelButton
{
	int returnValue = (int)gtk_alert_dialog_get_cancel_button((GtkAlertDialog*)[self castedGObject]);

	return returnValue;
}

- (int)defaultButton
{
	int returnValue = (int)gtk_alert_dialog_get_default_button((GtkAlertDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)detail
{
	const char* gobjectValue = gtk_alert_dialog_get_detail((GtkAlertDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)message
{
	const char* gobjectValue = gtk_alert_dialog_get_message((GtkAlertDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)modal
{
	bool returnValue = (bool)gtk_alert_dialog_get_modal((GtkAlertDialog*)[self castedGObject]);

	return returnValue;
}

- (void)setButtonsWithLabels:(const char* const*)labels
{
	gtk_alert_dialog_set_buttons((GtkAlertDialog*)[self castedGObject], labels);
}

- (void)setCancelButton:(int)button
{
	gtk_alert_dialog_set_cancel_button((GtkAlertDialog*)[self castedGObject], button);
}

- (void)setDefaultButton:(int)button
{
	gtk_alert_dialog_set_default_button((GtkAlertDialog*)[self castedGObject], button);
}

- (void)setDetail:(OFString*)detail
{
	gtk_alert_dialog_set_detail((GtkAlertDialog*)[self castedGObject], [detail UTF8String]);
}

- (void)setMessage:(OFString*)message
{
	gtk_alert_dialog_set_message((GtkAlertDialog*)[self castedGObject], [message UTF8String]);
}

- (void)setModal:(bool)modal
{
	gtk_alert_dialog_set_modal((GtkAlertDialog*)[self castedGObject], modal);
}

- (void)showWithParent:(OGTKWindow*)parent
{
	gtk_alert_dialog_show((GtkAlertDialog*)[self castedGObject], [parent castedGObject]);
}


@end