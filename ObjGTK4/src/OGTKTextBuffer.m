/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextBuffer.h"

#import <OGdk4/OGGdkClipboard.h>
#import "OGTKTextTagTable.h"
#import "OGTKTextMark.h"
#import "OGTKTextChildAnchor.h"
#import <OGdk4/OGGdkContentProvider.h>
#import "OGTKTextTag.h"

@implementation OGTKTextBuffer

- (instancetype)init:(OGTKTextTagTable*)table
{
	GtkTextBuffer* gobjectValue = GTK_TEXT_BUFFER(gtk_text_buffer_new([table castedGObject]));

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

- (GtkTextBuffer*)castedGObject
{
	return GTK_TEXT_BUFFER([self gObject]);
}

- (void)addMarkWithMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where
{
	gtk_text_buffer_add_mark([self castedGObject], [mark castedGObject], where);
}

- (void)addSelectionClipboard:(OGGdkClipboard*)clipboard
{
	gtk_text_buffer_add_selection_clipboard([self castedGObject], [clipboard castedGObject]);
}

- (void)applyTagWithTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_apply_tag([self castedGObject], [tag castedGObject], start, end);
}

- (void)applyTagByNameWithName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_apply_tag_by_name([self castedGObject], [name UTF8String], start, end);
}

- (bool)backspaceWithIter:(GtkTextIter*)iter interactive:(bool)interactive defaultEditable:(bool)defaultEditable
{
	bool returnValue = gtk_text_buffer_backspace([self castedGObject], iter, interactive, defaultEditable);

	return returnValue;
}

- (void)beginIrreversibleAction
{
	gtk_text_buffer_begin_irreversible_action([self castedGObject]);
}

- (void)beginUserAction
{
	gtk_text_buffer_begin_user_action([self castedGObject]);
}

- (void)copyClipboard:(OGGdkClipboard*)clipboard
{
	gtk_text_buffer_copy_clipboard([self castedGObject], [clipboard castedGObject]);
}

- (OGTKTextChildAnchor*)createChildAnchor:(GtkTextIter*)iter
{
	GtkTextChildAnchor* gobjectValue = GTK_TEXT_CHILD_ANCHOR(gtk_text_buffer_create_child_anchor([self castedGObject], iter));

	OGTKTextChildAnchor* returnValue = [OGTKTextChildAnchor withGObject:gobjectValue];
	return returnValue;
}

- (OGTKTextMark*)createMarkWithMarkName:(OFString*)markName where:(const GtkTextIter*)where leftGravity:(bool)leftGravity
{
	GtkTextMark* gobjectValue = GTK_TEXT_MARK(gtk_text_buffer_create_mark([self castedGObject], [markName UTF8String], where, leftGravity));

	OGTKTextMark* returnValue = [OGTKTextMark withGObject:gobjectValue];
	return returnValue;
}

- (void)cutClipboardWithClipboard:(OGGdkClipboard*)clipboard defaultEditable:(bool)defaultEditable
{
	gtk_text_buffer_cut_clipboard([self castedGObject], [clipboard castedGObject], defaultEditable);
}

- (void)deleteWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	gtk_text_buffer_delete([self castedGObject], start, end);
}

- (bool)deleteInteractiveWithStartIter:(GtkTextIter*)startIter endIter:(GtkTextIter*)endIter defaultEditable:(bool)defaultEditable
{
	bool returnValue = gtk_text_buffer_delete_interactive([self castedGObject], startIter, endIter, defaultEditable);

	return returnValue;
}

- (void)deleteMark:(OGTKTextMark*)mark
{
	gtk_text_buffer_delete_mark([self castedGObject], [mark castedGObject]);
}

- (void)deleteMarkByName:(OFString*)name
{
	gtk_text_buffer_delete_mark_by_name([self castedGObject], [name UTF8String]);
}

- (bool)deleteSelectionWithInteractive:(bool)interactive defaultEditable:(bool)defaultEditable
{
	bool returnValue = gtk_text_buffer_delete_selection([self castedGObject], interactive, defaultEditable);

	return returnValue;
}

- (void)endIrreversibleAction
{
	gtk_text_buffer_end_irreversible_action([self castedGObject]);
}

- (void)endUserAction
{
	gtk_text_buffer_end_user_action([self castedGObject]);
}

- (void)boundsWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	gtk_text_buffer_get_bounds([self castedGObject], start, end);
}

- (bool)canRedo
{
	bool returnValue = gtk_text_buffer_get_can_redo([self castedGObject]);

	return returnValue;
}

- (bool)canUndo
{
	bool returnValue = gtk_text_buffer_get_can_undo([self castedGObject]);

	return returnValue;
}

- (int)charCount
{
	int returnValue = gtk_text_buffer_get_char_count([self castedGObject]);

	return returnValue;
}

- (bool)enableUndo
{
	bool returnValue = gtk_text_buffer_get_enable_undo([self castedGObject]);

	return returnValue;
}

- (void)endIter:(GtkTextIter*)iter
{
	gtk_text_buffer_get_end_iter([self castedGObject], iter);
}

- (bool)hasSelection
{
	bool returnValue = gtk_text_buffer_get_has_selection([self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)insert
{
	GtkTextMark* gobjectValue = GTK_TEXT_MARK(gtk_text_buffer_get_insert([self castedGObject]));

	OGTKTextMark* returnValue = [OGTKTextMark withGObject:gobjectValue];
	return returnValue;
}

- (void)iterAtChildAnchorWithIter:(GtkTextIter*)iter anchor:(OGTKTextChildAnchor*)anchor
{
	gtk_text_buffer_get_iter_at_child_anchor([self castedGObject], iter, [anchor castedGObject]);
}

- (bool)iterAtLineWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber
{
	bool returnValue = gtk_text_buffer_get_iter_at_line([self castedGObject], iter, lineNumber);

	return returnValue;
}

- (bool)iterAtLineIndexWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber byteIndex:(int)byteIndex
{
	bool returnValue = gtk_text_buffer_get_iter_at_line_index([self castedGObject], iter, lineNumber, byteIndex);

	return returnValue;
}

- (bool)iterAtLineOffsetWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber charOffset:(int)charOffset
{
	bool returnValue = gtk_text_buffer_get_iter_at_line_offset([self castedGObject], iter, lineNumber, charOffset);

	return returnValue;
}

- (void)iterAtMarkWithIter:(GtkTextIter*)iter mark:(OGTKTextMark*)mark
{
	gtk_text_buffer_get_iter_at_mark([self castedGObject], iter, [mark castedGObject]);
}

- (void)iterAtOffsetWithIter:(GtkTextIter*)iter charOffset:(int)charOffset
{
	gtk_text_buffer_get_iter_at_offset([self castedGObject], iter, charOffset);
}

- (int)lineCount
{
	int returnValue = gtk_text_buffer_get_line_count([self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)mark:(OFString*)name
{
	GtkTextMark* gobjectValue = GTK_TEXT_MARK(gtk_text_buffer_get_mark([self castedGObject], [name UTF8String]));

	OGTKTextMark* returnValue = [OGTKTextMark withGObject:gobjectValue];
	return returnValue;
}

- (guint)maxUndoLevels
{
	guint returnValue = gtk_text_buffer_get_max_undo_levels([self castedGObject]);

	return returnValue;
}

- (bool)modified
{
	bool returnValue = gtk_text_buffer_get_modified([self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)selectionBound
{
	GtkTextMark* gobjectValue = GTK_TEXT_MARK(gtk_text_buffer_get_selection_bound([self castedGObject]));

	OGTKTextMark* returnValue = [OGTKTextMark withGObject:gobjectValue];
	return returnValue;
}

- (bool)selectionBoundsWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	bool returnValue = gtk_text_buffer_get_selection_bounds([self castedGObject], start, end);

	return returnValue;
}

- (OGGdkContentProvider*)selectionContent
{
	GdkContentProvider* gobjectValue = GDK_CONTENT_PROVIDER(gtk_text_buffer_get_selection_content([self castedGObject]));

	OGGdkContentProvider* returnValue = [OGGdkContentProvider withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (char*)sliceWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars
{
	char* gobjectValue = gtk_text_buffer_get_slice([self castedGObject], start, end, includeHiddenChars);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (void)startIter:(GtkTextIter*)iter
{
	gtk_text_buffer_get_start_iter([self castedGObject], iter);
}

- (OGTKTextTagTable*)tagTable
{
	GtkTextTagTable* gobjectValue = GTK_TEXT_TAG_TABLE(gtk_text_buffer_get_tag_table([self castedGObject]));

	OGTKTextTagTable* returnValue = [OGTKTextTagTable withGObject:gobjectValue];
	return returnValue;
}

- (char*)textWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars
{
	char* gobjectValue = gtk_text_buffer_get_text([self castedGObject], start, end, includeHiddenChars);

	char* returnValue = gobjectValue;
	return returnValue;
}

- (void)insertWithIter:(GtkTextIter*)iter text:(OFString*)text len:(int)len
{
	gtk_text_buffer_insert([self castedGObject], iter, [text UTF8String], len);
}

- (void)insertAtCursorWithText:(OFString*)text len:(int)len
{
	gtk_text_buffer_insert_at_cursor([self castedGObject], [text UTF8String], len);
}

- (void)insertChildAnchorWithIter:(GtkTextIter*)iter anchor:(OGTKTextChildAnchor*)anchor
{
	gtk_text_buffer_insert_child_anchor([self castedGObject], iter, [anchor castedGObject]);
}

- (bool)insertInteractiveWithIter:(GtkTextIter*)iter text:(OFString*)text len:(int)len defaultEditable:(bool)defaultEditable
{
	bool returnValue = gtk_text_buffer_insert_interactive([self castedGObject], iter, [text UTF8String], len, defaultEditable);

	return returnValue;
}

- (bool)insertInteractiveAtCursorWithText:(OFString*)text len:(int)len defaultEditable:(bool)defaultEditable
{
	bool returnValue = gtk_text_buffer_insert_interactive_at_cursor([self castedGObject], [text UTF8String], len, defaultEditable);

	return returnValue;
}

- (void)insertMarkupWithIter:(GtkTextIter*)iter markup:(OFString*)markup len:(int)len
{
	gtk_text_buffer_insert_markup([self castedGObject], iter, [markup UTF8String], len);
}

- (void)insertPaintableWithIter:(GtkTextIter*)iter paintable:(GdkPaintable*)paintable
{
	gtk_text_buffer_insert_paintable([self castedGObject], iter, paintable);
}

- (void)insertRangeWithIter:(GtkTextIter*)iter start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_insert_range([self castedGObject], iter, start, end);
}

- (bool)insertRangeInteractiveWithIter:(GtkTextIter*)iter start:(const GtkTextIter*)start end:(const GtkTextIter*)end defaultEditable:(bool)defaultEditable
{
	bool returnValue = gtk_text_buffer_insert_range_interactive([self castedGObject], iter, start, end, defaultEditable);

	return returnValue;
}

- (void)moveMarkWithMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where
{
	gtk_text_buffer_move_mark([self castedGObject], [mark castedGObject], where);
}

- (void)moveMarkByNameWithName:(OFString*)name where:(const GtkTextIter*)where
{
	gtk_text_buffer_move_mark_by_name([self castedGObject], [name UTF8String], where);
}

- (void)pasteClipboardWithClipboard:(OGGdkClipboard*)clipboard overrideLocation:(GtkTextIter*)overrideLocation defaultEditable:(bool)defaultEditable
{
	gtk_text_buffer_paste_clipboard([self castedGObject], [clipboard castedGObject], overrideLocation, defaultEditable);
}

- (void)placeCursor:(const GtkTextIter*)where
{
	gtk_text_buffer_place_cursor([self castedGObject], where);
}

- (void)redo
{
	gtk_text_buffer_redo([self castedGObject]);
}

- (void)removeAllTagsWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_remove_all_tags([self castedGObject], start, end);
}

- (void)removeSelectionClipboard:(OGGdkClipboard*)clipboard
{
	gtk_text_buffer_remove_selection_clipboard([self castedGObject], [clipboard castedGObject]);
}

- (void)removeTagWithTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_remove_tag([self castedGObject], [tag castedGObject], start, end);
}

- (void)removeTagByNameWithName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_remove_tag_by_name([self castedGObject], [name UTF8String], start, end);
}

- (void)selectRangeWithIns:(const GtkTextIter*)ins bound:(const GtkTextIter*)bound
{
	gtk_text_buffer_select_range([self castedGObject], ins, bound);
}

- (void)setEnableUndo:(bool)enableUndo
{
	gtk_text_buffer_set_enable_undo([self castedGObject], enableUndo);
}

- (void)setMaxUndoLevels:(guint)maxUndoLevels
{
	gtk_text_buffer_set_max_undo_levels([self castedGObject], maxUndoLevels);
}

- (void)setModified:(bool)setting
{
	gtk_text_buffer_set_modified([self castedGObject], setting);
}

- (void)setTextWithText:(OFString*)text len:(int)len
{
	gtk_text_buffer_set_text([self castedGObject], [text UTF8String], len);
}

- (void)undo
{
	gtk_text_buffer_undo([self castedGObject]);
}


@end