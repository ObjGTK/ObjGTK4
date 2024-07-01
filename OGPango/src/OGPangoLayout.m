/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoLayout.h"

#import "OGPangoContext.h"

@implementation OGPangoLayout

+ (OGPangoLayout*)deserializeWithContext:(OGPangoContext*)context bytes:(GBytes*)bytes flags:(PangoLayoutDeserializeFlags)flags
{
	GError* err = NULL;

	PangoLayout* gobjectValue = PANGO_LAYOUT(pango_layout_deserialize([context castedGObject], bytes, flags, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGPangoLayout* returnValue = [OGPangoLayout withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (instancetype)init:(OGPangoContext*)context
{
	PangoLayout* gobjectValue = PANGO_LAYOUT(pango_layout_new([context castedGObject]));

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

- (PangoLayout*)castedGObject
{
	return PANGO_LAYOUT([self gObject]);
}

- (void)contextChanged
{
	pango_layout_context_changed([self castedGObject]);
}

- (OGPangoLayout*)copy
{
	PangoLayout* gobjectValue = PANGO_LAYOUT(pango_layout_copy([self castedGObject]));

	OGPangoLayout* returnValue = [OGPangoLayout withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoAlignment)alignment
{
	PangoAlignment returnValue = pango_layout_get_alignment([self castedGObject]);

	return returnValue;
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = pango_layout_get_attributes([self castedGObject]);

	return returnValue;
}

- (bool)autoDir
{
	bool returnValue = pango_layout_get_auto_dir([self castedGObject]);

	return returnValue;
}

- (int)baseline
{
	int returnValue = pango_layout_get_baseline([self castedGObject]);

	return returnValue;
}

- (void)caretPosWithIndex:(int)index strongPos:(PangoRectangle*)strongPos weakPos:(PangoRectangle*)weakPos
{
	pango_layout_get_caret_pos([self castedGObject], index, strongPos, weakPos);
}

- (gint)characterCount
{
	gint returnValue = pango_layout_get_character_count([self castedGObject]);

	return returnValue;
}

- (OGPangoContext*)context
{
	PangoContext* gobjectValue = PANGO_CONTEXT(pango_layout_get_context([self castedGObject]));

	OGPangoContext* returnValue = [OGPangoContext withGObject:gobjectValue];
	return returnValue;
}

- (void)cursorPosWithIndex:(int)index strongPos:(PangoRectangle*)strongPos weakPos:(PangoRectangle*)weakPos
{
	pango_layout_get_cursor_pos([self castedGObject], index, strongPos, weakPos);
}

- (PangoDirection)direction:(int)index
{
	PangoDirection returnValue = pango_layout_get_direction([self castedGObject], index);

	return returnValue;
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = pango_layout_get_ellipsize([self castedGObject]);

	return returnValue;
}

- (void)extentsWithInkRect:(PangoRectangle*)inkRect logicalRect:(PangoRectangle*)logicalRect
{
	pango_layout_get_extents([self castedGObject], inkRect, logicalRect);
}

- (const PangoFontDescription*)fontDescription
{
	const PangoFontDescription* returnValue = pango_layout_get_font_description([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = pango_layout_get_height([self castedGObject]);

	return returnValue;
}

- (int)indent
{
	int returnValue = pango_layout_get_indent([self castedGObject]);

	return returnValue;
}

- (PangoLayoutIter*)iter
{
	PangoLayoutIter* returnValue = pango_layout_get_iter([self castedGObject]);

	return returnValue;
}

- (bool)justify
{
	bool returnValue = pango_layout_get_justify([self castedGObject]);

	return returnValue;
}

- (bool)justifyLastLine
{
	bool returnValue = pango_layout_get_justify_last_line([self castedGObject]);

	return returnValue;
}

- (PangoLayoutLine*)line:(int)line
{
	PangoLayoutLine* returnValue = pango_layout_get_line([self castedGObject], line);

	return returnValue;
}

- (int)lineCount
{
	int returnValue = pango_layout_get_line_count([self castedGObject]);

	return returnValue;
}

- (PangoLayoutLine*)lineReadonly:(int)line
{
	PangoLayoutLine* returnValue = pango_layout_get_line_readonly([self castedGObject], line);

	return returnValue;
}

- (float)lineSpacing
{
	float returnValue = pango_layout_get_line_spacing([self castedGObject]);

	return returnValue;
}

- (GSList*)lines
{
	GSList* returnValue = pango_layout_get_lines([self castedGObject]);

	return returnValue;
}

- (GSList*)linesReadonly
{
	GSList* returnValue = pango_layout_get_lines_readonly([self castedGObject]);

	return returnValue;
}

- (void)logAttrsWithAttrs:(PangoLogAttr**)attrs nattrs:(gint*)nattrs
{
	pango_layout_get_log_attrs([self castedGObject], attrs, nattrs);
}

- (const PangoLogAttr*)logAttrsReadonly:(gint*)nattrs
{
	const PangoLogAttr* returnValue = pango_layout_get_log_attrs_readonly([self castedGObject], nattrs);

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
	guint returnValue = pango_layout_get_serial([self castedGObject]);

	return returnValue;
}

- (bool)singleParagraphMode
{
	bool returnValue = pango_layout_get_single_paragraph_mode([self castedGObject]);

	return returnValue;
}

- (void)sizeWithWidth:(int*)width height:(int*)height
{
	pango_layout_get_size([self castedGObject], width, height);
}

- (int)spacing
{
	int returnValue = pango_layout_get_spacing([self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = pango_layout_get_tabs([self castedGObject]);

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
	int returnValue = pango_layout_get_unknown_glyphs_count([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = pango_layout_get_width([self castedGObject]);

	return returnValue;
}

- (PangoWrapMode)wrap
{
	PangoWrapMode returnValue = pango_layout_get_wrap([self castedGObject]);

	return returnValue;
}

- (void)indexToLineXWithIndex:(int)index trailing:(bool)trailing line:(int*)line xpos:(int*)xpos
{
	pango_layout_index_to_line_x([self castedGObject], index, trailing, line, xpos);
}

- (void)indexToPosWithIndex:(int)index pos:(PangoRectangle*)pos
{
	pango_layout_index_to_pos([self castedGObject], index, pos);
}

- (bool)isEllipsized
{
	bool returnValue = pango_layout_is_ellipsized([self castedGObject]);

	return returnValue;
}

- (bool)isWrapped
{
	bool returnValue = pango_layout_is_wrapped([self castedGObject]);

	return returnValue;
}

- (void)moveCursorVisuallyWithStrong:(bool)strong oldIndex:(int)oldIndex oldTrailing:(int)oldTrailing direction:(int)direction newIndex:(int*)newIndex newTrailing:(int*)newTrailing
{
	pango_layout_move_cursor_visually([self castedGObject], strong, oldIndex, oldTrailing, direction, newIndex, newTrailing);
}

- (GBytes*)serialize:(PangoLayoutSerializeFlags)flags
{
	GBytes* returnValue = pango_layout_serialize([self castedGObject], flags);

	return returnValue;
}

- (void)setAlignment:(PangoAlignment)alignment
{
	pango_layout_set_alignment([self castedGObject], alignment);
}

- (void)setAttributes:(PangoAttrList*)attrs
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

- (void)setLineSpacing:(float)factor
{
	pango_layout_set_line_spacing([self castedGObject], factor);
}

- (void)setMarkupWithMarkup:(OFString*)markup length:(int)length
{
	pango_layout_set_markup([self castedGObject], [markup UTF8String], length);
}

- (void)setMarkupWithAccelWithMarkup:(OFString*)markup length:(int)length accelMarker:(gunichar)accelMarker accelChar:(gunichar*)accelChar
{
	pango_layout_set_markup_with_accel([self castedGObject], [markup UTF8String], length, accelMarker, accelChar);
}

- (void)setSingleParagraphMode:(bool)setting
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

- (void)setTextWithText:(OFString*)text length:(int)length
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

	bool returnValue = pango_layout_write_to_file([self castedGObject], flags, [filename UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)xyToIndexWithX:(int)x y:(int)y index:(int*)index trailing:(int*)trailing
{
	bool returnValue = pango_layout_xy_to_index([self castedGObject], x, y, index, trailing);

	return returnValue;
}


@end