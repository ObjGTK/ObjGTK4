/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNotebookPage.h"

#import "OGTKWidget.h"

@implementation OGTKNotebookPage

- (GtkNotebookPage*)castedGObject
{
	return GTK_NOTEBOOK_PAGE([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_notebook_page_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}


@end