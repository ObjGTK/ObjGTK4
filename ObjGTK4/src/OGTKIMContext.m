/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMContext.h"

#import <OGdk4/OGGdkSurface.h>
#import "OGTKWidget.h"
#import <OGdk4/OGGdkDevice.h>

@implementation OGTKIMContext

- (GtkIMContext*)castedGObject
{
	return GTK_IM_CONTEXT([self gObject]);
}

- (bool)activateOsk:(GdkEvent*)event
{
	bool returnValue = gtk_im_context_activate_osk([self castedGObject], event);

	return returnValue;
}

- (bool)deleteSurroundingWithOffset:(int)offset nchars:(int)nchars
{
	bool returnValue = gtk_im_context_delete_surrounding([self castedGObject], offset, nchars);

	return returnValue;
}

- (bool)filterKeyWithPress:(bool)press surface:(OGGdkSurface*)surface device:(OGGdkDevice*)device time:(guint32)time keycode:(guint)keycode state:(GdkModifierType)state group:(int)group
{
	bool returnValue = gtk_im_context_filter_key([self castedGObject], press, [surface castedGObject], [device castedGObject], time, keycode, state, group);

	return returnValue;
}

- (bool)filterKeypress:(GdkEvent*)event
{
	bool returnValue = gtk_im_context_filter_keypress([self castedGObject], event);

	return returnValue;
}

- (void)focusIn
{
	gtk_im_context_focus_in([self castedGObject]);
}

- (void)focusOut
{
	gtk_im_context_focus_out([self castedGObject]);
}

- (void)preeditStringWithStr:(char**)str attrs:(PangoAttrList**)attrs cursorPos:(int*)cursorPos
{
	gtk_im_context_get_preedit_string([self castedGObject], str, attrs, cursorPos);
}

- (bool)surroundingWithText:(char**)text cursorIndex:(int*)cursorIndex
{
	bool returnValue = gtk_im_context_get_surrounding([self castedGObject], text, cursorIndex);

	return returnValue;
}

- (bool)surroundingWithSelectionWithText:(char**)text cursorIndex:(int*)cursorIndex anchorIndex:(int*)anchorIndex
{
	bool returnValue = gtk_im_context_get_surrounding_with_selection([self castedGObject], text, cursorIndex, anchorIndex);

	return returnValue;
}

- (void)reset
{
	gtk_im_context_reset([self castedGObject]);
}

- (void)setClientWidget:(OGTKWidget*)widget
{
	gtk_im_context_set_client_widget([self castedGObject], [widget castedGObject]);
}

- (void)setCursorLocation:(const GdkRectangle*)area
{
	gtk_im_context_set_cursor_location([self castedGObject], area);
}

- (void)setSurroundingWithText:(OFString*)text len:(int)len cursorIndex:(int)cursorIndex
{
	gtk_im_context_set_surrounding([self castedGObject], [text UTF8String], len, cursorIndex);
}

- (void)setSurroundingWithSelectionWithText:(OFString*)text len:(int)len cursorIndex:(int)cursorIndex anchorIndex:(int)anchorIndex
{
	gtk_im_context_set_surrounding_with_selection([self castedGObject], [text UTF8String], len, cursorIndex, anchorIndex);
}

- (void)setUsePreedit:(bool)usePreedit
{
	gtk_im_context_set_use_preedit([self castedGObject], usePreedit);
}


@end