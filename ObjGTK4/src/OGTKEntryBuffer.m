/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEntryBuffer.h"

@implementation OGTKEntryBuffer

- (instancetype)initWithInitialChars:(OFString*)initialChars ninitialChars:(int)ninitialChars
{
	GtkEntryBuffer* gobjectValue = GTK_ENTRY_BUFFER(gtk_entry_buffer_new([initialChars UTF8String], ninitialChars));

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

- (GtkEntryBuffer*)castedGObject
{
	return GTK_ENTRY_BUFFER([self gObject]);
}

- (guint)deleteTextWithPosition:(guint)position nchars:(int)nchars
{
	guint returnValue = gtk_entry_buffer_delete_text([self castedGObject], position, nchars);

	return returnValue;
}

- (void)emitDeletedTextWithPosition:(guint)position nchars:(guint)nchars
{
	gtk_entry_buffer_emit_deleted_text([self castedGObject], position, nchars);
}

- (void)emitInsertedTextWithPosition:(guint)position chars:(OFString*)chars nchars:(guint)nchars
{
	gtk_entry_buffer_emit_inserted_text([self castedGObject], position, [chars UTF8String], nchars);
}

- (gsize)bytes
{
	gsize returnValue = gtk_entry_buffer_get_bytes([self castedGObject]);

	return returnValue;
}

- (guint)length
{
	guint returnValue = gtk_entry_buffer_get_length([self castedGObject]);

	return returnValue;
}

- (int)maxLength
{
	int returnValue = gtk_entry_buffer_get_max_length([self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = gtk_entry_buffer_get_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)insertTextWithPosition:(guint)position chars:(OFString*)chars nchars:(int)nchars
{
	guint returnValue = gtk_entry_buffer_insert_text([self castedGObject], position, [chars UTF8String], nchars);

	return returnValue;
}

- (void)setMaxLength:(int)maxLength
{
	gtk_entry_buffer_set_max_length([self castedGObject], maxLength);
}

- (void)setTextWithChars:(OFString*)chars nchars:(int)nchars
{
	gtk_entry_buffer_set_text([self castedGObject], [chars UTF8String], nchars);
}


@end