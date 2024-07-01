/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontButton.h"

@implementation OGTKFontButton

- (instancetype)init
{
	GtkFontButton* gobjectValue = GTK_FONT_BUTTON(gtk_font_button_new());

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

- (instancetype)initWithFont:(OFString*)fontname
{
	GtkFontButton* gobjectValue = GTK_FONT_BUTTON(gtk_font_button_new_with_font([fontname UTF8String]));

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

- (GtkFontButton*)castedGObject
{
	return GTK_FONT_BUTTON([self gObject]);
}

- (bool)modal
{
	bool returnValue = gtk_font_button_get_modal([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_font_button_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)useFont
{
	bool returnValue = gtk_font_button_get_use_font([self castedGObject]);

	return returnValue;
}

- (bool)useSize
{
	bool returnValue = gtk_font_button_get_use_size([self castedGObject]);

	return returnValue;
}

- (void)setModal:(bool)modal
{
	gtk_font_button_set_modal([self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_font_button_set_title([self castedGObject], [title UTF8String]);
}

- (void)setUseFont:(bool)useFont
{
	gtk_font_button_set_use_font([self castedGObject], useFont);
}

- (void)setUseSize:(bool)useSize
{
	gtk_font_button_set_use_size([self castedGObject], useSize);
}


@end