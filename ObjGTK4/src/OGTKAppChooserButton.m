/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAppChooserButton.h"

@implementation OGTKAppChooserButton

- (instancetype)init:(OFString*)contentType
{
	GtkAppChooserButton* gobjectValue = GTK_APP_CHOOSER_BUTTON(gtk_app_chooser_button_new([contentType UTF8String]));

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

- (GtkAppChooserButton*)castedGObject
{
	return GTK_APP_CHOOSER_BUTTON([self gObject]);
}

- (void)appendCustomItemWithName:(OFString*)name label:(OFString*)label icon:(GIcon*)icon
{
	gtk_app_chooser_button_append_custom_item([self castedGObject], [name UTF8String], [label UTF8String], icon);
}

- (void)appendSeparator
{
	gtk_app_chooser_button_append_separator([self castedGObject]);
}

- (OFString*)heading
{
	const char* gobjectValue = gtk_app_chooser_button_get_heading([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)modal
{
	bool returnValue = gtk_app_chooser_button_get_modal([self castedGObject]);

	return returnValue;
}

- (bool)showDefaultItem
{
	bool returnValue = gtk_app_chooser_button_get_show_default_item([self castedGObject]);

	return returnValue;
}

- (bool)showDialogItem
{
	bool returnValue = gtk_app_chooser_button_get_show_dialog_item([self castedGObject]);

	return returnValue;
}

- (void)setActiveCustomItem:(OFString*)name
{
	gtk_app_chooser_button_set_active_custom_item([self castedGObject], [name UTF8String]);
}

- (void)setHeading:(OFString*)heading
{
	gtk_app_chooser_button_set_heading([self castedGObject], [heading UTF8String]);
}

- (void)setModal:(bool)modal
{
	gtk_app_chooser_button_set_modal([self castedGObject], modal);
}

- (void)setShowDefaultItem:(bool)setting
{
	gtk_app_chooser_button_set_show_default_item([self castedGObject], setting);
}

- (void)setShowDialogItem:(bool)setting
{
	gtk_app_chooser_button_set_show_dialog_item([self castedGObject], setting);
}


@end