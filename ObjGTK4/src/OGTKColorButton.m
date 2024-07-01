/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorButton.h"

@implementation OGTKColorButton

- (instancetype)init
{
	GtkColorButton* gobjectValue = GTK_COLOR_BUTTON(gtk_color_button_new());

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

- (instancetype)initWithRgba:(const GdkRGBA*)rgba
{
	GtkColorButton* gobjectValue = GTK_COLOR_BUTTON(gtk_color_button_new_with_rgba(rgba));

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

- (GtkColorButton*)castedGObject
{
	return GTK_COLOR_BUTTON([self gObject]);
}

- (bool)modal
{
	bool returnValue = gtk_color_button_get_modal([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_color_button_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setModal:(bool)modal
{
	gtk_color_button_set_modal([self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_color_button_set_title([self castedGObject], [title UTF8String]);
}


@end