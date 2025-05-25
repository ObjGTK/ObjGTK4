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

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_BUFFER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TEXT_BUFFER);
	return gObjectClass;
}

+ (instancetype)textBufferWithTable:(OGTKTextTagTable*)table
{
	GtkTextBuffer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_buffer_new([table castedGObject]), GTK_TYPE_TEXT_BUFFER, GtkTextBuffer);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TEXT_BUFFER, GtkTextBuffer);
}

- (void)addMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where
{
	gtk_text_buffer_add_mark((GtkTextBuffer*)[self castedGObject], [mark castedGObject], where);
}

- (void)addSelectionClipboard:(OGdkClipboard*)clipboard
{
	gtk_text_buffer_add_selection_clipboard((GtkTextBuffer*)[self castedGObject], [clipboard castedGObject]);
}

- (void)applyTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_apply_tag((GtkTextBuffer*)[self castedGObject], [tag castedGObject], start, end);
}

- (void)applyTagByName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_apply_tag_by_name((GtkTextBuffer*)[self castedGObject], [name UTF8String], start, end);
}

- (bool)backspaceWithIter:(GtkTextIter*)iter interactive:(bool)interactive defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_backspace((GtkTextBuffer*)[self castedGObject], iter, interactive, defaultEditable);

	return returnValue;
}

- (void)beginIrreversibleAction
{
	gtk_text_buffer_begin_irreversible_action((GtkTextBuffer*)[self castedGObject]);
}

- (void)beginUserAction
{
	gtk_text_buffer_begin_user_action((GtkTextBuffer*)[self castedGObject]);
}

- (void)copyClipboard:(OGdkClipboard*)clipboard
{
	gtk_text_buffer_copy_clipboard((GtkTextBuffer*)[self castedGObject], [clipboard castedGObject]);
}

- (OGTKTextChildAnchor*)createChildAnchorWithIter:(GtkTextIter*)iter
{
	GtkTextChildAnchor* gobjectValue = gtk_text_buffer_create_child_anchor((GtkTextBuffer*)[self castedGObject], iter);

	OGTKTextChildAnchor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKTextMark*)createMarkWithMarkName:(OFString*)markName where:(const GtkTextIter*)where leftGravity:(bool)leftGravity
{
	GtkTextMark* gobjectValue = gtk_text_buffer_create_mark((GtkTextBuffer*)[self castedGObject], [markName UTF8String], where, leftGravity);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)cutClipboard:(OGdkClipboard*)clipboard defaultEditable:(bool)defaultEditable
{
	gtk_text_buffer_cut_clipboard((GtkTextBuffer*)[self castedGObject], [clipboard castedGObject], defaultEditable);
}

- (void)deleteWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	gtk_text_buffer_delete((GtkTextBuffer*)[self castedGObject], start, end);
}

- (bool)deleteInteractiveWithStartIter:(GtkTextIter*)startIter endIter:(GtkTextIter*)endIter defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_delete_interactive((GtkTextBuffer*)[self castedGObject], startIter, endIter, defaultEditable);

	return returnValue;
}

- (void)deleteMark:(OGTKTextMark*)mark
{
	gtk_text_buffer_delete_mark((GtkTextBuffer*)[self castedGObject], [mark castedGObject]);
}

- (void)deleteMarkByName:(OFString*)name
{
	gtk_text_buffer_delete_mark_by_name((GtkTextBuffer*)[self castedGObject], [name UTF8String]);
}

- (bool)deleteSelectionWithInteractive:(bool)interactive defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_delete_selection((GtkTextBuffer*)[self castedGObject], interactive, defaultEditable);

	return returnValue;
}

- (void)endIrreversibleAction
{
	gtk_text_buffer_end_irreversible_action((GtkTextBuffer*)[self castedGObject]);
}

- (void)endUserAction
{
	gtk_text_buffer_end_user_action((GtkTextBuffer*)[self castedGObject]);
}

- (void)boundsWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	gtk_text_buffer_get_bounds((GtkTextBuffer*)[self castedGObject], start, end);
}

- (bool)canRedo
{
	bool returnValue = (bool)gtk_text_buffer_get_can_redo((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (bool)canUndo
{
	bool returnValue = (bool)gtk_text_buffer_get_can_undo((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (int)charCount
{
	int returnValue = (int)gtk_text_buffer_get_char_count((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (bool)enableUndo
{
	bool returnValue = (bool)gtk_text_buffer_get_enable_undo((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (void)endIter:(GtkTextIter*)iter
{
	gtk_text_buffer_get_end_iter((GtkTextBuffer*)[self castedGObject], iter);
}

- (bool)hasSelection
{
	bool returnValue = (bool)gtk_text_buffer_get_has_selection((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)insert
{
	GtkTextMark* gobjectValue = gtk_text_buffer_get_insert((GtkTextBuffer*)[self castedGObject]);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)iterAtChildAnchorWithIter:(GtkTextIter*)iter anchor:(OGTKTextChildAnchor*)anchor
{
	gtk_text_buffer_get_iter_at_child_anchor((GtkTextBuffer*)[self castedGObject], iter, [anchor castedGObject]);
}

- (bool)iterAtLineWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber
{
	bool returnValue = (bool)gtk_text_buffer_get_iter_at_line((GtkTextBuffer*)[self castedGObject], iter, lineNumber);

	return returnValue;
}

- (bool)iterAtLineIndexWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber byteIndex:(int)byteIndex
{
	bool returnValue = (bool)gtk_text_buffer_get_iter_at_line_index((GtkTextBuffer*)[self castedGObject], iter, lineNumber, byteIndex);

	return returnValue;
}

- (bool)iterAtLineOffsetWithIter:(GtkTextIter*)iter lineNumber:(int)lineNumber charOffset:(int)charOffset
{
	bool returnValue = (bool)gtk_text_buffer_get_iter_at_line_offset((GtkTextBuffer*)[self castedGObject], iter, lineNumber, charOffset);

	return returnValue;
}

- (void)iterAtMarkWithIter:(GtkTextIter*)iter mark:(OGTKTextMark*)mark
{
	gtk_text_buffer_get_iter_at_mark((GtkTextBuffer*)[self castedGObject], iter, [mark castedGObject]);
}

- (void)iterAtOffsetWithIter:(GtkTextIter*)iter charOffset:(int)charOffset
{
	gtk_text_buffer_get_iter_at_offset((GtkTextBuffer*)[self castedGObject], iter, charOffset);
}

- (int)lineCount
{
	int returnValue = (int)gtk_text_buffer_get_line_count((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)markWithName:(OFString*)name
{
	GtkTextMark* gobjectValue = gtk_text_buffer_get_mark((GtkTextBuffer*)[self castedGObject], [name UTF8String]);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)maxUndoLevels
{
	guint returnValue = (guint)gtk_text_buffer_get_max_undo_levels((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (bool)modified
{
	bool returnValue = (bool)gtk_text_buffer_get_modified((GtkTextBuffer*)[self castedGObject]);

	return returnValue;
}

- (OGTKTextMark*)selectionBound
{
	GtkTextMark* gobjectValue = gtk_text_buffer_get_selection_bound((GtkTextBuffer*)[self castedGObject]);

	OGTKTextMark* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)selectionBoundsWithStart:(GtkTextIter*)start end:(GtkTextIter*)end
{
	bool returnValue = (bool)gtk_text_buffer_get_selection_bounds((GtkTextBuffer*)[self castedGObject], start, end);

	return returnValue;
}

- (OGdkContentProvider*)selectionContent
{
	GdkContentProvider* gobjectValue = gtk_text_buffer_get_selection_content((GtkTextBuffer*)[self castedGObject]);

	OGdkContentProvider* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OFString*)sliceWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars
{
	char* gobjectValue = gtk_text_buffer_get_slice((GtkTextBuffer*)[self castedGObject], start, end, includeHiddenChars);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)startIter:(GtkTextIter*)iter
{
	gtk_text_buffer_get_start_iter((GtkTextBuffer*)[self castedGObject], iter);
}

- (OGTKTextTagTable*)tagTable
{
	GtkTextTagTable* gobjectValue = gtk_text_buffer_get_tag_table((GtkTextBuffer*)[self castedGObject]);

	OGTKTextTagTable* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)textWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end includeHiddenChars:(bool)includeHiddenChars
{
	char* gobjectValue = gtk_text_buffer_get_text((GtkTextBuffer*)[self castedGObject], start, end, includeHiddenChars);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)insertWithIter:(GtkTextIter*)iter text:(OFString*)text len:(int)len
{
	gtk_text_buffer_insert((GtkTextBuffer*)[self castedGObject], iter, [text UTF8String], len);
}

- (void)insertAtCursorWithText:(OFString*)text len:(int)len
{
	gtk_text_buffer_insert_at_cursor((GtkTextBuffer*)[self castedGObject], [text UTF8String], len);
}

- (void)insertChildAnchorWithIter:(GtkTextIter*)iter anchor:(OGTKTextChildAnchor*)anchor
{
	gtk_text_buffer_insert_child_anchor((GtkTextBuffer*)[self castedGObject], iter, [anchor castedGObject]);
}

- (bool)insertInteractiveWithIter:(GtkTextIter*)iter text:(OFString*)text len:(int)len defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_insert_interactive((GtkTextBuffer*)[self castedGObject], iter, [text UTF8String], len, defaultEditable);

	return returnValue;
}

- (bool)insertInteractiveAtCursorWithText:(OFString*)text len:(int)len defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_insert_interactive_at_cursor((GtkTextBuffer*)[self castedGObject], [text UTF8String], len, defaultEditable);

	return returnValue;
}

- (void)insertMarkupWithIter:(GtkTextIter*)iter markup:(OFString*)markup len:(int)len
{
	gtk_text_buffer_insert_markup((GtkTextBuffer*)[self castedGObject], iter, [markup UTF8String], len);
}

- (void)insertPaintableWithIter:(GtkTextIter*)iter paintable:(GdkPaintable*)paintable
{
	gtk_text_buffer_insert_paintable((GtkTextBuffer*)[self castedGObject], iter, paintable);
}

- (void)insertRangeWithIter:(GtkTextIter*)iter start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_insert_range((GtkTextBuffer*)[self castedGObject], iter, start, end);
}

- (bool)insertRangeInteractiveWithIter:(GtkTextIter*)iter start:(const GtkTextIter*)start end:(const GtkTextIter*)end defaultEditable:(bool)defaultEditable
{
	bool returnValue = (bool)gtk_text_buffer_insert_range_interactive((GtkTextBuffer*)[self castedGObject], iter, start, end, defaultEditable);

	return returnValue;
}

- (void)moveMark:(OGTKTextMark*)mark where:(const GtkTextIter*)where
{
	gtk_text_buffer_move_mark((GtkTextBuffer*)[self castedGObject], [mark castedGObject], where);
}

- (void)moveMarkByName:(OFString*)name where:(const GtkTextIter*)where
{
	gtk_text_buffer_move_mark_by_name((GtkTextBuffer*)[self castedGObject], [name UTF8String], where);
}

- (void)pasteClipboard:(OGdkClipboard*)clipboard overrideLocation:(GtkTextIter*)overrideLocation defaultEditable:(bool)defaultEditable
{
	gtk_text_buffer_paste_clipboard((GtkTextBuffer*)[self castedGObject], [clipboard castedGObject], overrideLocation, defaultEditable);
}

- (void)placeCursorWithWhere:(const GtkTextIter*)where
{
	gtk_text_buffer_place_cursor((GtkTextBuffer*)[self castedGObject], where);
}

- (void)redo
{
	gtk_text_buffer_redo((GtkTextBuffer*)[self castedGObject]);
}

- (void)removeAllTagsWithStart:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_remove_all_tags((GtkTextBuffer*)[self castedGObject], start, end);
}

- (void)removeSelectionClipboard:(OGdkClipboard*)clipboard
{
	gtk_text_buffer_remove_selection_clipboard((GtkTextBuffer*)[self castedGObject], [clipboard castedGObject]);
}

- (void)removeTag:(OGTKTextTag*)tag start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_remove_tag((GtkTextBuffer*)[self castedGObject], [tag castedGObject], start, end);
}

- (void)removeTagByName:(OFString*)name start:(const GtkTextIter*)start end:(const GtkTextIter*)end
{
	gtk_text_buffer_remove_tag_by_name((GtkTextBuffer*)[self castedGObject], [name UTF8String], start, end);
}

- (void)selectRangeWithIns:(const GtkTextIter*)ins bound:(const GtkTextIter*)bound
{
	gtk_text_buffer_select_range((GtkTextBuffer*)[self castedGObject], ins, bound);
}

- (void)setEnableUndo:(bool)enableUndo
{
	gtk_text_buffer_set_enable_undo((GtkTextBuffer*)[self castedGObject], enableUndo);
}

- (void)setMaxUndoLevels:(guint)maxUndoLevels
{
	gtk_text_buffer_set_max_undo_levels((GtkTextBuffer*)[self castedGObject], maxUndoLevels);
}

- (void)setModifiedWithSetting:(bool)setting
{
	gtk_text_buffer_set_modified((GtkTextBuffer*)[self castedGObject], setting);
}

- (void)setText:(OFString*)text len:(int)len
{
	gtk_text_buffer_set_text((GtkTextBuffer*)[self castedGObject], [text UTF8String], len);
}

- (void)undo
{
	gtk_text_buffer_undo((GtkTextBuffer*)[self castedGObject]);
}


@end