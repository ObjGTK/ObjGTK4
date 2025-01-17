/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoRenderer.h"

#import "OGPangoFont.h"
#import "OGPangoLayout.h"

@implementation OGPangoRenderer

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_RENDERER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (PangoRenderer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoRenderer, PangoRenderer);
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

- (void)drawLayout:(OGPangoLayout*)layout x:(int)x y:(int)y
{
	pango_renderer_draw_layout([self castedGObject], [layout castedGObject], x, y);
}

- (void)drawLayoutLine:(PangoLayoutLine*)line x:(int)x y:(int)y
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

- (guint16)alphaWithPart:(PangoRenderPart)part
{
	guint16 returnValue = (guint16)pango_renderer_get_alpha([self castedGObject], part);

	return returnValue;
}

- (PangoColor*)colorWithPart:(PangoRenderPart)part
{
	PangoColor* returnValue = (PangoColor*)pango_renderer_get_color([self castedGObject], part);

	return returnValue;
}

- (OGPangoLayout*)layout
{
	PangoLayout* gobjectValue = pango_renderer_get_layout([self castedGObject]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (PangoLayoutLine*)layoutLine
{
	PangoLayoutLine* returnValue = (PangoLayoutLine*)pango_renderer_get_layout_line([self castedGObject]);

	return returnValue;
}

- (const PangoMatrix*)matrix
{
	const PangoMatrix* returnValue = (const PangoMatrix*)pango_renderer_get_matrix([self castedGObject]);

	return returnValue;
}

- (void)partChangedWithPart:(PangoRenderPart)part
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