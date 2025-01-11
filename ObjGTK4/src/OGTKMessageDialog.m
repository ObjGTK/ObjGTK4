/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMessageDialog.h"

#import "OGTKWidget.h"

@implementation OGTKMessageDialog

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MESSAGE_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkMessageDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkMessageDialog, GtkMessageDialog);
}

- (OGTKWidget*)messageArea
{
	GtkWidget* gobjectValue = gtk_message_dialog_get_message_area([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setMarkup:(OFString*)str
{
	gtk_message_dialog_set_markup([self castedGObject], [str UTF8String]);
}


@end