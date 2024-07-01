/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSearchBar.h"

@implementation OGTKSearchBar

- (instancetype)init
{
	GtkSearchBar* gobjectValue = GTK_SEARCH_BAR(gtk_search_bar_new());

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

- (GtkSearchBar*)castedGObject
{
	return GTK_SEARCH_BAR([self gObject]);
}

- (void)connectEntry:(GtkEditable*)entry
{
	gtk_search_bar_connect_entry([self castedGObject], entry);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_search_bar_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)keyCaptureWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_search_bar_get_key_capture_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)searchMode
{
	bool returnValue = gtk_search_bar_get_search_mode([self castedGObject]);

	return returnValue;
}

- (bool)showCloseButton
{
	bool returnValue = gtk_search_bar_get_show_close_button([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_search_bar_set_child([self castedGObject], [child castedGObject]);
}

- (void)setKeyCaptureWidget:(OGTKWidget*)widget
{
	gtk_search_bar_set_key_capture_widget([self castedGObject], [widget castedGObject]);
}

- (void)setSearchMode:(bool)searchMode
{
	gtk_search_bar_set_search_mode([self castedGObject], searchMode);
}

- (void)setShowCloseButton:(bool)visible
{
	gtk_search_bar_set_show_close_button([self castedGObject], visible);
}


@end