/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAppChooserDialog.h"

#import "OGTKWidget.h"
#import "OGTKWindow.h"

@implementation OGTKAppChooserDialog

- (instancetype)initWithParent:(OGTKWindow*)parent flags:(GtkDialogFlags)flags file:(GFile*)file
{
	GtkAppChooserDialog* gobjectValue = GTK_APP_CHOOSER_DIALOG(gtk_app_chooser_dialog_new([parent castedGObject], flags, file));

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

- (instancetype)initForContentTypeWithParent:(OGTKWindow*)parent flags:(GtkDialogFlags)flags contentType:(OFString*)contentType
{
	GtkAppChooserDialog* gobjectValue = GTK_APP_CHOOSER_DIALOG(gtk_app_chooser_dialog_new_for_content_type([parent castedGObject], flags, [contentType UTF8String]));

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

- (GtkAppChooserDialog*)castedGObject
{
	return GTK_APP_CHOOSER_DIALOG([self gObject]);
}

- (OFString*)heading
{
	const char* gobjectValue = gtk_app_chooser_dialog_get_heading([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGTKWidget*)widget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_app_chooser_dialog_get_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)setHeading:(OFString*)heading
{
	gtk_app_chooser_dialog_set_heading([self castedGObject], [heading UTF8String]);
}


@end