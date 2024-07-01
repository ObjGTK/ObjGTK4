/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextChildAnchor.h"

#import "OGTKWidget.h"

@implementation OGTKTextChildAnchor

- (instancetype)init
{
	GtkTextChildAnchor* gobjectValue = GTK_TEXT_CHILD_ANCHOR(gtk_text_child_anchor_new());

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

- (instancetype)initWithReplacement:(OFString*)character
{
	GtkTextChildAnchor* gobjectValue = GTK_TEXT_CHILD_ANCHOR(gtk_text_child_anchor_new_with_replacement([character UTF8String]));

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

- (GtkTextChildAnchor*)castedGObject
{
	return GTK_TEXT_CHILD_ANCHOR([self gObject]);
}

- (bool)deleted
{
	bool returnValue = gtk_text_child_anchor_get_deleted([self castedGObject]);

	return returnValue;
}

- (GtkWidget**)widgets:(guint*)outLen
{
	GtkWidget** returnValue = GTK_WIDGET(gtk_text_child_anchor_get_widgets([self castedGObject], outLen));

	return returnValue;
}


@end