/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A `GtkEntryBuffer` hold the text displayed in a `GtkText` widget.
 * 
 * A single `GtkEntryBuffer` object can be shared by multiple widgets
 * which will then share the same text content, but not the cursor
 * position, visibility attributes, icon etc.
 * 
 * `GtkEntryBuffer` may be derived from. Such a derived class might allow
 * text to be stored in an alternate location, such as non-pageable memory,
 * useful in the case of important passwords. Or a derived class could
 * integrate with an application’s concept of undo/redo.
 *
 */
@interface OGTKEntryBuffer : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithInitialChars:(OFString*)initialChars ninitialChars:(int)ninitialChars;

/**
 * Methods
 */

- (GtkEntryBuffer*)castedGObject;

/**
 * Deletes a sequence of characters from the buffer.
 * 
 * @n_chars characters are deleted starting at @position.
 * If @n_chars is negative, then all characters until the
 * end of the text are deleted.
 * 
 * If @position or @n_chars are out of bounds, then they
 * are coerced to sane values.
 * 
 * Note that the positions are specified in characters,
 * not bytes.
 *
 * @param position position at which to delete text
 * @param nchars number of characters to delete
 * @return The number of characters deleted.
 */
- (guint)deleteTextWithPosition:(guint)position nchars:(int)nchars;

/**
 * Used when subclassing `GtkEntryBuffer`.
 *
 * @param position position at which text was deleted
 * @param nchars number of characters deleted
 */
- (void)emitDeletedTextWithPosition:(guint)position nchars:(guint)nchars;

/**
 * Used when subclassing `GtkEntryBuffer`.
 *
 * @param position position at which text was inserted
 * @param chars text that was inserted
 * @param nchars number of characters inserted
 */
- (void)emitInsertedTextWithPosition:(guint)position chars:(OFString*)chars nchars:(guint)nchars;

/**
 * Retrieves the length in bytes of the buffer.
 * 
 * See [method@Gtk.EntryBuffer.get_length].
 *
 * @return The byte length of the buffer.
 */
- (gsize)bytes;

/**
 * Retrieves the length in characters of the buffer.
 *
 * @return The number of characters in the buffer.
 */
- (guint)length;

/**
 * Retrieves the maximum allowed length of the text in @buffer.
 *
 * @return the maximum allowed number of characters
 *   in `GtkEntryBuffer`, or 0 if there is no maximum.
 */
- (int)maxLength;

/**
 * Retrieves the contents of the buffer.
 * 
 * The memory pointer returned by this call will not change
 * unless this object emits a signal, or is finalized.
 *
 * @return a pointer to the contents of the widget as a
 *   string. This string points to internally allocated storage
 *   in the buffer and must not be freed, modified or stored.
 */
- (OFString*)text;

/**
 * Inserts @n_chars characters of @chars into the contents of the
 * buffer, at position @position.
 * 
 * If @n_chars is negative, then characters from chars will be inserted
 * until a null-terminator is found. If @position or @n_chars are out of
 * bounds, or the maximum buffer text length is exceeded, then they are
 * coerced to sane values.
 * 
 * Note that the position and length are in characters, not in bytes.
 *
 * @param position the position at which to insert text.
 * @param chars the text to insert into the buffer.
 * @param nchars the length of the text in characters, or -1
 * @return The number of characters actually inserted.
 */
- (guint)insertTextWithPosition:(guint)position chars:(OFString*)chars nchars:(int)nchars;

/**
 * Sets the maximum allowed length of the contents of the buffer.
 * 
 * If the current contents are longer than the given length, then
 * they will be truncated to fit.
 *
 * @param maxLength the maximum length of the entry buffer, or 0 for no maximum.
 *   (other than the maximum length of entries.) The value passed in will
 *   be clamped to the range 0-65536.
 */
- (void)setMaxLength:(int)maxLength;

/**
 * Sets the text in the buffer.
 * 
 * This is roughly equivalent to calling
 * [method@Gtk.EntryBuffer.delete_text] and
 * [method@Gtk.EntryBuffer.insert_text].
 * 
 * Note that @n_chars is in characters, not in bytes.
 *
 * @param chars the new text
 * @param nchars the number of characters in @text, or -1
 */
- (void)setTextWithChars:(OFString*)chars nchars:(int)nchars;

@end