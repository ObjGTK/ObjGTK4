/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMessageDialog.h"

#import "OGTKWidget.h"

@implementation OGTKMessageDialog

- (GtkMessageDialog*)castedGObject
{
	return GTK_MESSAGE_DIALOG([self gObject]);
}

- (OGTKWidget*)messageArea
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_message_dialog_get_message_area([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)setMarkup:(OFString*)str
{
	gtk_message_dialog_set_markup([self castedGObject], [str UTF8String]);
}


@end