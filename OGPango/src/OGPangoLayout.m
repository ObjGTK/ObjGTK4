/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoLayout.h"

#import "OGPangoContext.h"

@implementation OGPangoLayout

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(PANGO_TYPE_LAYOUT);
	return gObjectClass;
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
	PangoLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(pango_layout_new([context castedGObject]), PANGO_TYPE_LAYOUT, PangoLayout);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PANGO_TYPE_LAYOUT, PangoLayout);
}

- (void)contextChanged
{
	pango_layout_context_changed((PangoLayout*)[self castedGObject]);
}

- (OGPangoLayout*)copy
{
	PangoLayout* gobjectValue = pango_layout_copy((PangoLayout*)[self castedGObject]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoAlignment)alignment
{
	PangoAlignment returnValue = (PangoAlignment)pango_layout_get_alignment((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)pango_layout_get_attributes((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (bool)autoDir
{
	bool returnValue = (bool)pango_layout_get_auto_dir((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (int)baseline
{
	int returnValue = (int)pango_layout_get_baseline((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (void)caretPosWithIndex:(int)index strongPos:(PangoRectangle*)strongPos weakPos:(PangoRectangle*)weakPos
{
	pango_layout_get_caret_pos((PangoLayout*)[self castedGObject], index, strongPos, weakPos);
}

- (gint)characterCount
{
	gint returnValue = (gint)pango_layout_get_character_count((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (OGPangoContext*)context
{
	PangoContext* gobjectValue = pango_layout_get_context((PangoLayout*)[self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)cursorPosWithIndex:(int)index strongPos:(PangoRectangle*)strongPos weakPos:(PangoRectangle*)weakPos
{
	pango_layout_get_cursor_pos((PangoLayout*)[self castedGObject], index, strongPos, weakPos);
}

- (PangoDirection)directionWithIndex:(int)index
{
	PangoDirection returnValue = (PangoDirection)pango_layout_get_direction((PangoLayout*)[self castedGObject], index);

	return returnValue;
}

- (PangoEllipsizeMode)ellipsize
{
	PangoEllipsizeMode returnValue = (PangoEllipsizeMode)pango_layout_get_ellipsize((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (void)extentsWithInkRect:(PangoRectangle*)inkRect logicalRect:(PangoRectangle*)logicalRect
{
	pango_layout_get_extents((PangoLayout*)[self castedGObject], inkRect, logicalRect);
}

- (const PangoFontDescription*)fontDescription
{
	const PangoFontDescription* returnValue = (const PangoFontDescription*)pango_layout_get_font_description((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = (int)pango_layout_get_height((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (int)indent
{
	int returnValue = (int)pango_layout_get_indent((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (PangoLayoutIter*)iter
{
	PangoLayoutIter* returnValue = (PangoLayoutIter*)pango_layout_get_iter((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (bool)justify
{
	bool returnValue = (bool)pango_layout_get_justify((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (bool)justifyLastLine
{
	bool returnValue = (bool)pango_layout_get_justify_last_line((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (PangoLayoutLine*)lineWithLine:(int)line
{
	PangoLayoutLine* returnValue = (PangoLayoutLine*)pango_layout_get_line((PangoLayout*)[self castedGObject], line);

	return returnValue;
}

- (int)lineCount
{
	int returnValue = (int)pango_layout_get_line_count((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (PangoLayoutLine*)lineReadonlyWithLine:(int)line
{
	PangoLayoutLine* returnValue = (PangoLayoutLine*)pango_layout_get_line_readonly((PangoLayout*)[self castedGObject], line);

	return returnValue;
}

- (float)lineSpacing
{
	float returnValue = (float)pango_layout_get_line_spacing((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (GSList*)lines
{
	GSList* returnValue = (GSList*)pango_layout_get_lines((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (GSList*)linesReadonly
{
	GSList* returnValue = (GSList*)pango_layout_get_lines_readonly((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (void)logAttrs:(PangoLogAttr**)attrs nattrs:(gint*)nattrs
{
	pango_layout_get_log_attrs((PangoLayout*)[self castedGObject], attrs, nattrs);
}

- (const PangoLogAttr*)logAttrsReadonlyWithNattrs:(gint*)nattrs
{
	const PangoLogAttr* returnValue = (const PangoLogAttr*)pango_layout_get_log_attrs_readonly((PangoLayout*)[self castedGObject], nattrs);

	return returnValue;
}

- (void)pixelExtentsWithInkRect:(PangoRectangle*)inkRect logicalRect:(PangoRectangle*)logicalRect
{
	pango_layout_get_pixel_extents((PangoLayout*)[self castedGObject], inkRect, logicalRect);
}

- (void)pixelSizeWithWidth:(int*)width height:(int*)height
{
	pango_layout_get_pixel_size((PangoLayout*)[self castedGObject], width, height);
}

- (guint)serial
{
	guint returnValue = (guint)pango_layout_get_serial((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (bool)singleParagraphMode
{
	bool returnValue = (bool)pango_layout_get_single_paragraph_mode((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (void)sizeWithWidth:(int*)width height:(int*)height
{
	pango_layout_get_size((PangoLayout*)[self castedGObject], width, height);
}

- (int)spacing
{
	int returnValue = (int)pango_layout_get_spacing((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (PangoTabArray*)tabs
{
	PangoTabArray* returnValue = (PangoTabArray*)pango_layout_get_tabs((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = pango_layout_get_text((PangoLayout*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)unknownGlyphsCount
{
	int returnValue = (int)pango_layout_get_unknown_glyphs_count((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)pango_layout_get_width((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (PangoWrapMode)wrap
{
	PangoWrapMode returnValue = (PangoWrapMode)pango_layout_get_wrap((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (void)indexToLineX:(int)index trailing:(bool)trailing line:(int*)line xpos:(int*)xpos
{
	pango_layout_index_to_line_x((PangoLayout*)[self castedGObject], index, trailing, line, xpos);
}

- (void)indexToPos:(int)index pos:(PangoRectangle*)pos
{
	pango_layout_index_to_pos((PangoLayout*)[self castedGObject], index, pos);
}

- (bool)isEllipsized
{
	bool returnValue = (bool)pango_layout_is_ellipsized((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (bool)isWrapped
{
	bool returnValue = (bool)pango_layout_is_wrapped((PangoLayout*)[self castedGObject]);

	return returnValue;
}

- (void)moveCursorVisuallyWithStrong:(bool)strong oldIndex:(int)oldIndex oldTrailing:(int)oldTrailing direction:(int)direction newIndex:(int*)newIndex newTrailing:(int*)newTrailing
{
	pango_layout_move_cursor_visually((PangoLayout*)[self castedGObject], strong, oldIndex, oldTrailing, direction, newIndex, newTrailing);
}

- (GBytes*)serializeWithFlags:(PangoLayoutSerializeFlags)flags
{
	GBytes* returnValue = (GBytes*)pango_layout_serialize((PangoLayout*)[self castedGObject], flags);

	return returnValue;
}

- (void)setAlignment:(PangoAlignment)alignment
{
	pango_layout_set_alignment((PangoLayout*)[self castedGObject], alignment);
}

- (void)setAttributesWithAttrs:(PangoAttrList*)attrs
{
	pango_layout_set_attributes((PangoLayout*)[self castedGObject], attrs);
}

- (void)setAutoDir:(bool)autoDir
{
	pango_layout_set_auto_dir((PangoLayout*)[self castedGObject], autoDir);
}

- (void)setEllipsize:(PangoEllipsizeMode)ellipsize
{
	pango_layout_set_ellipsize((PangoLayout*)[self castedGObject], ellipsize);
}

- (void)setFontDescription:(const PangoFontDescription*)desc
{
	pango_layout_set_font_description((PangoLayout*)[self castedGObject], desc);
}

- (void)setHeight:(int)height
{
	pango_layout_set_height((PangoLayout*)[self castedGObject], height);
}

- (void)setIndent:(int)indent
{
	pango_layout_set_indent((PangoLayout*)[self castedGObject], indent);
}

- (void)setJustify:(bool)justify
{
	pango_layout_set_justify((PangoLayout*)[self castedGObject], justify);
}

- (void)setJustifyLastLine:(bool)justify
{
	pango_layout_set_justify_last_line((PangoLayout*)[self castedGObject], justify);
}

- (void)setLineSpacingWithFactor:(float)factor
{
	pango_layout_set_line_spacing((PangoLayout*)[self castedGObject], factor);
}

- (void)setMarkup:(OFString*)markup length:(int)length
{
	pango_layout_set_markup((PangoLayout*)[self castedGObject], [markup UTF8String], length);
}

- (void)setMarkupWithAccel:(OFString*)markup length:(int)length accelMarker:(gunichar)accelMarker accelChar:(gunichar*)accelChar
{
	pango_layout_set_markup_with_accel((PangoLayout*)[self castedGObject], [markup UTF8String], length, accelMarker, accelChar);
}

- (void)setSingleParagraphModeWithSetting:(bool)setting
{
	pango_layout_set_single_paragraph_mode((PangoLayout*)[self castedGObject], setting);
}

- (void)setSpacing:(int)spacing
{
	pango_layout_set_spacing((PangoLayout*)[self castedGObject], spacing);
}

- (void)setTabs:(PangoTabArray*)tabs
{
	pango_layout_set_tabs((PangoLayout*)[self castedGObject], tabs);
}

- (void)setText:(OFString*)text length:(int)length
{
	pango_layout_set_text((PangoLayout*)[self castedGObject], [text UTF8String], length);
}

- (void)setWidth:(int)width
{
	pango_layout_set_width((PangoLayout*)[self castedGObject], width);
}

- (void)setWrap:(PangoWrapMode)wrap
{
	pango_layout_set_wrap((PangoLayout*)[self castedGObject], wrap);
}

- (bool)writeToFileWithFlags:(PangoLayoutSerializeFlags)flags filename:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = (bool)pango_layout_write_to_file((PangoLayout*)[self castedGObject], flags, [filename UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)xyToIndexWithX:(int)x y:(int)y index:(int*)index trailing:(int*)trailing
{
	bool returnValue = (bool)pango_layout_xy_to_index((PangoLayout*)[self castedGObject], x, y, index, trailing);

	return returnValue;
}


@end