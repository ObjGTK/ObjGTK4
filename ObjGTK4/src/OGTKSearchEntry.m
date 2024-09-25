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

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = gtk_search_entry_get_input_hints([self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = gtk_search_entry_get_input_purpose([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)keyCaptureWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_search_entry_get_key_capture_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)placeholderText
{
	const char* gobjectValue = gtk_search_entry_get_placeholder_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)searchDelay
{
	guint returnValue = gtk_search_entry_get_search_delay([self castedGObject]);

	return returnValue;
}

- (void)setInputHints:(GtkInputHints)hints
{
	gtk_search_entry_set_input_hints([self castedGObject], hints);
}

- (void)setInputPurpose:(GtkInputPurpose)purpose
{
	gtk_search_entry_set_input_purpose([self castedGObject], purpose);
}

- (void)setKeyCaptureWidget:(OGTKWidget*)widget
{
	gtk_search_entry_set_key_capture_widget([self castedGObject], [widget castedGObject]);
}

- (void)setPlaceholderText:(OFString*)text
{
	gtk_search_entry_set_placeholder_text([self castedGObject], [text UTF8String]);
}

- (void)setSearchDelay:(guint)delay
{
	gtk_search_entry_set_search_delay([self castedGObject], delay);
}


@end