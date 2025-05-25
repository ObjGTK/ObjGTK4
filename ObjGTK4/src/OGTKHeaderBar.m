/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKHeaderBar.h"

@implementation OGTKHeaderBar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_HEADER_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_HEADER_BAR);
	return gObjectClass;
}

+ (instancetype)headerBar
{
	GtkHeaderBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_header_bar_new(), GTK_TYPE_HEADER_BAR, GtkHeaderBar);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_HEADER_BAR, GtkHeaderBar);
}

- (OFString*)decorationLayout
{
	const char* gobjectValue = gtk_header_bar_get_decoration_layout((GtkHeaderBar*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)showTitleButtons
{
	bool returnValue = (bool)gtk_header_bar_get_show_title_buttons((GtkHeaderBar*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)titleWidget
{
	GtkWidget* gobjectValue = gtk_header_bar_get_title_widget((GtkHeaderBar*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)packEndWithChild:(OGTKWidget*)child
{
	gtk_header_bar_pack_end((GtkHeaderBar*)[self castedGObject], [child castedGObject]);
}

- (void)packStartWithChild:(OGTKWidget*)child
{
	gtk_header_bar_pack_start((GtkHeaderBar*)[self castedGObject], [child castedGObject]);
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_header_bar_remove((GtkHeaderBar*)[self castedGObject], [child castedGObject]);
}

- (void)setDecorationLayout:(OFString*)layout
{
	gtk_header_bar_set_decoration_layout((GtkHeaderBar*)[self castedGObject], [layout UTF8String]);
}

- (void)setShowTitleButtonsWithSetting:(bool)setting
{
	gtk_header_bar_set_show_title_buttons((GtkHeaderBar*)[self castedGObject], setting);
}

- (void)setTitleWidget:(OGTKWidget*)titleWidget
{
	gtk_header_bar_set_title_widget((GtkHeaderBar*)[self castedGObject], [titleWidget castedGObject]);
}


@end