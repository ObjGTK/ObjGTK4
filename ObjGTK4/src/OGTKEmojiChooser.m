/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEmojiChooser.h"

#import "OGTKWidget.h"

@implementation OGTKEmojiChooser

- (instancetype)init
{
	GtkEmojiChooser* gobjectValue = GTK_EMOJI_CHOOSER(gtk_emoji_chooser_new());

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

- (GtkEmojiChooser*)castedGObject
{
	return GTK_EMOJI_CHOOSER([self gObject]);
}


@end