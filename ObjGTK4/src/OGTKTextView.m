/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextView.h"

#import <OGio/OGMenuModel.h>
#import "OGTKTextBuffer.h"
#import "OGTKTextChildAnchor.h"
#import "OGTKTextMark.h"
#import <OGPango/OGPangoContext.h>

@implementation OGTKTextView

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TEXT_VIEW);
	return gObjectClass;
}

+ (instancetype)textView
{
	GtkTextView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_view_new(), GTK_TYPE_TEXT_VIEW, GtkTextView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKTextView* wrapperObject;
	@try {
		wrapperObject = [[OGTKTextView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)textViewWithBuffer:(OGTKTextBuffer*)buffer
{
	GtkTextView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_view_new_with_buffer([buffer castedGObject]), GTK_TYPE_TEXT_VIEW, GtkTextView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKTextView* wrapperObject;
	@try {
		wrapperObject = [[OGTKTextView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTextView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TEXT_VIEW, GtkTextView);
}

- (void)addChildAtAnchor:(OGTKWidget*)child anchor:(OGTKTextChildAnchor*)anchor
{
	gtk_text_view_add_child_at_anchor((GtkTextView*)[self castedGObject], [child castedGObject], [anchor castedGObject]);
}

- (void)addOverlayWithChild:(OGTKWidget*)child xpos:(int)xpos ypos:(int)ypos
{
	gtk_text_view_add_overlay((GtkTextView*)[self castedGObject], [child castedGObject], xpos, ypos);
}

- (bool)backwardDisplayLineWithIter:(GtkTextIter*)iter
{
	bool returnValue = (bool)gtk_text_view_backward_display_line((GtkTextView*)[self castedGObject], iter);

	return returnValue;
}

- (bool)backwardDisplayLineStartWithIter:(GtkTextIter*)iter
{
	bool returnValue = (bool)gtk_text_view_backward_display_line_start((GtkTextView*)[self castedGObject], iter);

	return returnValue;
}

- (void)bufferToWindowCoords:(GtkTextWindowType)win bufferX:(int)bufferX bufferY:(int)bufferY windowX:(int*)windowX windowY:(int*)windowY
{
	gtk_text_view_buffer_to_window_coords((GtkTextView*)[self castedGObject], win, bufferX, bufferY, windowX, windowY);
}

- (bool)forwardDisplayLineWithIter:(GtkTextIter*)iter
{
	bool returnValue = (bool)gtk_text_view_forward_display_line((GtkTextView*)[self castedGObject], iter);

	return returnValue;
}

- (bool)forwardDisplayLineEndWithIter:(GtkTextIter*)iter
{
	bool returnValue = (bool)gtk_text_view_forward_display_line_end((GtkTextView*)[self castedGObject], iter);

	return returnValue;
}

- (bool)acceptsTab
{
	bool returnValue = (bool)gtk_text_view_get_accepts_tab((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (int)bottomMargin
{
	int returnValue = (int)gtk_text_view_get_bottom_margin((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (OGTKTextBuffer*)buffer
{
	GtkTextBuffer* gobjectValue = gtk_text_view_get_buffer((GtkTextView*)[self castedGObject]);

	OGTKTextBuffer* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)cursorLocationsWithIter:(const GtkTextIter*)iter strong:(GdkRectangle*)strong weak:(GdkRectangle*)weak
{
	gtk_text_view_get_cursor_locations((GtkTextView*)[self castedGObject], iter, strong, weak);
}

- (bool)cursorVisible
{
	bool returnValue = (bool)gtk_text_view_get_cursor_visible((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (bool)editable
{
	bool returnValue = (bool)gtk_text_view_get_editable((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (OGMenuModel*)extraMenu
{
	GMenuModel* gobjectValue = gtk_text_view_get_extra_menu((GtkTextView*)[self castedGObject]);

	OGMenuModel* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)gutterWithWin:(GtkTextWindowType)win
{
	GtkWidget* gobjectValue = gtk_text_view_get_gutter((GtkTextView*)[self castedGObject], win);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)indent
{
	int returnValue = (int)gtk_text_view_get_indent((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (GtkInputHints)inputHints
{
	GtkInputHints returnValue = (GtkInputHints)gtk_text_view_get_input_hints((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (GtkInputPurpose)inputPurpose
{
	GtkInputPurpose returnValue = (GtkInputPurpose)gtk_text_view_get_input_purpose((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (bool)iterAtLocationWithIter:(GtkTextIter*)iter x:(int)x y:(int)y
{
	bool returnValue = (bool)gtk_text_view_get_iter_at_location((GtkTextView*)[self castedGObject], iter, x, y);

	return returnValue;
}

- (bool)iterAtPositionWithIter:(GtkTextIter*)iter trailing:(int*)trailing x:(int)x y:(int)y
{
	bool returnValue = (bool)gtk_text_view_get_iter_at_position((GtkTextView*)[self castedGObject], iter, trailing, x, y);

	return returnValue;
}

- (void)iterLocationWithIter:(const GtkTextIter*)iter location:(GdkRectangle*)location
{
	gtk_text_view_get_iter_location((GtkTextView*)[self castedGObject], iter, location);
}

- (GtkJustification)justification
{
	GtkJustification returnValue = (GtkJustification)gtk_text_view_get_justification((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (int)leftMargin
{
	int returnValue = (int)gtk_text_view_get_left_margin((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (void)lineAtYWithTargetIter:(GtkTextIter*)targetIter y:(int)y lineTop:(int*)lineTop
{
	gtk_text_view_get_line_at_y((GtkTextView*)[self castedGObject], targetIter, y, lineTop);
}

- (void)lineYrangeWithIter:(const GtkTextIter*)iter y:(int*)y height:(int*)height
{
	gtk_text_view_get_line_yrange((GtkTextView*)[self castedGObject], iter, y, height);
}

- (OGPangoContext*)ltrContext
{
	PangoContext* gobjectValue = gtk_text_view_get_ltr_context((GtkTextView*)[self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)monospace
{
	bool returnValue = (bool)gtk_text_view_get_monospace((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (bool)overwrite
{
	bool returnValue = (bool)gtk_text_view_get_overwrite((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (int)pixelsAboveLines
{
	int returnValue = (int)gtk_text_view_get_pixels_above_lines((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (int)pixelsBelowLines
{
	int returnValue = (int)gtk_text_view_get_pixels_below_lines((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (int)pixelsInsideWrap
{
	int returnValue = (int)gtk_text_view_get_pixels_inside_wrap((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (int)rightMargin
{
	int returnValue = (int)gtk_text_view_get_right_margin((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (OGPangoContext*)rtlContext
{
	PangoContext* gobjectValue = gtk_text_view_get_rtl_context((GtkTextView*)[self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)gtk_text_view_get_tabs((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (int)topMargin
{
	int returnValue = (int)gtk_text_view_get_top_margin((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (void)visibleRect:(GdkRectangle*)visibleRect
{
	gtk_text_view_get_visible_rect((GtkTextView*)[self castedGObject], visibleRect);
}

- (GtkWrapMode)wrapMode
{
	GtkWrapMode returnValue = (GtkWrapMode)gtk_text_view_get_wrap_mode((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (bool)imContextFilterKeypressWithEvent:(GdkEvent*)event
{
	bool returnValue = (bool)gtk_text_view_im_context_filter_keypress((GtkTextView*)[self castedGObject], event);

	return returnValue;
}

- (bool)moveMarkOnscreen:(OGTKTextMark*)mark
{
	bool returnValue = (bool)gtk_text_view_move_mark_onscreen((GtkTextView*)[self castedGObject], [mark castedGObject]);

	return returnValue;
}

- (void)moveOverlayWithChild:(OGTKWidget*)child xpos:(int)xpos ypos:(int)ypos
{
	gtk_text_view_move_overlay((GtkTextView*)[self castedGObject], [child castedGObject], xpos, ypos);
}

- (bool)moveVisuallyWithIter:(GtkTextIter*)iter count:(int)count
{
	bool returnValue = (bool)gtk_text_view_move_visually((GtkTextView*)[self castedGObject], iter, count);

	return returnValue;
}

- (bool)placeCursorOnscreen
{
	bool returnValue = (bool)gtk_text_view_place_cursor_onscreen((GtkTextView*)[self castedGObject]);

	return returnValue;
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_text_view_remove((GtkTextView*)[self castedGObject], [child castedGObject]);
}

- (void)resetCursorBlink
{
	gtk_text_view_reset_cursor_blink((GtkTextView*)[self castedGObject]);
}

- (void)resetImContext
{
	gtk_text_view_reset_im_context((GtkTextView*)[self castedGObject]);
}

- (void)scrollMarkOnscreen:(OGTKTextMark*)mark
{
	gtk_text_view_scroll_mark_onscreen((GtkTextView*)[self castedGObject], [mark castedGObject]);
}

- (bool)scrollToIter:(GtkTextIter*)iter withinMargin:(double)withinMargin useAlign:(bool)useAlign xalign:(double)xalign yalign:(double)yalign
{
	bool returnValue = (bool)gtk_text_view_scroll_to_iter((GtkTextView*)[self castedGObject], iter, withinMargin, useAlign, xalign, yalign);

	return returnValue;
}

- (void)scrollToMark:(OGTKTextMark*)mark withinMargin:(double)withinMargin useAlign:(bool)useAlign xalign:(double)xalign yalign:(double)yalign
{
	gtk_text_view_scroll_to_mark((GtkTextView*)[self castedGObject], [mark castedGObject], withinMargin, useAlign, xalign, yalign);
}

- (void)setAcceptsTab:(bool)acceptsTab
{
	gtk_text_view_set_accepts_tab((GtkTextView*)[self castedGObject], acceptsTab);
}

- (void)setBottomMargin:(int)bottomMargin
{
	gtk_text_view_set_bottom_margin((GtkTextView*)[self castedGObject], bottomMargin);
}

- (void)setBuffer:(OGTKTextBuffer*)buffer
{
	gtk_text_view_set_buffer((GtkTextView*)[self castedGObject], [buffer castedGObject]);
}

- (void)setCursorVisibleWithSetting:(bool)setting
{
	gtk_text_view_set_cursor_visible((GtkTextView*)[self castedGObject], setting);
}

- (void)setEditableWithSetting:(bool)setting
{
	gtk_text_view_set_editable((GtkTextView*)[self castedGObject], setting);
}

- (void)setExtraMenuWithModel:(OGMenuModel*)model
{
	gtk_text_view_set_extra_menu((GtkTextView*)[self castedGObject], [model castedGObject]);
}

- (void)setGutterWithWin:(GtkTextWindowType)win widget:(OGTKWidget*)widget
{
	gtk_text_view_set_gutter((GtkTextView*)[self castedGObject], win, [widget castedGObject]);
}

- (void)setIndent:(int)indent
{
	gtk_text_view_set_indent((GtkTextView*)[self castedGObject], indent);
}

- (void)setInputHints:(GtkInputHints)hints
{
	gtk_text_view_set_input_hints((GtkTextView*)[self castedGObject], hints);
}

- (void)setInputPurpose:(GtkInputPurpose)purpose
{
	gtk_text_view_set_input_purpose((GtkTextView*)[self castedGObject], purpose);
}

- (void)setJustification:(GtkJustification)justification
{
	gtk_text_view_set_justification((GtkTextView*)[self castedGObject], justification);
}

- (void)setLeftMargin:(int)leftMargin
{
	gtk_text_view_set_left_margin((GtkTextView*)[self castedGObject], leftMargin);
}

- (void)setMonospace:(bool)monospace
{
	gtk_text_view_set_monospace((GtkTextView*)[self castedGObject], monospace);
}

- (void)setOverwrite:(bool)overwrite
{
	gtk_text_view_set_overwrite((GtkTextView*)[self castedGObject], overwrite);
}

- (void)setPixelsAboveLines:(int)pixelsAboveLines
{
	gtk_text_view_set_pixels_above_lines((GtkTextView*)[self castedGObject], pixelsAboveLines);
}

- (void)setPixelsBelowLines:(int)pixelsBelowLines
{
	gtk_text_view_set_pixels_below_lines((GtkTextView*)[self castedGObject], pixelsBelowLines);
}

- (void)setPixelsInsideWrap:(int)pixelsInsideWrap
{
	gtk_text_view_set_pixels_inside_wrap((GtkTextView*)[self castedGObject], pixelsInsideWrap);
}

- (void)setRightMargin:(int)rightMargin
{
	gtk_text_view_set_right_margin((GtkTextView*)[self castedGObject], rightMargin);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	gtk_text_view_set_tabs((GtkTextView*)[self castedGObject], tabs);
}

- (void)setTopMargin:(int)topMargin
{
	gtk_text_view_set_top_margin((GtkTextView*)[self castedGObject], topMargin);
}

- (void)setWrapMode:(GtkWrapMode)wrapMode
{
	gtk_text_view_set_wrap_mode((GtkTextView*)[self castedGObject], wrapMode);
}

- (bool)startsDisplayLineWithIter:(const GtkTextIter*)iter
{
	bool returnValue = (bool)gtk_text_view_starts_display_line((GtkTextView*)[self castedGObject], iter);

	return returnValue;
}

- (void)windowToBufferCoordsWithWin:(GtkTextWindowType)win windowX:(int)windowX windowY:(int)windowY bufferX:(int*)bufferX bufferY:(int*)bufferY
{
	gtk_text_view_window_to_buffer_coords((GtkTextView*)[self castedGObject], win, windowX, windowY, bufferX, bufferY);
}


@end