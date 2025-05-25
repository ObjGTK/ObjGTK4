/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMessageDialog.h"

#import "OGTKWidget.h"

@implementation OGTKMessageDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MESSAGE_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MESSAGE_DIALOG);
	return gObjectClass;
}

- (GtkMessageDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MESSAGE_DIALOG, GtkMessageDialog);
}

- (OGTKWidget*)messageArea
{
	GtkWidget* gobjectValue = gtk_message_dialog_get_message_area((GtkMessageDialog*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setMarkupWithStr:(OFString*)str
{
	gtk_message_dialog_set_markup((GtkMessageDialog*)[self castedGObject], [str UTF8String]);
}


@end