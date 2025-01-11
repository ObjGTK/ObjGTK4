/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSearchEntry.h"

@implementation OGTKSearchEntry

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SEARCH_ENTRY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)searchEntry
{
	GtkSearchEntry* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_search_entry_new(), GtkSearchEntry, GtkSearchEntry);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKSearchEntry* wrapperObject;
	@try {
		wrapperObject = [[OGTKSearchEntry alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSearchEntry*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSearchEntry, GtkSearchEntry);
}

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = (GtkInputHints)gtk_search_entry_get_input_hints([self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = (GtkInputPurpose)gtk_search_entry_get_input_purpose([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)keyCaptureWidget
{
	GtkWidget* gobjectValue = gtk_search_entry_get_key_capture_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
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
	guint returnValue = (guint)gtk_search_entry_get_search_delay([self castedGObject]);

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