/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontChooserDialog.h"

#import "OGTKWindow.h"
#import "OGTKWidget.h"

@implementation OGTKFontChooserDialog

- (instancetype)initWithTitle:(OFString*)title parent:(OGTKWindow*)parent
{
	GtkFontChooserDialog* gobjectValue = GTK_FONT_CHOOSER_DIALOG(gtk_font_chooser_dialog_new([title UTF8String], [parent castedGObject]));

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

- (GtkFontChooserDialog*)castedGObject
{
	return GTK_FONT_CHOOSER_DIALOG([self gObject]);
}


@end