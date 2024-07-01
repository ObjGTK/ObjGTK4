/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSearchEntry.h"

@implementation OGTKSearchEntry

- (instancetype)init
{
	GtkSearchEntry* gobjectValue = GTK_SEARCH_ENTRY(gtk_search_entry_new());

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

- (GtkSearchEntry*)castedGObject
{
	return GTK_SEARCH_ENTRY([self gObject]);
}

- (OGTKWidget*)keyCaptureWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_search_entry_get_key_capture_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (guint)searchDelay
{
	guint returnValue = gtk_search_entry_get_search_delay([self castedGObject]);

	return returnValue;
}

- (void)setKeyCaptureWidget:(OGTKWidget*)widget
{
	gtk_search_entry_set_key_capture_widget([self castedGObject], [widget castedGObject]);
}

- (void)setSearchDelay:(guint)delay
{
	gtk_search_entry_set_search_delay([self castedGObject], delay);
}


@end