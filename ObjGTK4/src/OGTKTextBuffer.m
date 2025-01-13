/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextBuffer.h"

#import <OGdk4/OGdkClipboard.h>
#import <OGdk4/OGdkContentProvider.h>
#import "OGTKTextChildAnchor.h"
#import "OGTKTextMark.h"
#import "OGTKTextTag.h"
#import "OGTKTextTagTable.h"

@implementation OGTKTextBuffer

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_BUFFER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)textBufferWithTable:(OGTKTextTagTable*)table
{
	GtkTextBuffer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_buffer_new([table castedGObject]), GtkTextBuffer, GtkTextBuffer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTextBuffer* wrapperObject;
	@try {
		wrapperObject = [[OGTKTextBuffer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTextBuffer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkTextBuffer, GtkTextBuffer);
}

- (void)addMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where
{
	gtk_text_buffer_add_mark([self castedGObject], [mark castedGObject], where);
}

- (void)addSelectionClipboard:(OGdkClipboard*)clipboard
{
	gtk_text_buffer_add_selection_clipboard([self castedGObject], [clipboard castedGObject]);
}

- (void)applyTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_apply_tag([self castedGObject], [tag castedGObject], start, end);
}

- (void)applyTagByName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_apply_tag_by_name([self castedGObject], [name UTF8String], start, end);
}

- (bool)backspaceWithIter:(GtkTextIter*)iter interactive:(bool)interactive defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_backspace([self castedGObject], iter, interactive, defaultEditable);

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

- (void)copyClipboard:(OGdkClipboard*)clipboard
{
	gtk_text_buffer_copy_clipboard([self castedGObject], [clipboard castedGObject]);
}

- (OGTKTextChildAnchor*)createChildAnchorWithIter:(GtkTextIter*)iter
{
	GtkTextChildAnchor* gobjectValue = gtk_text_buffer_create_child_anchor([self castedGObject], iter);

	OGTKTextChildAnchor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKTextMark*)createMarkWithMarkName:(OFString*)markName where:(const GtkTextIter*)where leftGravity:(bool)leftGravity
{
	GtkTextMark* gobjectValue = gtk_text_buffer_create_mark([self castedGObject], [markName UTF8String], where, leftGravity);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)cutClipboard:(OGdkClipboard*)clipboard defaultEditable:(bool)defaultEditable
{
	gtk_text_buffer_cut_clipboard([self castedGObject], [clipboard castedGObject], defaultEditable);
}

- (void)deleteWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	gtk_text_buffer_delete([self castedGObject], start, end);
}

- (bool)deleteInteractiveWithStartIter:(GtkTextIter*)startIter endIter:(GtkTextIter*)endIter defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_delete_interactive([self castedGObject], startIter, endIter, defaultEditable);

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
	bool returnValue = (bool)gtk_text_buffer_delete_selection([self castedGObject], interactive, defaultEditable);

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
	bool returnValue = (bool)gtk_text_buffer_get_can_redo([self castedGObject]);

	return returnValue;
}

- (bool)canUndo
{
	bool returnValue = (bool)gtk_text_buffer_get_can_undo([self castedGObject]);

	return returnValue;
}

- (int)charCount
{
	int returnValue = (int)gtk_text_buffer_get_char_count([self castedGObject]);

	return returnValue;
}

- (bool)enableUndo
{
	bool returnValue = (bool)gtk_text_buffer_get_enable_undo([self castedGObject]);

	return returnValue;
}

- (void)endIter:(GtkTextIter*)iter
{
	gtk_text_buffer_get_end_iter([self castedGObject], iter);
}

- (bool)hasSelection
{
	bool returnValue = (bool)gtk_text_buffer_get_has_selection([self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)insert
{
	GtkTextMark* gobjectValue = gtk_text_buffer_get_insert([self castedGObject]);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)iterAtChildAnchorWithIter:(GtkTextIter*)iter anchor:(OGTKTextChildAnchor*)anchor
{
	gtk_text_buffer_get_iter_at_child_anchor([self castedGObject], iter, [anchor castedGObject]);
}

- (bool)iterAtLineWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber
{
	bool returnValue = (bool)gtk_text_buffer_get_iter_at_line([self castedGObject], iter, lineNumber);

	return returnValue;
}

- (bool)iterAtLineIndexWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber byteIndex:(int)byteIndex
{
	bool returnValue = (bool)gtk_text_buffer_get_iter_at_line_index([self castedGObject], iter, lineNumber, byteIndex);

	return returnValue;
}

- (bool)iterAtLineOffsetWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber charOffset:(int)charOffset
{
	bool returnValue = (bool)gtk_text_buffer_get_iter_at_line_offset([self castedGObject], iter, lineNumber, charOffset);

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
	int returnValue = (int)gtk_text_buffer_get_line_count([self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)markWithName:(OFString*)name
{
	GtkTextMark* gobjectValue = gtk_text_buffer_get_mark([self castedGObject], [name UTF8String]);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)maxUndoLevels
{
	guint returnValue = (guint)gtk_text_buffer_get_max_undo_levels([self castedGObject]);

	return returnValue;
}

- (bool)modified
{
	bool returnValue = (bool)gtk_text_buffer_get_modified([self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)selectionBound
{
	GtkTextMark* gobjectValue = gtk_text_buffer_get_selection_bound([self castedGObject]);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)selectionBoundsWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	bool returnValue = (bool)gtk_text_buffer_get_selection_bounds([self castedGObject], start, end);

	return returnValue;
}

- (OGdkContentProvider*)selectionContent
{
	GdkContentProvider* gobjectValue = gtk_text_buffer_get_selection_content([self castedGObject]);

	OGdkContentProvider* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OFString*)sliceWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars
{
	char* gobjectValue = gtk_text_buffer_get_slice([self castedGObject], start, end, includeHiddenChars);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)startIter:(GtkTextIter*)iter
{
	gtk_text_buffer_get_start_iter([self castedGObject], iter);
}

- (OGTKTextTagTable*)tagTable
{
	GtkTextTagTable* gobjectValue = gtk_text_buffer_get_tag_table([self castedGObject]);

	OGTKTextTagTable* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)textWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars
{
	char* gobjectValue = gtk_text_buffer_get_text([self castedGObject], start, end, includeHiddenChars);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
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
	bool returnValue = (bool)gtk_text_buffer_insert_interactive([self castedGObject], iter, [text UTF8String], len, defaultEditable);

	return returnValue;
}

- (bool)insertInteractiveAtCursorWithText:(OFString*)text len:(int)len defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_insert_interactive_at_cursor([self castedGObject], [text UTF8String], len, defaultEditable);

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
	bool returnValue = (bool)gtk_text_buffer_insert_range_interactive([self castedGObject], iter, start, end, defaultEditable);

	return returnValue;
}

- (void)moveMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where
{
	gtk_text_buffer_move_mark([self castedGObject], [mark castedGObject], where);
}

- (void)moveMarkByName:(OFString*)name where:(const GtkTextIter*)where
{
	gtk_text_buffer_move_mark_by_name([self castedGObject], [name UTF8String], where);
}

- (void)pasteClipboard:(OGdkClipboard*)clipboard overrideLocation:(GtkTextIter*)overrideLocation defaultEditable:(bool)defaultEditable
{
	gtk_text_buffer_paste_clipboard([self castedGObject], [clipboard castedGObject], overrideLocation, defaultEditable);
}

- (void)placeCursorWithWhere:(const GtkTextIter*)where
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

- (void)removeSelectionClipboard:(OGdkClipboard*)clipboard
{
	gtk_text_buffer_remove_selection_clipboard([self castedGObject], [clipboard castedGObject]);
}

- (void)removeTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_remove_tag([self castedGObject], [tag castedGObject], start, end);
}

- (void)removeTagByName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end
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

- (void)setModifiedWithSetting:(bool)setting
{
	gtk_text_buffer_set_modified([self castedGObject], setting);
}

- (void)setText:(OFString*)text len:(int)len
{
	gtk_text_buffer_set_text([self castedGObject], [text UTF8String], len);
}

- (void)undo
{
	gtk_text_buffer_undo([self castedGObject]);
}


@end