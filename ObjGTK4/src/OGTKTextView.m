/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextView.h"

#import "OGTKTextMark.h"
#import <OGio/OGMenuModel.h>
#import <OGPango/OGPangoContext.h>
#import "OGTKTextChildAnchor.h"
#import "OGTKTextBuffer.h"

@implementation OGTKTextView

- (instancetype)init
{
	GtkTextView* gobjectValue = GTK_TEXT_VIEW(gtk_text_view_new());

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithBuffer:(OGTKTextBuffer*)buffer
{
	GtkTextView* gobjectValue = GTK_TEXT_VIEW(gtk_text_view_new_with_buffer([buffer castedGObject]));

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkTextView*)castedGObject
{
	return GTK_TEXT_VIEW([self gObject]);
}

- (void)addChildAtAnchorWithChild:(OGTKWidget*)child anchor:(OGTKTextChildAnchor*)anchor
{
	gtk_text_view_add_child_at_anchor([self castedGObject], [child castedGObject], [anchor castedGObject]);
}

- (void)addOverlayWithChild:(OGTKWidget*)child xpos:(int)xpos ypos:(int)ypos
{
	gtk_text_view_add_overlay([self castedGObject], [child castedGObject], xpos, ypos);
}

- (bool)backwardDisplayLine:(GtkTextIter*)iter
{
	bool returnValue = gtk_text_view_backward_display_line([self castedGObject], iter);

	return returnValue;
}

- (bool)backwardDisplayLineStart:(GtkTextIter*)iter
{
	bool returnValue = gtk_text_view_backward_display_line_start([self castedGObject], iter);

	return returnValue;
}

- (void)bufferToWindowCoordsWithWin:(GtkTextWindowType)win bufferX:(int)bufferX bufferY:(int)bufferY windowX:(int*)windowX windowY:(int*)windowY
{
	gtk_text_view_buffer_to_window_coords([self castedGObject], win, bufferX, bufferY, windowX, windowY);
}

- (bool)forwardDisplayLine:(GtkTextIter*)iter
{
	bool returnValue = gtk_text_view_forward_display_line([self castedGObject], iter);

	return returnValue;
}

- (bool)forwardDisplayLineEnd:(GtkTextIter*)iter
{
	bool returnValue = gtk_text_view_forward_display_line_end([self castedGObject], iter);

	return returnValue;
}

- (bool)acceptsTab
{
	bool returnValue = gtk_text_view_get_accepts_tab([self castedGObject]);

	return returnValue;
}

- (int)bottomMargin
{
	int returnValue = gtk_text_view_get_bottom_margin([self castedGObject]);

	return returnValue;
}

- (OGTKTextBuffer*)buffer
{
	GtkTextBuffer* gobjectValue = GTK_TEXT_BUFFER(gtk_text_view_get_buffer([self castedGObject]));

	OGTKTextBuffer* returnValue = [OGTKTextBuffer withGObject:gobjectValue];
	return returnValue;
}

- (void)cursorLocationsWithIter:(const GtkTextIter*)iter strong:(GdkRectangle*)strong weak:(GdkRectangle*)weak
{
	gtk_text_view_get_cursor_locations([self castedGObject], iter, strong, weak);
}

- (bool)cursorVisible
{
	bool returnValue = gtk_text_view_get_cursor_visible([self castedGObject]);

	return returnValue;
}

- (bool)editable
{
	bool returnValue = gtk_text_view_get_editable([self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = G_MENU_MODEL(gtk_text_view_get_extra_menu([self castedGObject]));

	OGMenuModel* returnValue = [OGMenuModel withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)gutter:(GtkTextWindowType)win
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_text_view_get_gutter([self castedGObject], win));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (int)indent
{
	int returnValue = gtk_text_view_get_indent([self castedGObject]);

	return returnValue;
}

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = gtk_text_view_get_input_hints([self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = gtk_text_view_get_input_purpose([self castedGObject]);

	return returnValue;
}

- (bool)iterAtLocationWithIter:(GtkTextIter*)iter x:(int)x y:(int)y
{
	bool returnValue = gtk_text_view_get_iter_at_location([self castedGObject], iter, x, y);

	return returnValue;
}

- (bool)iterAtPositionWithIter:(GtkTextIter*)iter trailing:(int*)trailing x:(int)x y:(int)y
{
	bool returnValue = gtk_text_view_get_iter_at_position([self castedGObject], iter, trailing, x, y);

	return returnValue;
}

- (void)iterLocationWithIter:(const GtkTextIter*)iter location:(GdkRectangle*)location
{
	gtk_text_view_get_iter_location([self castedGObject], iter, location);
}

- (GtkJustification)justification
{
	GtkJustification returnValue = gtk_text_view_get_justification([self castedGObject]);

	return returnValue;
}

- (int)leftMargin
{
	int returnValue = gtk_text_view_get_left_margin([self castedGObject]);

	return returnValue;
}

- (void)lineAtYWithTargetIter:(GtkTextIter*)targetIter y:(int)y lineTop:(int*)lineTop
{
	gtk_text_view_get_line_at_y([self castedGObject], targetIter, y, lineTop);
}

- (void)lineYrangeWithIter:(const GtkTextIter*)iter y:(int*)y height:(int*)height
{
	gtk_text_view_get_line_yrange([self castedGObject], iter, y, height);
}

- (OGPangoContext*)ltrContext
{
	PangoContext* gobjectValue = PANGO_CONTEXT(gtk_text_view_get_ltr_context([self castedGObject]));

	OGPangoContext* returnValue = [OGPangoContext withGObject:gobjectValue];
	return returnValue;
}

- (bool)monospace
{
	bool returnValue = gtk_text_view_get_monospace([self castedGObject]);

	return returnValue;
}

- (bool)overwrite
{
	bool returnValue = gtk_text_view_get_overwrite([self castedGObject]);

	return returnValue;
}

- (int)pixelsAboveLines
{
	int returnValue = gtk_text_view_get_pixels_above_lines([self castedGObject]);

	return returnValue;
}

- (int)pixelsBelowLines
{
	int returnValue = gtk_text_view_get_pixels_below_lines([self castedGObject]);

	return returnValue;
}

- (int)pixelsInsideWrap
{
	int returnValue = gtk_text_view_get_pixels_inside_wrap([self castedGObject]);

	return returnValue;
}

- (int)rightMargin
{
	int returnValue = gtk_text_view_get_right_margin([self castedGObject]);

	return returnValue;
}

- (OGPangoContext*)rtlContext
{
	PangoContext* gobjectValue = PANGO_CONTEXT(gtk_text_view_get_rtl_context([self castedGObject]));

	OGPangoContext* returnValue = [OGPangoContext withGObject:gobjectValue];
	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = gtk_text_view_get_tabs([self castedGObject]);

	return returnValue;
}

- (int)topMargin
{
	int returnValue = gtk_text_view_get_top_margin([self castedGObject]);

	return returnValue;
}

- (void)visibleRect:(GdkRectangle*)visibleRect
{
	gtk_text_view_get_visible_rect([self castedGObject], visibleRect);
}

- (GtkWrapMode)wrapMode
{
	GtkWrapMode returnValue = gtk_text_view_get_wrap_mode([self castedGObject]);

	return returnValue;
}

- (bool)imContextFilterKeypress:(GdkEvent*)event
{
	bool returnValue = gtk_text_view_im_context_filter_keypress([self castedGObject], event);

	return returnValue;
}

- (bool)moveMarkOnscreen:(OGTKTextMark*)mark
{
	bool returnValue = gtk_text_view_move_mark_onscreen([self castedGObject], [mark castedGObject]);

	return returnValue;
}

- (void)moveOverlayWithChild:(OGTKWidget*)child xpos:(int)xpos ypos:(int)ypos
{
	gtk_text_view_move_overlay([self castedGObject], [child castedGObject], xpos, ypos);
}

- (bool)moveVisuallyWithIter:(GtkTextIter*)iter count:(int)count
{
	bool returnValue = gtk_text_view_move_visually([self castedGObject], iter, count);

	return returnValue;
}

- (bool)placeCursorOnscreen
{
	bool returnValue = gtk_text_view_place_cursor_onscreen([self castedGObject]);

	return returnValue;
}

- (void)remove:(OGTKWidget*)child
{
	gtk_text_view_remove([self castedGObject], [child castedGObject]);
}

- (void)resetCursorBlink
{
	gtk_text_view_reset_cursor_blink([self castedGObject]);
}

- (void)resetImContext
{
	gtk_text_view_reset_im_context([self castedGObject]);
}

- (void)scrollMarkOnscreen:(OGTKTextMark*)mark
{
	gtk_text_view_scroll_mark_onscreen([self castedGObject], [mark castedGObject]);
}

- (bool)scrollToIterWithIter:(GtkTextIter*)iter withinMargin:(double)withinMargin useAlign:(bool)useAlign xalign:(double)xalign yalign:(double)yalign
{
	bool returnValue = gtk_text_view_scroll_to_iter([self castedGObject], iter, withinMargin, useAlign, xalign, yalign);

	return returnValue;
}

- (void)scrollToMarkWithMark:(OGTKTextMark*)mark withinMargin:(double)withinMargin useAlign:(bool)useAlign xalign:(double)xalign yalign:(double)yalign
{
	gtk_text_view_scroll_to_mark([self castedGObject], [mark castedGObject], withinMargin, useAlign, xalign, yalign);
}

- (void)setAcceptsTab:(bool)acceptsTab
{
	gtk_text_view_set_accepts_tab([self castedGObject], acceptsTab);
}

- (void)setBottomMargin:(int)bottomMargin
{
	gtk_text_view_set_bottom_margin([self castedGObject], bottomMargin);
}

- (void)setBuffer:(OGTKTextBuffer*)buffer
{
	gtk_text_view_set_buffer([self castedGObject], [buffer castedGObject]);
}

- (void)setCursorVisible:(bool)setting
{
	gtk_text_view_set_cursor_visible([self castedGObject], setting);
}

- (void)setEditable:(bool)setting
{
	gtk_text_view_set_editable([self castedGObject], setting);
}

- (void)setExtraMenu:(OGMenuModel*)model
{
	gtk_text_view_set_extra_menu([self castedGObject], [model castedGObject]);
}

- (void)setGutterWithWin:(GtkTextWindowType)win widget:(OGTKWidget*)widget
{
	gtk_text_view_set_gutter([self castedGObject], win, [widget castedGObject]);
}

- (void)setIndent:(int)indent
{
	gtk_text_view_set_indent([self castedGObject], indent);
}

- (void)setInputHints:(GtkInputHints)hints
{
	gtk_text_view_set_input_hints([self castedGObject], hints);
}

- (void)setInputPurpose:(GtkInputPurpose)purpose
{
	gtk_text_view_set_input_purpose([self castedGObject], purpose);
}

- (void)setJustification:(GtkJustification)justification
{
	gtk_text_view_set_justification([self castedGObject], justification);
}

- (void)setLeftMargin:(int)leftMargin
{
	gtk_text_view_set_left_margin([self castedGObject], leftMargin);
}

- (void)setMonospace:(bool)monospace
{
	gtk_text_view_set_monospace([self castedGObject], monospace);
}

- (void)setOverwrite:(bool)overwrite
{
	gtk_text_view_set_overwrite([self castedGObject], overwrite);
}

- (void)setPixelsAboveLines:(int)pixelsAboveLines
{
	gtk_text_view_set_pixels_above_lines([self castedGObject], pixelsAboveLines);
}

- (void)setPixelsBelowLines:(int)pixelsBelowLines
{
	gtk_text_view_set_pixels_below_lines([self castedGObject], pixelsBelowLines);
}

- (void)setPixelsInsideWrap:(int)pixelsInsideWrap
{
	gtk_text_view_set_pixels_inside_wrap([self castedGObject], pixelsInsideWrap);
}

- (void)setRightMargin:(int)rightMargin
{
	gtk_text_view_set_right_margin([self castedGObject], rightMargin);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_text_view_set_tabs([self castedGObject], tabs);
}

- (void)setTopMargin:(int)topMargin
{
	gtk_text_view_set_top_margin([self castedGObject], topMargin);
}

- (void)setWrapMode:(GtkWrapMode)wrapMode
{
	gtk_text_view_set_wrap_mode([self castedGObject], wrapMode);
}

- (bool)startsDisplayLine:(const GtkTextIter*)iter
{
	bool returnValue = gtk_text_view_starts_display_line([self castedGObject], iter);

	return returnValue;
}

- (void)windowToBufferCoordsWithWin:(GtkTextWindowType)win windowX:(int)windowX windowY:(int)windowY bufferX:(int*)bufferX bufferY:(int*)bufferY
{
	gtk_text_view_window_to_buffer_coords([self castedGObject], win, windowX, windowY, bufferX, bufferY);
}


@end