/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSearchBar.h"

@implementation OGTKSearchBar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SEARCH_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)searchBar
{
	GtkSearchBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_search_bar_new(), GtkSearchBar, GtkSearchBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKSearchBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKSearchBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSearchBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSearchBar, GtkSearchBar);
}

- (void)connectEntry:(GtkEditable*)entry
{
	gtk_search_bar_connect_entry([self castedGObject], entry);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_search_bar_get_child([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)keyCaptureWidget
{
	GtkWidget* gobjectValue = gtk_search_bar_get_key_capture_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)searchMode
{
	bool returnValue = (bool)gtk_search_bar_get_search_mode([self castedGObject]);

	return returnValue;
}

- (bool)showCloseButton
{
	bool returnValue = (bool)gtk_search_bar_get_show_close_button([self castedGObject]);

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

- (void)setShowCloseButtonWithVisible:(bool)visible
{
	gtk_search_bar_set_show_close_button([self castedGObject], visible);
}


@end