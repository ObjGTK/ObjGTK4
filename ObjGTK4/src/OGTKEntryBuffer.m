/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEntryBuffer.h"

@implementation OGTKEntryBuffer

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ENTRY_BUFFER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ENTRY_BUFFER);
	return gObjectClass;
}

+ (instancetype)entryBufferWithInitialChars:(OFString*)initialChars ninitialChars:(int)ninitialChars
{
	GtkEntryBuffer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_entry_buffer_new([initialChars UTF8String], ninitialChars), GTK_TYPE_ENTRY_BUFFER, GtkEntryBuffer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKEntryBuffer* wrapperObject;
	@try {
		wrapperObject = [[OGTKEntryBuffer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEntryBuffer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ENTRY_BUFFER, GtkEntryBuffer);
}

- (guint)deleteTextWithPosition:(guint)position nchars:(int)nchars
{
	guint returnValue = (guint)gtk_entry_buffer_delete_text((GtkEntryBuffer*)[self castedGObject], position, nchars);

	return returnValue;
}

- (void)emitDeletedTextWithPosition:(guint)position nchars:(guint)nchars
{
	gtk_entry_buffer_emit_deleted_text((GtkEntryBuffer*)[self castedGObject], position, nchars);
}

- (void)emitInsertedTextWithPosition:(guint)position chars:(OFString*)chars nchars:(guint)nchars
{
	gtk_entry_buffer_emit_inserted_text((GtkEntryBuffer*)[self castedGObject], position, [chars UTF8String], nchars);
}

- (gsize)bytes
{
	gsize returnValue = (gsize)gtk_entry_buffer_get_bytes((GtkEntryBuffer*)[self castedGObject]);

	return returnValue;
}

- (guint)length
{
	guint returnValue = (guint)gtk_entry_buffer_get_length((GtkEntryBuffer*)[self castedGObject]);

	return returnValue;
}

- (int)maxLength
{
	int returnValue = (int)gtk_entry_buffer_get_max_length((GtkEntryBuffer*)[self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = gtk_entry_buffer_get_text((GtkEntryBuffer*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)insertTextWithPosition:(guint)position chars:(OFString*)chars nchars:(int)nchars
{
	guint returnValue = (guint)gtk_entry_buffer_insert_text((GtkEntryBuffer*)[self castedGObject], position, [chars UTF8String], nchars);

	return returnValue;
}

- (void)setMaxLength:(int)maxLength
{
	gtk_entry_buffer_set_max_length((GtkEntryBuffer*)[self castedGObject], maxLength);
}

- (void)setTextWithChars:(OFString*)chars nchars:(int)nchars
{
	gtk_entry_buffer_set_text((GtkEntryBuffer*)[self castedGObject], [chars UTF8String], nchars);
}


@end