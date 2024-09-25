/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSnapshot.h"

#import <OGdk4/OGGdkTexture.h>
#import <OGsk4/OGGskGLShader.h>
#import <OGPango/OGPangoLayout.h>
#import "OGTKStyleContext.h"

@implementation OGTKSnapshot

- (instancetype)init
{
	GtkSnapshot* gobjectValue = GTK_SNAPSHOT(gtk_snapshot_new());

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

- (GtkSnapshot*)castedGObject
{
	return GTK_SNAPSHOT([self gObject]);
}

- (void)appendBorderWithOutline:(const GskRoundedRect*)outline borderWidth:(const float*)borderWidth borderColor:(const GdkRGBA*)borderColor
{
	gtk_snapshot_append_border([self castedGObject], outline, borderWidth, borderColor);
}

- (cairo_t*)appendCairo:(const graphene_rect_t*)bounds
{
	cairo_t* returnValue = gtk_snapshot_append_cairo([self castedGObject], bounds);

	return returnValue;
}

- (void)appendColorWithColor:(const GdkRGBA*)color bounds:(const graphene_rect_t*)bounds
{
	gtk_snapshot_append_color([self castedGObject], color, bounds);
}

- (void)appendConicGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center rotation:(float)rotation stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_conic_gradient([self castedGObject], bounds, center, rotation, stops, nstops);
}

- (void)appendFillWithPath:(GskPath*)path fillRule:(GskFillRule)fillRule color:(const GdkRGBA*)color
{
	gtk_snapshot_append_fill([self castedGObject], path, fillRule, color);
}

- (void)appendInsetShadowWithOutline:(const GskRoundedRect*)outline color:(const GdkRGBA*)color dx:(float)dx dy:(float)dy spread:(float)spread blurRadius:(float)blurRadius
{
	gtk_snapshot_append_inset_shadow([self castedGObject], outline, color, dx, dy, spread, blurRadius);
}

- (void)appendLayoutWithLayout:(OGPangoLayout*)layout color:(const GdkRGBA*)color
{
	gtk_snapshot_append_layout([self castedGObject], [layout castedGObject], color);
}

- (void)appendLinearGradientWithBounds:(const graphene_rect_t*)bounds startPoint:(const graphene_point_t*)startPoint endPoint:(const graphene_point_t*)endPoint stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_linear_gradient([self castedGObject], bounds, startPoint, endPoint, stops, nstops);
}

- (void)appendNode:(GskRenderNode*)node
{
	gtk_snapshot_append_node([self castedGObject], node);
}

- (void)appendOutsetShadowWithOutline:(const GskRoundedRect*)outline color:(const GdkRGBA*)color dx:(float)dx dy:(float)dy spread:(float)spread blurRadius:(float)blurRadius
{
	gtk_snapshot_append_outset_shadow([self castedGObject], outline, color, dx, dy, spread, blurRadius);
}

- (void)appendRadialGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center hradius:(float)hradius vradius:(float)vradius start:(float)start end:(float)end stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_radial_gradient([self castedGObject], bounds, center, hradius, vradius, start, end, stops, nstops);
}

- (void)appendRepeatingLinearGradientWithBounds:(const graphene_rect_t*)bounds startPoint:(const graphene_point_t*)startPoint endPoint:(const graphene_point_t*)endPoint stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_repeating_linear_gradient([self castedGObject], bounds, startPoint, endPoint, stops, nstops);
}

- (void)appendRepeatingRadialGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center hradius:(float)hradius vradius:(float)vradius start:(float)start end:(float)end stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_repeating_radial_gradient([self castedGObject], bounds, center, hradius, vradius, start, end, stops, nstops);
}

- (void)appendScaledTextureWithTexture:(OGGdkTexture*)texture filter:(GskScalingFilter)filter bounds:(const graphene_rect_t*)bounds
{
	gtk_snapshot_append_scaled_texture([self castedGObject], [texture castedGObject], filter, bounds);
}

- (void)appendStrokeWithPath:(GskPath*)path stroke:(const GskStroke*)stroke color:(const GdkRGBA*)color
{
	gtk_snapshot_append_stroke([self castedGObject], path, stroke, color);
}

- (void)appendTextureWithTexture:(OGGdkTexture*)texture bounds:(const graphene_rect_t*)bounds
{
	gtk_snapshot_append_texture([self castedGObject], [texture castedGObject], bounds);
}

- (GskRenderNode*)freeToNode
{
	GskRenderNode* returnValue = gtk_snapshot_free_to_node([self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)freeToPaintable:(const graphene_size_t*)size
{
	GdkPaintable* returnValue = gtk_snapshot_free_to_paintable([self castedGObject], size);

	return returnValue;
}

- (void)glShaderPopTexture
{
	gtk_snapshot_gl_shader_pop_texture([self castedGObject]);
}

- (void)perspective:(float)depth
{
	gtk_snapshot_perspective([self castedGObject], depth);
}

- (void)pop
{
	gtk_snapshot_pop([self castedGObject]);
}

- (void)pushBlend:(GskBlendMode)blendMode
{
	gtk_snapshot_push_blend([self castedGObject], blendMode);
}

- (void)pushBlur:(double)radius
{
	gtk_snapshot_push_blur([self castedGObject], radius);
}

- (void)pushClip:(const graphene_rect_t*)bounds
{
	gtk_snapshot_push_clip([self castedGObject], bounds);
}

- (void)pushColorMatrixWithColorMatrix:(const graphene_matrix_t*)colorMatrix colorOffset:(const graphene_vec4_t*)colorOffset
{
	gtk_snapshot_push_color_matrix([self castedGObject], colorMatrix, colorOffset);
}

- (void)pushCrossFade:(double)progress
{
	gtk_snapshot_push_cross_fade([self castedGObject], progress);
}

- (void)pushFillWithPath:(GskPath*)path fillRule:(GskFillRule)fillRule
{
	gtk_snapshot_push_fill([self castedGObject], path, fillRule);
}

- (void)pushGlShaderWithShader:(OGGskGLShader*)shader bounds:(const graphene_rect_t*)bounds takeArgs:(GBytes*)takeArgs
{
	gtk_snapshot_push_gl_shader([self castedGObject], [shader castedGObject], bounds, takeArgs);
}

- (void)pushMask:(GskMaskMode)maskMode
{
	gtk_snapshot_push_mask([self castedGObject], maskMode);
}

- (void)pushOpacity:(double)opacity
{
	gtk_snapshot_push_opacity([self castedGObject], opacity);
}

- (void)pushRepeatWithBounds:(const graphene_rect_t*)bounds childBounds:(const graphene_rect_t*)childBounds
{
	gtk_snapshot_push_repeat([self castedGObject], bounds, childBounds);
}

- (void)pushRoundedClip:(const GskRoundedRect*)bounds
{
	gtk_snapshot_push_rounded_clip([self castedGObject], bounds);
}

- (void)pushShadowWithShadow:(const GskShadow*)shadow nshadows:(gsize)nshadows
{
	gtk_snapshot_push_shadow([self castedGObject], shadow, nshadows);
}

- (void)pushStrokeWithPath:(GskPath*)path stroke:(const GskStroke*)stroke
{
	gtk_snapshot_push_stroke([self castedGObject], path, stroke);
}

- (void)renderBackgroundWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height
{
	gtk_snapshot_render_background([self castedGObject], [context castedGObject], x, y, width, height);
}

- (void)renderFocusWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height
{
	gtk_snapshot_render_focus([self castedGObject], [context castedGObject], x, y, width, height);
}

- (void)renderFrameWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height
{
	gtk_snapshot_render_frame([self castedGObject], [context castedGObject], x, y, width, height);
}

- (void)renderInsertionCursorWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y layout:(OGPangoLayout*)layout index:(int)index direction:(PangoDirection)direction
{
	gtk_snapshot_render_insertion_cursor([self castedGObject], [context castedGObject], x, y, [layout castedGObject], index, direction);
}

- (void)renderLayoutWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y layout:(OGPangoLayout*)layout
{
	gtk_snapshot_render_layout([self castedGObject], [context castedGObject], x, y, [layout castedGObject]);
}

- (void)restore
{
	gtk_snapshot_restore([self castedGObject]);
}

- (void)rotate:(float)angle
{
	gtk_snapshot_rotate([self castedGObject], angle);
}

- (void)rotate3dWithAngle:(float)angle axis:(const graphene_vec3_t*)axis
{
	gtk_snapshot_rotate_3d([self castedGObject], angle, axis);
}

- (void)save
{
	gtk_snapshot_save([self castedGObject]);
}

- (void)scaleWithFactorX:(float)factorX factorY:(float)factorY
{
	gtk_snapshot_scale([self castedGObject], factorX, factorY);
}

- (void)scale3dWithFactorX:(float)factorX factorY:(float)factorY factorZ:(float)factorZ
{
	gtk_snapshot_scale_3d([self castedGObject], factorX, factorY, factorZ);
}

- (GskRenderNode*)toNode
{
	GskRenderNode* returnValue = gtk_snapshot_to_node([self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)toPaintable:(const graphene_size_t*)size
{
	GdkPaintable* returnValue = gtk_snapshot_to_paintable([self castedGObject], size);

	return returnValue;
}

- (void)transform:(GskTransform*)transform
{
	gtk_snapshot_transform([self castedGObject], transform);
}

- (void)transformMatrix:(const graphene_matrix_t*)matrix
{
	gtk_snapshot_transform_matrix([self castedGObject], matrix);
}

- (void)translate:(const graphene_point_t*)point
{
	gtk_snapshot_translate([self castedGObject], point);
}

- (void)translate3d:(const graphene_point3d_t*)point
{
	gtk_snapshot_translate_3d([self castedGObject], point);
}


@end