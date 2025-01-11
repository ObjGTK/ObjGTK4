/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGdkClipboard;
@class OGdkContentProvider;
@class OGTKTextChildAnchor;
@class OGTKTextMark;
@class OGTKTextTag;
@class OGTKTextTagTable;

/**
 * Stores text and attributes for display in a `GtkTextView`.
 * 
 * You may wish to begin by reading the
 * [text widget conceptual overview](section-text-widget.html),
 * which gives an overview of all the objects and data types
 * related to the text widget and how they work together.
 * 
 * GtkTextBuffer can support undoing changes to the buffer
 * content, see [method@Gtk.TextBuffer.set_enable_undo].
 *
 */
@interface OGTKTextBuffer : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)textBuffer:(OGTKTextTagTable*)table;

/**
 * Methods
 */

- (GtkTextBuffer*)castedGObject;

/**
 * Adds the mark at position @where.
 * 
 * The mark must not be added to another buffer, and if its name
 * is not %NULL then there must not be another mark in the buffer
 * with the same name.
 * 
 * Emits the [signal@Gtk.TextBuffer::mark-set] signal as notification
 * of the mark's initial placement.
 *
 * @param mark the mark to add
 * @param where location to place mark
 */
- (void)addMarkWithMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where;

/**
 * Adds @clipboard to the list of clipboards in which the selection
 * contents of @buffer are available.
 * 
 * In most cases, @clipboard will be the `GdkClipboard` returned by
 * [method@Gtk.Widget.get_primary_clipboard] for a view of @buffer.
 *
 * @param clipboard a `GdkClipboard`
 */
- (void)addSelectionClipboard:(OGdkClipboard*)clipboard;

/**
 * Emits the “apply-tag” signal on @buffer.
 * 
 * The default handler for the signal applies
 * @tag to the given range. @start and @end do
 * not have to be in order.
 *
 * @param tag a `GtkTextTag`
 * @param start one bound of range to be tagged
 * @param end other bound of range to be tagged
 */
- (void)applyTagWithTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end;

/**
 * Emits the “apply-tag” signal on @buffer.
 * 
 * Calls [method@Gtk.TextTagTable.lookup] on the buffer’s
 * tag table to get a `GtkTextTag`, then calls
 * [method@Gtk.TextBuffer.apply_tag].
 *
 * @param name name of a named `GtkTextTag`
 * @param start one bound of range to be tagged
 * @param end other bound of range to be tagged
 */
- (void)applyTagByNameWithName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end;

/**
 * Performs the appropriate action as if the user hit the delete
 * key with the cursor at the position specified by @iter.
 * 
 * In the normal case a single character will be deleted, but when
 * combining accents are involved, more than one character can
 * be deleted, and when precomposed character and accent combinations
 * are involved, less than one character will be deleted.
 * 
 * Because the buffer is modified, all outstanding iterators become
 * invalid after calling this function; however, the @iter will be
 * re-initialized to point to the location where text was deleted.
 *
 * @param iter a position in @buffer
 * @param interactive whether the deletion is caused by user interaction
 * @param defaultEditable whether the buffer is editable by default
 * @return %TRUE if the buffer was modified
 */
- (bool)backspaceWithIter:(GtkTextIter*)iter interactive:(bool)interactive defaultEditable:(bool)defaultEditable;

/**
 * Denotes the beginning of an action that may not be undone.
 * 
 * This will cause any previous operations in the undo/redo queue
 * to be cleared.
 * 
 * This should be paired with a call to
 * [method@Gtk.TextBuffer.end_irreversible_action] after the irreversible
 * action has completed.
 * 
 * You may nest calls to gtk_text_buffer_begin_irreversible_action()
 * and gtk_text_buffer_end_irreversible_action() pairs.
 *
 */
- (void)beginIrreversibleAction;

/**
 * Called to indicate that the buffer operations between here and a
 * call to gtk_text_buffer_end_user_action() are part of a single
 * user-visible operation.
 * 
 * The operations between gtk_text_buffer_begin_user_action() and
 * gtk_text_buffer_end_user_action() can then be grouped when creating
 * an undo stack. `GtkTextBuffer` maintains a count of calls to
 * gtk_text_buffer_begin_user_action() that have not been closed with
 * a call to gtk_text_buffer_end_user_action(), and emits the
 * “begin-user-action” and “end-user-action” signals only for the
 * outermost pair of calls. This allows you to build user actions
 * from other user actions.
 * 
 * The “interactive” buffer mutation functions, such as
 * [method@Gtk.TextBuffer.insert_interactive], automatically call
 * begin/end user action around the buffer operations they perform,
 * so there's no need to add extra calls if you user action consists
 * solely of a single call to one of those functions.
 *
 */
- (void)beginUserAction;

/**
 * Copies the currently-selected text to a clipboard.
 *
 * @param clipboard the `GdkClipboard` object to copy to
 */
- (void)copyClipboard:(OGdkClipboard*)clipboard;

/**
 * Creates and inserts a child anchor.
 * 
 * This is a convenience function which simply creates a child anchor
 * with [ctor@Gtk.TextChildAnchor.new] and inserts it into the buffer
 * with [method@Gtk.TextBuffer.insert_child_anchor].
 * 
 * The new anchor is owned by the buffer; no reference count is
 * returned to the caller of this function.
 *
 * @param iter location in the buffer
 * @return the created child anchor
 */
- (OGTKTextChildAnchor*)createChildAnchor:(GtkTextIter*)iter;

/**
 * Creates a mark at position @where.
 * 
 * If @mark_name is %NULL, the mark is anonymous; otherwise, the mark
 * can be retrieved by name using [method@Gtk.TextBuffer.get_mark].
 * If a mark has left gravity, and text is inserted at the mark’s
 * current location, the mark will be moved to the left of the
 * newly-inserted text. If the mark has right gravity
 * (@left_gravity = %FALSE), the mark will end up on the right of
 * newly-inserted text. The standard left-to-right cursor is a mark
 * with right gravity (when you type, the cursor stays on the right
 * side of the text you’re typing).
 * 
 * The caller of this function does not own a
 * reference to the returned `GtkTextMark`, so you can ignore the
 * return value if you like. Marks are owned by the buffer and go
 * away when the buffer does.
 * 
 * Emits the [signal@Gtk.TextBuffer::mark-set] signal as notification
 * of the mark's initial placement.
 *
 * @param markName name for mark
 * @param where location to place mark
 * @param leftGravity whether the mark has left gravity
 * @return the new `GtkTextMark` object
 */
- (OGTKTextMark*)createMarkWithMarkName:(OFString*)markName where:(const GtkTextIter*)where leftGravity:(bool)leftGravity;

/**
 * Copies the currently-selected text to a clipboard,
 * then deletes said text if it’s editable.
 *
 * @param clipboard the `GdkClipboard` object to cut to
 * @param defaultEditable default editability of the buffer
 */
- (void)cutClipboardWithClipboard:(OGdkClipboard*)clipboard defaultEditable:(bool)defaultEditable;

/**
 * Deletes text between @start and @end.
 * 
 * The order of @start and @end is not actually relevant;
 * gtk_text_buffer_delete() will reorder them.
 * 
 * This function actually emits the “delete-range” signal, and
 * the default handler of that signal deletes the text. Because the
 * buffer is modified, all outstanding iterators become invalid after
 * calling this function; however, the @start and @end will be
 * re-initialized to point to the location where text was deleted.
 *
 * @param start a position in @buffer
 * @param end another position in @buffer
 */
- (void)deleteWithStart:(GtkTextIter*)start end:(GtkTextIter*)end;

/**
 * Deletes all editable text in the given range.
 * 
 * Calls [method@Gtk.TextBuffer.delete] for each editable
 * sub-range of [@start,@end). @start and @end are revalidated
 * to point to the location of the last deleted range, or left
 * untouched if no text was deleted.
 *
 * @param startIter start of range to delete
 * @param endIter end of range
 * @param defaultEditable whether the buffer is editable by default
 * @return whether some text was actually deleted
 */
- (bool)deleteInteractiveWithStartIter:(GtkTextIter*)startIter endIter:(GtkTextIter*)endIter defaultEditable:(bool)defaultEditable;

/**
 * Deletes @mark, so that it’s no longer located anywhere in the
 * buffer.
 * 
 * Removes the reference the buffer holds to the mark, so if
 * you haven’t called g_object_ref() on the mark, it will be freed.
 * Even if the mark isn’t freed, most operations on @mark become
 * invalid, until it gets added to a buffer again with
 * [method@Gtk.TextBuffer.add_mark]. Use [method@Gtk.TextMark.get_deleted]
 * to find out if a mark has been removed from its buffer.
 * 
 * The [signal@Gtk.TextBuffer::mark-deleted] signal will be emitted as
 * notification after the mark is deleted.
 *
 * @param mark a `GtkTextMark` in @buffer
 */
- (void)deleteMark:(OGTKTextMark*)mark;

/**
 * Deletes the mark named @name; the mark must exist.
 * 
 * See [method@Gtk.TextBuffer.delete_mark] for details.
 *
 * @param name name of a mark in @buffer
 */
- (void)deleteMarkByName:(OFString*)name;

/**
 * Deletes the range between the “insert” and “selection_bound” marks,
 * that is, the currently-selected text.
 * 
 * If @interactive is %TRUE, the editability of the selection will be
 * considered (users can’t delete uneditable text).
 *
 * @param interactive whether the deletion is caused by user interaction
 * @param defaultEditable whether the buffer is editable by default
 * @return whether there was a non-empty selection to delete
 */
- (bool)deleteSelectionWithInteractive:(bool)interactive defaultEditable:(bool)defaultEditable;

/**
 * Denotes the end of an action that may not be undone.
 * 
 * This will cause any previous operations in the undo/redo
 * queue to be cleared.
 * 
 * This should be called after completing modifications to the
 * text buffer after [method@Gtk.TextBuffer.begin_irreversible_action]
 * was called.
 * 
 * You may nest calls to gtk_text_buffer_begin_irreversible_action()
 * and gtk_text_buffer_end_irreversible_action() pairs.
 *
 */
- (void)endIrreversibleAction;

/**
 * Ends a user-visible operation.
 * 
 * Should be paired with a call to
 * [method@Gtk.TextBuffer.begin_user_action].
 * See that function for a full explanation.
 *
 */
- (void)endUserAction;

/**
 * Retrieves the first and last iterators in the buffer, i.e. the
 * entire buffer lies within the range [@start,@end).
 *
 * @param start iterator to initialize with first position in the buffer
 * @param end iterator to initialize with the end iterator
 */
- (void)boundsWithStart:(GtkTextIter*)start end:(GtkTextIter*)end;

/**
 * Gets whether there is a redoable action in the history.
 *
 * @return %TRUE if there is a redoable action
 */
- (bool)canRedo;

/**
 * Gets whether there is an undoable action in the history.
 *
 * @return %TRUE if there is an undoable action
 */
- (bool)canUndo;

/**
 * Gets the number of characters in the buffer.
 * 
 * Note that characters and bytes are not the same, you can’t e.g.
 * expect the contents of the buffer in string form to be this
 * many bytes long.
 * 
 * The character count is cached, so this function is very fast.
 *
 * @return number of characters in the buffer
 */
- (int)charCount;

/**
 * Gets whether the buffer is saving modifications to the buffer
 * to allow for undo and redo actions.
 * 
 * See [method@Gtk.TextBuffer.begin_irreversible_action] and
 * [method@Gtk.TextBuffer.end_irreversible_action] to create
 * changes to the buffer that cannot be undone.
 *
 * @return %TRUE if undoing and redoing changes to the buffer is allowed.
 */
- (bool)enableUndo;

/**
 * Initializes @iter with the “end iterator,” one past the last valid
 * character in the text buffer.
 * 
 * If dereferenced with [method@Gtk.TextIter.get_char], the end
 * iterator has a character value of 0.
 * The entire buffer lies in the range from the first position in
 * the buffer (call [method@Gtk.TextBuffer.get_start_iter] to get
 * character position 0) to the end iterator.
 *
 * @param iter iterator to initialize
 */
- (void)endIter:(GtkTextIter*)iter;

/**
 * Indicates whether the buffer has some text currently selected.
 *
 * @return %TRUE if the there is text selected
 */
- (bool)hasSelection;

/**
 * Returns the mark that represents the cursor (insertion point).
 * 
 * Equivalent to calling [method@Gtk.TextBuffer.get_mark]
 * to get the mark named “insert”, but very slightly more
 * efficient, and involves less typing.
 *
 * @return insertion point mark
 */
- (OGTKTextMark*)insert;

/**
 * Obtains the location of @anchor within @buffer.
 *
 * @param iter an iterator to be initialized
 * @param anchor a child anchor that appears in @buffer
 */
- (void)iterAtChildAnchorWithIter:(GtkTextIter*)iter anchor:(OGTKTextChildAnchor*)anchor;

/**
 * Initializes @iter to the start of the given line.
 * 
 * If @line_number is greater than or equal to the number of lines
 * in the @buffer, the end iterator is returned.
 *
 * @param iter iterator to initialize
 * @param lineNumber line number counting from 0
 * @return whether the exact position has been found
 */
- (bool)iterAtLineWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber;

/**
 * Obtains an iterator pointing to @byte_index within the given line.
 * 
 * @byte_index must be the start of a UTF-8 character. Note bytes, not
 * characters; UTF-8 may encode one character as multiple bytes.
 * 
 * If @line_number is greater than or equal to the number of lines in the @buffer,
 * the end iterator is returned. And if @byte_index is off the
 * end of the line, the iterator at the end of the line is returned.
 *
 * @param iter iterator to initialize
 * @param lineNumber line number counting from 0
 * @param byteIndex byte index from start of line
 * @return whether the exact position has been found
 */
- (bool)iterAtLineIndexWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber byteIndex:(int)byteIndex;

/**
 * Obtains an iterator pointing to @char_offset within the given line.
 * 
 * Note characters, not bytes; UTF-8 may encode one character as multiple
 * bytes.
 * 
 * If @line_number is greater than or equal to the number of lines in the @buffer,
 * the end iterator is returned. And if @char_offset is off the
 * end of the line, the iterator at the end of the line is returned.
 *
 * @param iter iterator to initialize
 * @param lineNumber line number counting from 0
 * @param charOffset char offset from start of line
 * @return whether the exact position has been found
 */
- (bool)iterAtLineOffsetWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber charOffset:(int)charOffset;

/**
 * Initializes @iter with the current position of @mark.
 *
 * @param iter iterator to initialize
 * @param mark a `GtkTextMark` in @buffer
 */
- (void)iterAtMarkWithIter:(GtkTextIter*)iter mark:(OGTKTextMark*)mark;

/**
 * Initializes @iter to a position @char_offset chars from the start
 * of the entire buffer.
 * 
 * If @char_offset is -1 or greater than the number
 * of characters in the buffer, @iter is initialized to the end iterator,
 * the iterator one past the last valid character in the buffer.
 *
 * @param iter iterator to initialize
 * @param charOffset char offset from start of buffer, counting from 0, or -1
 */
- (void)iterAtOffsetWithIter:(GtkTextIter*)iter charOffset:(int)charOffset;

/**
 * Obtains the number of lines in the buffer.
 * 
 * This value is cached, so the function is very fast.
 *
 * @return number of lines in the buffer
 */
- (int)lineCount;

/**
 * Returns the mark named @name in buffer @buffer, or %NULL if no such
 * mark exists in the buffer.
 *
 * @param name a mark name
 * @return a `GtkTextMark`
 */
- (OGTKTextMark*)mark:(OFString*)name;

/**
 * Gets the maximum number of undo levels to perform.
 * 
 * If 0, unlimited undo actions may be performed. Note that this may
 * have a memory usage impact as it requires storing an additional
 * copy of the inserted or removed text within the text buffer.
 *
 * @return The max number of undo levels allowed (0 indicates unlimited).
 */
- (guint)maxUndoLevels;

/**
 * Indicates whether the buffer has been modified since the last call
 * to [method@Gtk.TextBuffer.set_modified] set the modification flag to
 * %FALSE.
 * 
 * Used for example to enable a “save” function in a text editor.
 *
 * @return %TRUE if the buffer has been modified
 */
- (bool)modified;

/**
 * Returns the mark that represents the selection bound.
 * 
 * Equivalent to calling [method@Gtk.TextBuffer.get_mark]
 * to get the mark named “selection_bound”, but very slightly
 * more efficient, and involves less typing.
 * 
 * The currently-selected text in @buffer is the region between the
 * “selection_bound” and “insert” marks. If “selection_bound” and
 * “insert” are in the same place, then there is no current selection.
 * [method@Gtk.TextBuffer.get_selection_bounds] is another convenient
 * function for handling the selection, if you just want to know whether
 * there’s a selection and what its bounds are.
 *
 * @return selection bound mark
 */
- (OGTKTextMark*)selectionBound;

/**
 * Returns %TRUE if some text is selected; places the bounds
 * of the selection in @start and @end.
 * 
 * If the selection has length 0, then @start and @end are filled
 * in with the same value. @start and @end will be in ascending order.
 * If @start and @end are %NULL, then they are not filled in, but the
 * return value still indicates whether text is selected.
 *
 * @param start iterator to initialize with selection start
 * @param end iterator to initialize with selection end
 * @return whether the selection has nonzero length
 */
- (bool)selectionBoundsWithStart:(GtkTextIter*)start end:(GtkTextIter*)end;

/**
 * Get a content provider for this buffer.
 * 
 * It can be used to make the content of @buffer available
 * in a `GdkClipboard`, see [method@Gdk.Clipboard.set_content].
 *
 * @return a new `GdkContentProvider`.
 */
- (OGdkContentProvider*)selectionContent;

/**
 * Returns the text in the range [@start,@end).
 * 
 * Excludes undisplayed text (text marked with tags that set the
 * invisibility attribute) if @include_hidden_chars is %FALSE.
 * The returned string includes a 0xFFFC character whenever the
 * buffer contains embedded images, so byte and character indexes
 * into the returned string do correspond to byte and character
 * indexes into the buffer. Contrast with [method@Gtk.TextBuffer.get_text].
 * Note that 0xFFFC can occur in normal text as well, so it is not a
 * reliable indicator that a paintable or widget is in the buffer.
 *
 * @param start start of a range
 * @param end end of a range
 * @param includeHiddenChars whether to include invisible text
 * @return an allocated UTF-8 string
 */
- (char*)sliceWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars;

/**
 * Initialized @iter with the first position in the text buffer.
 * 
 * This is the same as using [method@Gtk.TextBuffer.get_iter_at_offset]
 * to get the iter at character offset 0.
 *
 * @param iter iterator to initialize
 */
- (void)startIter:(GtkTextIter*)iter;

/**
 * Get the `GtkTextTagTable` associated with this buffer.
 *
 * @return the buffer’s tag table
 */
- (OGTKTextTagTable*)tagTable;

/**
 * Returns the text in the range [@start,@end).
 * 
 * Excludes undisplayed text (text marked with tags that set the
 * invisibility attribute) if @include_hidden_chars is %FALSE.
 * Does not include characters representing embedded images, so
 * byte and character indexes into the returned string do not
 * correspond to byte and character indexes into the buffer.
 * Contrast with [method@Gtk.TextBuffer.get_slice].
 *
 * @param start start of a range
 * @param end end of a range
 * @param includeHiddenChars whether to include invisible text
 * @return an allocated UTF-8 string
 */
- (char*)textWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars;

/**
 * Inserts @len bytes of @text at position @iter.
 * 
 * If @len is -1, @text must be nul-terminated and will be inserted in its
 * entirety. Emits the “insert-text” signal; insertion actually occurs
 * in the default handler for the signal. @iter is invalidated when
 * insertion occurs (because the buffer contents change), but the
 * default signal handler revalidates it to point to the end of the
 * inserted text.
 *
 * @param iter a position in the buffer
 * @param text text in UTF-8 format
 * @param len length of text in bytes, or -1
 */
- (void)insertWithIter:(GtkTextIter*)iter text:(OFString*)text len:(int)len;

/**
 * Inserts @text in @buffer.
 * 
 * Simply calls [method@Gtk.TextBuffer.insert],
 * using the current cursor position as the insertion point.
 *
 * @param text text in UTF-8 format
 * @param len length of text, in bytes
 */
- (void)insertAtCursorWithText:(OFString*)text len:(int)len;

/**
 * Inserts a child widget anchor into the text buffer at @iter.
 * 
 * The anchor will be counted as one character in character counts, and
 * when obtaining the buffer contents as a string, will be represented
 * by the Unicode “object replacement character” 0xFFFC. Note that the
 * “slice” variants for obtaining portions of the buffer as a string
 * include this character for child anchors, but the “text” variants do
 * not. E.g. see [method@Gtk.TextBuffer.get_slice] and
 * [method@Gtk.TextBuffer.get_text].
 * 
 * Consider [method@Gtk.TextBuffer.create_child_anchor] as a more
 * convenient alternative to this function. The buffer will add a
 * reference to the anchor, so you can unref it after insertion.
 *
 * @param iter location to insert the anchor
 * @param anchor a `GtkTextChildAnchor`
 */
- (void)insertChildAnchorWithIter:(GtkTextIter*)iter anchor:(OGTKTextChildAnchor*)anchor;

/**
 * Inserts @text in @buffer.
 * 
 * Like [method@Gtk.TextBuffer.insert], but the insertion will not occur
 * if @iter is at a non-editable location in the buffer. Usually you
 * want to prevent insertions at ineditable locations if the insertion
 * results from a user action (is interactive).
 * 
 * @default_editable indicates the editability of text that doesn't
 * have a tag affecting editability applied to it. Typically the
 * result of [method@Gtk.TextView.get_editable] is appropriate here.
 *
 * @param iter a position in @buffer
 * @param text some UTF-8 text
 * @param len length of text in bytes, or -1
 * @param defaultEditable default editability of buffer
 * @return whether text was actually inserted
 */
- (bool)insertInteractiveWithIter:(GtkTextIter*)iter text:(OFString*)text len:(int)len defaultEditable:(bool)defaultEditable;

/**
 * Inserts @text in @buffer.
 * 
 * Calls [method@Gtk.TextBuffer.insert_interactive]
 * at the cursor position.
 * 
 * @default_editable indicates the editability of text that doesn't
 * have a tag affecting editability applied to it. Typically the
 * result of [method@Gtk.TextView.get_editable] is appropriate here.
 *
 * @param text text in UTF-8 format
 * @param len length of text in bytes, or -1
 * @param defaultEditable default editability of buffer
 * @return whether text was actually inserted
 */
- (bool)insertInteractiveAtCursorWithText:(OFString*)text len:(int)len defaultEditable:(bool)defaultEditable;

/**
 * Inserts the text in @markup at position @iter.
 * 
 * @markup will be inserted in its entirety and must be nul-terminated
 * and valid UTF-8. Emits the [signal@Gtk.TextBuffer::insert-text] signal,
 * possibly multiple times; insertion actually occurs in the default handler
 * for the signal. @iter will point to the end of the inserted text on return.
 *
 * @param iter location to insert the markup
 * @param markup a nul-terminated UTF-8 string containing Pango markup
 * @param len length of @markup in bytes, or -1
 */
- (void)insertMarkupWithIter:(GtkTextIter*)iter markup:(OFString*)markup len:(int)len;

/**
 * Inserts an image into the text buffer at @iter.
 * 
 * The image will be counted as one character in character counts,
 * and when obtaining the buffer contents as a string, will be
 * represented by the Unicode “object replacement character” 0xFFFC.
 * Note that the “slice” variants for obtaining portions of the buffer
 * as a string include this character for paintable, but the “text”
 * variants do not. e.g. see [method@Gtk.TextBuffer.get_slice] and
 * [method@Gtk.TextBuffer.get_text].
 *
 * @param iter location to insert the paintable
 * @param paintable a `GdkPaintable`
 */
- (void)insertPaintableWithIter:(GtkTextIter*)iter paintable:(GdkPaintable*)paintable;

/**
 * Copies text, tags, and paintables between @start and @end
 * and inserts the copy at @iter.
 * 
 * The order of @start and @end doesn’t matter.
 * 
 * Used instead of simply getting/inserting text because it preserves
 * images and tags. If @start and @end are in a different buffer from
 * @buffer, the two buffers must share the same tag table.
 * 
 * Implemented via emissions of the ::insert-text and ::apply-tag signals,
 * so expect those.
 *
 * @param iter a position in @buffer
 * @param start a position in a `GtkTextBuffer`
 * @param end another position in the same buffer as @start
 */
- (void)insertRangeWithIter:(GtkTextIter*)iter start:(const GtkTextIter*)start end:(const GtkTextIter*)end;

/**
 * Copies text, tags, and paintables between @start and @end
 * and inserts the copy at @iter.
 * 
 * Same as [method@Gtk.TextBuffer.insert_range], but does nothing
 * if the insertion point isn’t editable. The @default_editable
 * parameter indicates whether the text is editable at @iter if
 * no tags enclosing @iter affect editability. Typically the result
 * of [method@Gtk.TextView.get_editable] is appropriate here.
 *
 * @param iter a position in @buffer
 * @param start a position in a `GtkTextBuffer`
 * @param end another position in the same buffer as @start
 * @param defaultEditable default editability of the buffer
 * @return whether an insertion was possible at @iter
 */
- (bool)insertRangeInteractiveWithIter:(GtkTextIter*)iter start:(const GtkTextIter*)start end:(const GtkTextIter*)end defaultEditable:(bool)defaultEditable;

/**
 * Moves @mark to the new location @where.
 * 
 * Emits the [signal@Gtk.TextBuffer::mark-set] signal
 * as notification of the move.
 *
 * @param mark a `GtkTextMark`
 * @param where new location for @mark in @buffer
 */
- (void)moveMarkWithMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where;

/**
 * Moves the mark named @name (which must exist) to location @where.
 * 
 * See [method@Gtk.TextBuffer.move_mark] for details.
 *
 * @param name name of a mark
 * @param where new location for mark
 */
- (void)moveMarkByNameWithName:(OFString*)name where:(const GtkTextIter*)where;

/**
 * Pastes the contents of a clipboard.
 * 
 * If @override_location is %NULL, the pasted text will be inserted
 * at the cursor position, or the buffer selection will be replaced
 * if the selection is non-empty.
 * 
 * Note: pasting is asynchronous, that is, we’ll ask for the paste data
 * and return, and at some point later after the main loop runs, the paste
 * data will be inserted.
 *
 * @param clipboard the `GdkClipboard` to paste from
 * @param overrideLocation location to insert pasted text
 * @param defaultEditable whether the buffer is editable by default
 */
- (void)pasteClipboardWithClipboard:(OGdkClipboard*)clipboard overrideLocation:(GtkTextIter*)overrideLocation defaultEditable:(bool)defaultEditable;

/**
 * This function moves the “insert” and “selection_bound” marks
 * simultaneously.
 * 
 * If you move them to the same place in two steps with
 * [method@Gtk.TextBuffer.move_mark], you will temporarily select a
 * region in between their old and new locations, which can be pretty
 * inefficient since the temporarily-selected region will force stuff
 * to be recalculated. This function moves them as a unit, which can
 * be optimized.
 *
 * @param where where to put the cursor
 */
- (void)placeCursor:(const GtkTextIter*)where;

/**
 * Redoes the next redoable action on the buffer, if there is one.
 *
 */
- (void)redo;

/**
 * Removes all tags in the range between @start and @end.
 * 
 * Be careful with this function; it could remove tags added in code
 * unrelated to the code you’re currently writing. That is, using this
 * function is probably a bad idea if you have two or more unrelated
 * code sections that add tags.
 *
 * @param start one bound of range to be untagged
 * @param end other bound of range to be untagged
 */
- (void)removeAllTagsWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end;

/**
 * Removes a `GdkClipboard` added with
 * [method@Gtk.TextBuffer.add_selection_clipboard]
 *
 * @param clipboard a `GdkClipboard` added to @buffer by
 *   [method@Gtk.TextBuffer.add_selection_clipboard]
 */
- (void)removeSelectionClipboard:(OGdkClipboard*)clipboard;

/**
 * Emits the “remove-tag” signal.
 * 
 * The default handler for the signal removes all occurrences
 * of @tag from the given range. @start and @end don’t have
 * to be in order.
 *
 * @param tag a `GtkTextTag`
 * @param start one bound of range to be untagged
 * @param end other bound of range to be untagged
 */
- (void)removeTagWithTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end;

/**
 * Emits the “remove-tag” signal.
 * 
 * Calls [method@Gtk.TextTagTable.lookup] on the buffer’s
 * tag table to get a `GtkTextTag`, then calls
 * [method@Gtk.TextBuffer.remove_tag].
 *
 * @param name name of a `GtkTextTag`
 * @param start one bound of range to be untagged
 * @param end other bound of range to be untagged
 */
- (void)removeTagByNameWithName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end;

/**
 * This function moves the “insert” and “selection_bound” marks
 * simultaneously.
 * 
 * If you move them in two steps with
 * [method@Gtk.TextBuffer.move_mark], you will temporarily select a
 * region in between their old and new locations, which can be pretty
 * inefficient since the temporarily-selected region will force stuff
 * to be recalculated. This function moves them as a unit, which can
 * be optimized.
 *
 * @param ins where to put the “insert” mark
 * @param bound where to put the “selection_bound” mark
 */
- (void)selectRangeWithIns:(const GtkTextIter*)ins bound:(const GtkTextIter*)bound;

/**
 * Sets whether or not to enable undoable actions in the text buffer.
 * 
 * Undoable actions in this context are changes to the text content of
 * the buffer. Changes to tags and marks are not tracked.
 * 
 * If enabled, the user will be able to undo the last number of actions
 * up to [method@Gtk.TextBuffer.get_max_undo_levels].
 * 
 * See [method@Gtk.TextBuffer.begin_irreversible_action] and
 * [method@Gtk.TextBuffer.end_irreversible_action] to create
 * changes to the buffer that cannot be undone.
 *
 * @param enableUndo %TRUE to enable undo
 */
- (void)setEnableUndo:(bool)enableUndo;

/**
 * Sets the maximum number of undo levels to perform.
 * 
 * If 0, unlimited undo actions may be performed. Note that this may
 * have a memory usage impact as it requires storing an additional
 * copy of the inserted or removed text within the text buffer.
 *
 * @param maxUndoLevels the maximum number of undo actions to perform
 */
- (void)setMaxUndoLevels:(guint)maxUndoLevels;

/**
 * Used to keep track of whether the buffer has been
 * modified since the last time it was saved.
 * 
 * Whenever the buffer is saved to disk, call
 * `gtk_text_buffer_set_modified (@buffer, FALSE)`.
 * When the buffer is modified, it will automatically
 * toggle on the modified bit again. When the modified
 * bit flips, the buffer emits the
 * [signal@Gtk.TextBuffer::modified-changed] signal.
 *
 * @param setting modification flag setting
 */
- (void)setModified:(bool)setting;

/**
 * Deletes current contents of @buffer, and inserts @text instead. This is
 * automatically marked as an irreversible action in the undo stack. If you
 * wish to mark this action as part of a larger undo operation, call
 * [method@TextBuffer.delete] and [method@TextBuffer.insert] directly instead.
 * 
 * If @len is -1, @text must be nul-terminated.
 * @text must be valid UTF-8.
 *
 * @param text UTF-8 text to insert
 * @param len length of @text in bytes
 */
- (void)setTextWithText:(OFString*)text len:(int)len;

/**
 * Undoes the last undoable action on the buffer, if there is one.
 *
 */
- (void)undo;

@end