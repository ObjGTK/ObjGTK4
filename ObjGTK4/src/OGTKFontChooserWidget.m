/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontChooserWidget.h"

@implementation OGTKFontChooserWidget

- (instancetype)init
{
	GtkFontChooserWidget* gobjectValue = GTK_FONT_CHOOSER_WIDGET(gtk_font_chooser_widget_new());

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

- (GtkFontChooserWidget*)castedGObject
{
	return GTK_FONT_CHOOSER_WIDGET([self gObject]);
}


@end