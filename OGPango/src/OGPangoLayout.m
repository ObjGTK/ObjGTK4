/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoLayout.h"

#import "OGPangoContext.h"

@implementation OGPangoLayout

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGPangoLayout*)deserializeWithContext:(OGPangoContext*)context bytes:(GBytes*)bytes flags:(PangoLayoutDeserializeFlags)flags
{
	GError* err = NULL;

	PangoLayout* gobjectValue = pango_layout_deserialize([context castedGObject], bytes, flags, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (instancetype)layoutWithContext:(OGPangoContext*)context
{
	PangoLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(pango_layout_new([context castedGObject]), PangoLayout, PangoLayout);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGPangoLayout* wrapperObject;
	@try {
		wrapperObject = [[OGPangoLayout alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (PangoLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoLayout, PangoLayout);
}

- (void)contextChanged
{
	pango_layout_context_changed([self castedGObject]);
}

- (OGPangoLayout*)copy
{
	PangoLayout* gobjectValue = pango_layout_copy([self castedGObject]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoAlignment)alignment
{
	PangoAlignment returnValue = (PangoAlignment)pango_layout_get_alignment([self castedGObject]);

	return returnValue;
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)pango_layout_get_attributes([self castedGObject]);

	return returnValue;
}

- (bool)autoDir
{
	bool returnValue = (bool)pango_layout_get_auto_dir([self castedGObject]);

	return returnValue;
}

- (int)baseline
{
	int returnValue = (int)pango_layout_get_baseline([self castedGObject]);

	return returnValue;
}

- (void)caretPosWithIndex:(int)index strongPos:(PangoRectangle*)strongPos weakPos:(PangoRectangle*)weakPos
{
	pango_layout_get_caret_pos([self castedGObject], index, strongPos, weakPos);
}

- (gint)characterCount
{
	gint returnValue = (gint)pango_layout_get_character_count([self castedGObject]);

	return returnValue;
}

- (OGPangoContext*)context
{
	PangoContext* gobjectValue = pango_layout_get_context([self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)cursorPosWithIndex:(int)index strongPos:(PangoRectangle*)strongPos weakPos:(PangoRectangle*)weakPos
{
	pango_layout_get_cursor_pos([self castedGObject], index, strongPos, weakPos);
}

- (PangoDirection)directionWithIndex:(int)index
{
	PangoDirection returnValue = (PangoDirection)pango_layout_get_direction([self castedGObject], index);

	return returnValue;
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = (PangoEllipsizeMode)pango_layout_get_ellipsize([self castedGObject]);

	return returnValue;
}

- (void)extentsWithInkRect:(PangoRectangle*)inkRect logicalRect:(PangoRectangle*)logicalRect
{
	pango_layout_get_extents([self castedGObject], inkRect, logicalRect);
}

- (const PangoFontDescription*)fontDescription
{
	const PangoFontDescription* returnValue = (const PangoFontDescription*)pango_layout_get_font_description([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = (int)pango_layout_get_height([self castedGObject]);

	return returnValue;
}

- (int)indent
{
	int returnValue = (int)pango_layout_get_indent([self castedGObject]);

	return returnValue;
}

- (PangoLayoutIter*)iter
{
	PangoLayoutIter* returnValue = (PangoLayoutIter*)pango_layout_get_iter([self castedGObject]);

	return returnValue;
}

- (bool)justify
{
	bool returnValue = (bool)pango_layout_get_justify([self castedGObject]);

	return returnValue;
}

- (bool)justifyLastLine
{
	bool returnValue = (bool)pango_layout_get_justify_last_line([self castedGObject]);

	return returnValue;
}

- (PangoLayoutLine*)lineWithLine:(int)line
{
	PangoLayoutLine* returnValue = (PangoLayoutLine*)pango_layout_get_line([self castedGObject], line);

	return returnValue;
}

- (int)lineCount
{
	int returnValue = (int)pango_layout_get_line_count([self castedGObject]);

	return returnValue;
}

- (PangoLayoutLine*)lineReadonlyWithLine:(int)line
{
	PangoLayoutLine* returnValue = (PangoLayoutLine*)pango_layout_get_line_readonly([self castedGObject], line);

	return returnValue;
}

- (float)lineSpacing
{
	float returnValue = (float)pango_layout_get_line_spacing([self castedGObject]);

	return returnValue;
}

- (GSList*)lines
{
	GSList* returnValue = (GSList*)pango_layout_get_lines([self castedGObject]);

	return returnValue;
}

- (GSList*)linesReadonly
{
	GSList* returnValue = (GSList*)pango_layout_get_lines_readonly([self castedGObject]);

	return returnValue;
}

- (void)logAttrs:(PangoLogAttr**)attrs nattrs:(gint*)nattrs
{
	pango_layout_get_log_attrs([self castedGObject], attrs, nattrs);
}

- (const PangoLogAttr*)logAttrsReadonlyWithNattrs:(gint*)nattrs
{
	const PangoLogAttr* returnValue = (const PangoLogAttr*)pango_layout_get_log_attrs_readonly([self castedGObject], nattrs);

	return returnValue;
}

- (void)pixelExtentsWithInkRect:(PangoRectangle*)inkRect logicalRect:(PangoRectangle*)logicalRect
{
	pango_layout_get_pixel_extents([self castedGObject], inkRect, logicalRect);
}

- (void)pixelSizeWithWidth:(int*)width height:(int*)height
{
	pango_layout_get_pixel_size([self castedGObject], width, height);
}

- (guint)serial
{
	guint returnValue = (guint)pango_layout_get_serial([self castedGObject]);

	return returnValue;
}

- (bool)singleParagraphMode
{
	bool returnValue = (bool)pango_layout_get_single_paragraph_mode([self castedGObject]);

	return returnValue;
}

- (void)sizeWithWidth:(int*)width height:(int*)height
{
	pango_layout_get_size([self castedGObject], width, height);
}

- (int)spacing
{
	int returnValue = (int)pango_layout_get_spacing([self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)pango_layout_get_tabs([self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = pango_layout_get_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)unknownGlyphsCount
{
	int returnValue = (int)pango_layout_get_unknown_glyphs_count([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)pango_layout_get_width([self castedGObject]);

	return returnValue;
}

- (PangoWrapMode)wrap
{
	PangoWrapMode returnValue = (PangoWrapMode)pango_layout_get_wrap([self castedGObject]);

	return returnValue;
}

- (void)indexToLineX:(int)index trailing:(bool)trailing line:(int*)line xpos:(int*)xpos
{
	pango_layout_index_to_line_x([self castedGObject], index, trailing, line, xpos);
}

- (void)indexToPos:(int)index pos:(PangoRectangle*)pos
{
	pango_layout_index_to_pos([self castedGObject], index, pos);
}

- (bool)isEllipsized
{
	bool returnValue = (bool)pango_layout_is_ellipsized([self castedGObject]);

	return returnValue;
}

- (bool)isWrapped
{
	bool returnValue = (bool)pango_layout_is_wrapped([self castedGObject]);

	return returnValue;
}

- (void)moveCursorVisuallyWithStrong:(bool)strong oldIndex:(int)oldIndex oldTrailing:(int)oldTrailing direction:(int)direction newIndex:(int*)newIndex newTrailing:(int*)newTrailing
{
	pango_layout_move_cursor_visually([self castedGObject], strong, oldIndex, oldTrailing, direction, newIndex, newTrailing);
}

- (GBytes*)serializeWithFlags:(PangoLayoutSerializeFlags)flags
{
	GBytes* returnValue = (GBytes*)pango_layout_serialize([self castedGObject], flags);

	return returnValue;
}

- (void)setAlignment:(PangoAlignment)alignment
{
	pango_layout_set_alignment([self castedGObject], alignment);
}

- (void)setAttributesWithAttrs:(PangoAttrList*)attrs
{
	pango_layout_set_attributes([self castedGObject], attrs);
}

- (void)setAutoDir:(bool)autoDir
{
	pango_layout_set_auto_dir([self castedGObject], autoDir);
}

- (void)setEllipsize:(PangoEllipsizeMode)ellipsize
{
	pango_layout_set_ellipsize([self castedGObject], ellipsize);
}

- (void)setFontDescription:(const PangoFontDescription*)desc
{
	pango_layout_set_font_description([self castedGObject], desc);
}

- (void)setHeight:(int)height
{
	pango_layout_set_height([self castedGObject], height);
}

- (void)setIndent:(int)indent
{
	pango_layout_set_indent([self castedGObject], indent);
}

- (void)setJustify:(bool)justify
{
	pango_layout_set_justify([self castedGObject], justify);
}

- (void)setJustifyLastLine:(bool)justify
{
	pango_layout_set_justify_last_line([self castedGObject], justify);
}

- (void)setLineSpacingWithFactor:(float)factor
{
	pango_layout_set_line_spacing([self castedGObject], factor);
}

- (void)setMarkup:(OFString*)markup length:(int)length
{
	pango_layout_set_markup([self castedGObject], [markup UTF8String], length);
}

- (void)setMarkupWithAccel:(OFString*)markup length:(int)length accelMarker:(gunichar)accelMarker accelChar:(gunichar*)accelChar
{
	pango_layout_set_markup_with_accel([self castedGObject], [markup UTF8String], length, accelMarker, accelChar);
}

- (void)setSingleParagraphModeWithSetting:(bool)setting
{
	pango_layout_set_single_paragraph_mode([self castedGObject], setting);
}

- (void)setSpacing:(int)spacing
{
	pango_layout_set_spacing([self castedGObject], spacing);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	pango_layout_set_tabs([self castedGObject], tabs);
}

- (void)setText:(OFString*)text length:(int)length
{
	pango_layout_set_text([self castedGObject], [text UTF8String], length);
}

- (void)setWidth:(int)width
{
	pango_layout_set_width([self castedGObject], width);
}

- (void)setWrap:(PangoWrapMode)wrap
{
	pango_layout_set_wrap([self castedGObject], wrap);
}

- (bool)writeToFileWithFlags:(PangoLayoutSerializeFlags)flags filename:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = (bool)pango_layout_write_to_file([self castedGObject], flags, [filename UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)xyToIndexWithX:(int)x y:(int)y index:(int*)index trailing:(int*)trailing
{
	bool returnValue = (bool)pango_layout_xy_to_index([self castedGObject], x, y, index, trailing);

	return returnValue;
}


@end