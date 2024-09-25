/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoRenderer.h"

#import "OGPangoFont.h"
#import "OGPangoLayout.h"

@implementation OGPangoRenderer

- (PangoRenderer*)castedGObject
{
	return PANGO_RENDERER([self gObject]);
}

- (void)activate
{
	pango_renderer_activate([self castedGObject]);
}

- (void)deactivate
{
	pango_renderer_deactivate([self castedGObject]);
}

- (void)drawErrorUnderlineWithX:(int)x y:(int)y width:(int)width height:(int)height
{
	pango_renderer_draw_error_underline([self castedGObject], x, y, width, height);
}

- (void)drawGlyphWithFont:(OGPangoFont*)font glyph:(PangoGlyph)glyph x:(double)x y:(double)y
{
	pango_renderer_draw_glyph([self castedGObject], [font castedGObject], glyph, x, y);
}

- (void)drawGlyphItemWithText:(OFString*)text glyphItem:(PangoGlyphItem*)glyphItem x:(int)x y:(int)y
{
	pango_renderer_draw_glyph_item([self castedGObject], [text UTF8String], glyphItem, x, y);
}

- (void)drawGlyphsWithFont:(OGPangoFont*)font glyphs:(PangoGlyphString*)glyphs x:(int)x y:(int)y
{
	pango_renderer_draw_glyphs([self castedGObject], [font castedGObject], glyphs, x, y);
}

- (void)drawLayoutWithLayout:(OGPangoLayout*)layout x:(int)x y:(int)y
{
	pango_renderer_draw_layout([self castedGObject], [layout castedGObject], x, y);
}

- (void)drawLayoutLineWithLine:(PangoLayoutLine*)line x:(int)x y:(int)y
{
	pango_renderer_draw_layout_line([self castedGObject], line, x, y);
}

- (void)drawRectangleWithPart:(PangoRenderPart)part x:(int)x y:(int)y width:(int)width height:(int)height
{
	pango_renderer_draw_rectangle([self castedGObject], part, x, y, width, height);
}

- (void)drawTrapezoidWithPart:(PangoRenderPart)part y1:(double)y1 x11:(double)x11 x21:(double)x21 y2:(double)y2 x12:(double)x12 x22:(double)x22
{
	pango_renderer_draw_trapezoid([self castedGObject], part, y1, x11, x21, y2, x12, x22);
}

- (guint16)alpha:(PangoRenderPart)part
{
	guint16 returnValue = pango_renderer_get_alpha([self castedGObject], part);

	return returnValue;
}

- (PangoColor*)color:(PangoRenderPart)part
{
	PangoColor* returnValue = pango_renderer_get_color([self castedGObject], part);

	return returnValue;
}

- (OGPangoLayout*)layout
{
	PangoLayout* gobjectValue = PANGO_LAYOUT(pango_renderer_get_layout([self castedGObject]));

	OGPangoLayout* returnValue = [OGPangoLayout withGObject:gobjectValue];
	return returnValue;
}

- (PangoLayoutLine*)layoutLine
{
	PangoLayoutLine* returnValue = pango_renderer_get_layout_line([self castedGObject]);

	return returnValue;
}

- (const PangoMatrix*)matrix
{
	const PangoMatrix* returnValue = pango_renderer_get_matrix([self castedGObject]);

	return returnValue;
}

- (void)partChanged:(PangoRenderPart)part
{
	pango_renderer_part_changed([self castedGObject], part);
}

- (void)setAlphaWithPart:(PangoRenderPart)part alpha:(guint16)alpha
{
	pango_renderer_set_alpha([self castedGObject], part, alpha);
}

- (void)setColorWithPart:(PangoRenderPart)part color:(const PangoColor*)color
{
	pango_renderer_set_color([self castedGObject], part, color);
}

- (void)setMatrix:(const PangoMatrix*)matrix
{
	pango_renderer_set_matrix([self castedGObject], matrix);
}


@end