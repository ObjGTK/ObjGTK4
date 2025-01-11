/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAppChooserWidget.h"

@implementation OGTKAppChooserWidget

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_APP_CHOOSER_WIDGET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)appChooserWidget:(OFString*)contentType
{
	GtkAppChooserWidget* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_app_chooser_widget_new([contentType UTF8String]), GtkAppChooserWidget, GtkAppChooserWidget);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAppChooserWidget* wrapperObject;
	@try {
		wrapperObject = [[OGTKAppChooserWidget alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAppChooserWidget*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkAppChooserWidget, GtkAppChooserWidget);
}

- (OFString*)defaultText
{
	const char* gobjectValue = gtk_app_chooser_widget_get_default_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)showAll
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_all([self castedGObject]);

	return returnValue;
}

- (bool)showDefault
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_default([self castedGObject]);

	return returnValue;
}

- (bool)showFallback
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_fallback([self castedGObject]);

	return returnValue;
}

- (bool)showOther
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_other([self castedGObject]);

	return returnValue;
}

- (bool)showRecommended
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_recommended([self castedGObject]);

	return returnValue;
}

- (void)setDefaultText:(OFString*)text
{
	gtk_app_chooser_widget_set_default_text([self castedGObject], [text UTF8String]);
}

- (void)setShowAll:(bool)setting
{
	gtk_app_chooser_widget_set_show_all([self castedGObject], setting);
}

- (void)setShowDefault:(bool)setting
{
	gtk_app_chooser_widget_set_show_default([self castedGObject], setting);
}

- (void)setShowFallback:(bool)setting
{
	gtk_app_chooser_widget_set_show_fallback([self castedGObject], setting);
}

- (void)setShowOther:(bool)setting
{
	gtk_app_chooser_widget_set_show_other([self castedGObject], setting);
}

- (void)setShowRecommended:(bool)setting
{
	gtk_app_chooser_widget_set_show_recommended([self castedGObject], setting);
}


@end