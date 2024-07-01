/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCheckButton.h"

@implementation OGTKCheckButton

- (instancetype)init
{
	GtkCheckButton* gobjectValue = GTK_CHECK_BUTTON(gtk_check_button_new());

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

- (instancetype)initWithLabel:(OFString*)label
{
	GtkCheckButton* gobjectValue = GTK_CHECK_BUTTON(gtk_check_button_new_with_label([label UTF8String]));

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

- (instancetype)initWithMnemonic:(OFString*)label
{
	GtkCheckButton* gobjectValue = GTK_CHECK_BUTTON(gtk_check_button_new_with_mnemonic([label UTF8String]));

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

- (GtkCheckButton*)castedGObject
{
	return GTK_CHECK_BUTTON([self gObject]);
}

- (bool)active
{
	bool returnValue = gtk_check_button_get_active([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_check_button_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)inconsistent
{
	bool returnValue = gtk_check_button_get_inconsistent([self castedGObject]);

	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_check_button_get_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useUnderline
{
	bool returnValue = gtk_check_button_get_use_underline([self castedGObject]);

	return returnValue;
}

- (void)setActive:(bool)setting
{
	gtk_check_button_set_active([self castedGObject], setting);
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_check_button_set_child([self castedGObject], [child castedGObject]);
}

- (void)setGroup:(OGTKCheckButton*)group
{
	gtk_check_button_set_group([self castedGObject], [group castedGObject]);
}

- (void)setInconsistent:(bool)inconsistent
{
	gtk_check_button_set_inconsistent([self castedGObject], inconsistent);
}

- (void)setLabel:(OFString*)label
{
	gtk_check_button_set_label([self castedGObject], [label UTF8String]);
}

- (void)setUseUnderline:(bool)setting
{
	gtk_check_button_set_use_underline([self castedGObject], setting);
}


@end