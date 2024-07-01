/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileChooserWidget.h"

@implementation OGTKFileChooserWidget

- (instancetype)init:(GtkFileChooserAction)action
{
	GtkFileChooserWidget* gobjectValue = GTK_FILE_CHOOSER_WIDGET(gtk_file_chooser_widget_new(action));

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

- (GtkFileChooserWidget*)castedGObject
{
	return GTK_FILE_CHOOSER_WIDGET([self gObject]);
}


@end