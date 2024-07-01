/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowHandle.h"

@implementation OGTKWindowHandle

- (instancetype)init
{
	GtkWindowHandle* gobjectValue = GTK_WINDOW_HANDLE(gtk_window_handle_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkWindowHandle*)castedGObject
{
	return GTK_WINDOW_HANDLE([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_window_handle_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_window_handle_set_child([self castedGObject], [child castedGObject]);
}


@end