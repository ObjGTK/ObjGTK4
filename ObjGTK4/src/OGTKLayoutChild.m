/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutChild.h"

#import "OGTKLayoutManager.h"
#import "OGTKWidget.h"

@implementation OGTKLayoutChild

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LAYOUT_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GtkLayoutChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkLayoutChild, GtkLayoutChild);
}

- (OGTKWidget*)childWidget
{
	GtkWidget* gobjectValue = gtk_layout_child_get_child_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKLayoutManager*)layoutManager
{
	GtkLayoutManager* gobjectValue = gtk_layout_child_get_layout_manager([self castedGObject]);

	OGTKLayoutManager* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end