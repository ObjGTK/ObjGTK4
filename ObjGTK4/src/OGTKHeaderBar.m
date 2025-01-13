/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKHeaderBar.h"

@implementation OGTKHeaderBar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_HEADER_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)headerBar
{
	GtkHeaderBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_header_bar_new(), GtkHeaderBar, GtkHeaderBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKHeaderBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKHeaderBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkHeaderBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkHeaderBar, GtkHeaderBar);
}

- (OFString*)decorationLayout
{
	const char* gobjectValue = gtk_header_bar_get_decoration_layout([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)showTitleButtons
{
	bool returnValue = (bool)gtk_header_bar_get_show_title_buttons([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)titleWidget
{
	GtkWidget* gobjectValue = gtk_header_bar_get_title_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)packEndWithChild:(OGTKWidget*)child
{
	gtk_header_bar_pack_end([self castedGObject], [child castedGObject]);
}

- (void)packStartWithChild:(OGTKWidget*)child
{
	gtk_header_bar_pack_start([self castedGObject], [child castedGObject]);
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_header_bar_remove([self castedGObject], [child castedGObject]);
}

- (void)setDecorationLayout:(OFString*)layout
{
	gtk_header_bar_set_decoration_layout([self castedGObject], [layout UTF8String]);
}

- (void)setShowTitleButtonsWithSetting:(bool)setting
{
	gtk_header_bar_set_show_title_buttons([self castedGObject], setting);
}

- (void)setTitleWidget:(OGTKWidget*)titleWidget
{
	gtk_header_bar_set_title_widget([self castedGObject], [titleWidget castedGObject]);
}


@end