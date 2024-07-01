/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextMark.h"

#import "OGTKTextBuffer.h"

@implementation OGTKTextMark

- (instancetype)initWithName:(OFString*)name leftGravity:(bool)leftGravity
{
	GtkTextMark* gobjectValue = GTK_TEXT_MARK(gtk_text_mark_new([name UTF8String], leftGravity));

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

- (GtkTextMark*)castedGObject
{
	return GTK_TEXT_MARK([self gObject]);
}

- (OGTKTextBuffer*)buffer
{
	GtkTextBuffer* gobjectValue = GTK_TEXT_BUFFER(gtk_text_mark_get_buffer([self castedGObject]));

	OGTKTextBuffer* returnValue = [OGTKTextBuffer withGObject:gobjectValue];
	return returnValue;
}

- (bool)deleted
{
	bool returnValue = gtk_text_mark_get_deleted([self castedGObject]);

	return returnValue;
}

- (bool)leftGravity
{
	bool returnValue = gtk_text_mark_get_left_gravity([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_text_mark_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)visible
{
	bool returnValue = gtk_text_mark_get_visible([self castedGObject]);

	return returnValue;
}

- (void)setVisible:(bool)setting
{
	gtk_text_mark_set_visible([self castedGObject], setting);
}


@end