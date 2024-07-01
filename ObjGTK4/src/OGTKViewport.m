/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKViewport.h"

#import "OGTKAdjustment.h"

@implementation OGTKViewport

- (instancetype)initWithHadjustment:(OGTKAdjustment*)hadjustment vadjustment:(OGTKAdjustment*)vadjustment
{
	GtkViewport* gobjectValue = GTK_VIEWPORT(gtk_viewport_new([hadjustment castedGObject], [vadjustment castedGObject]));

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

- (GtkViewport*)castedGObject
{
	return GTK_VIEWPORT([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_viewport_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)scrollToFocus
{
	bool returnValue = gtk_viewport_get_scroll_to_focus([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_viewport_set_child([self castedGObject], [child castedGObject]);
}

- (void)setScrollToFocus:(bool)scrollToFocus
{
	gtk_viewport_set_scroll_to_focus([self castedGObject], scrollToFocus);
}


@end