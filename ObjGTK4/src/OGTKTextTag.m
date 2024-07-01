/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextTag.h"

@implementation OGTKTextTag

- (instancetype)init:(OFString*)name
{
	GtkTextTag* gobjectValue = GTK_TEXT_TAG(gtk_text_tag_new([name UTF8String]));

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

- (GtkTextTag*)castedGObject
{
	return GTK_TEXT_TAG([self gObject]);
}

- (void)changed:(bool)sizeChanged
{
	gtk_text_tag_changed([self castedGObject], sizeChanged);
}

- (int)priority
{
	int returnValue = gtk_text_tag_get_priority([self castedGObject]);

	return returnValue;
}

- (void)setPriority:(int)priority
{
	gtk_text_tag_set_priority([self castedGObject], priority);
}


@end