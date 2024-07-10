/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutManager.h"

#import "OGTKLayoutChild.h"
#import "OGTKWidget.h"

@implementation OGTKLayoutManager

- (GtkLayoutManager*)castedGObject
{
	return GTK_LAYOUT_MANAGER([self gObject]);
}

- (void)allocateWithWidget:(OGTKWidget*)widget width:(int)width height:(int)height baseline:(int)baseline
{
	gtk_layout_manager_allocate([self castedGObject], [widget castedGObject], width, height, baseline);
}

- (OGTKLayoutChild*)layoutChild:(OGTKWidget*)child
{
	GtkLayoutChild* gobjectValue = GTK_LAYOUT_CHILD(gtk_layout_manager_get_layout_child([self castedGObject], [child castedGObject]));

	OGTKLayoutChild* returnValue = [OGTKLayoutChild withGObject:gobjectValue];
	return returnValue;
}

- (GtkSizeRequestMode)requestMode
{
	GtkSizeRequestMode returnValue = gtk_layout_manager_get_request_mode([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_layout_manager_get_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)layoutChanged
{
	gtk_layout_manager_layout_changed([self castedGObject]);
}

- (void)measureWithWidget:(OGTKWidget*)widget orientation:(GtkOrientation)orientation forSize:(int)forSize minimum:(int*)minimum natural:(int*)natural minimumBaseline:(int*)minimumBaseline naturalBaseline:(int*)naturalBaseline
{
	gtk_layout_manager_measure([self castedGObject], [widget castedGObject], orientation, forSize, minimum, natural, minimumBaseline, naturalBaseline);
}


@end