/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutChild.h"

#import "OGTKWidget.h"
#import "OGTKLayoutManager.h"

@implementation OGTKLayoutChild

- (GtkLayoutChild*)castedGObject
{
	return GTK_LAYOUT_CHILD([self gObject]);
}

- (OGTKWidget*)childWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_layout_child_get_child_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKLayoutManager*)layoutManager
{
	GtkLayoutManager* gobjectValue = GTK_LAYOUT_MANAGER(gtk_layout_child_get_layout_manager([self castedGObject]));

	OGTKLayoutManager* returnValue = [OGTKLayoutManager withGObject:gobjectValue];
	return returnValue;
}


@end