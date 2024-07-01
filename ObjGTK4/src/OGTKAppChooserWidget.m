/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAppChooserWidget.h"

@implementation OGTKAppChooserWidget

- (instancetype)init:(OFString*)contentType
{
	GtkAppChooserWidget* gobjectValue = GTK_APP_CHOOSER_WIDGET(gtk_app_chooser_widget_new([contentType UTF8String]));

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

- (GtkAppChooserWidget*)castedGObject
{
	return GTK_APP_CHOOSER_WIDGET([self gObject]);
}

- (OFString*)defaultText
{
	const char* gobjectValue = gtk_app_chooser_widget_get_default_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)showAll
{
	bool returnValue = gtk_app_chooser_widget_get_show_all([self castedGObject]);

	return returnValue;
}

- (bool)showDefault
{
	bool returnValue = gtk_app_chooser_widget_get_show_default([self castedGObject]);

	return returnValue;
}

- (bool)showFallback
{
	bool returnValue = gtk_app_chooser_widget_get_show_fallback([self castedGObject]);

	return returnValue;
}

- (bool)showOther
{
	bool returnValue = gtk_app_chooser_widget_get_show_other([self castedGObject]);

	return returnValue;
}

- (bool)showRecommended
{
	bool returnValue = gtk_app_chooser_widget_get_show_recommended([self castedGObject]);

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