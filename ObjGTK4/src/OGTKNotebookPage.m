/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNotebookPage.h"

#import "OGTKWidget.h"

@implementation OGTKNotebookPage

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_NOTEBOOK_PAGE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkNotebookPage*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkNotebookPage, GtkNotebookPage);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_notebook_page_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end