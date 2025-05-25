/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSnapshot.h"

#import <OGdk4/OGdkTexture.h>
#import <OGsk4/OGskGLShader.h>
#import "OGTKStyleContext.h"
#import <OGPango/OGPangoLayout.h>

@implementation OGTKSnapshot

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SNAPSHOT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SNAPSHOT);
	return gObjectClass;
}

+ (instancetype)snapshot
{
	GtkSnapshot* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_snapshot_new(), GTK_TYPE_SNAPSHOT, GtkSnapshot);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSnapshot* wrapperObject;
	@try {
		wrapperObject = [[OGTKSnapshot alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSnapshot*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SNAPSHOT, GtkSnapshot);
}

- (void)appendBorderWithOutline:(const GskRoundedRect*)outline borderWidth:(const float*)borderWidth borderColor:(const GdkRGBA*)borderColor
{
	gtk_snapshot_append_border((GtkSnapshot*)[self castedGObject], outline, borderWidth, borderColor);
}

- (cairo_t*)appendCairoWithBounds:(const graphene_rect_t*)bounds
{
	cairo_t* returnValue = (cairo_t*)gtk_snapshot_append_cairo((GtkSnapshot*)[self castedGObject], bounds);

	return returnValue;
}

- (void)appendColor:(const GdkRGBA*)color bounds:(const graphene_rect_t*)bounds
{
	gtk_snapshot_append_color((GtkSnapshot*)[self castedGObject], color, bounds);
}

- (void)appendConicGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center rotation:(float)rotation stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_conic_gradient((GtkSnapshot*)[self castedGObject], bounds, center, rotation, stops, nstops);
}

- (void)appendFillWithPath:(GskPath*)path fillRule:(GskFillRule)fillRule color:(const GdkRGBA*)color
{
	gtk_snapshot_append_fill((GtkSnapshot*)[self castedGObject], path, fillRule, color);
}

- (void)appendInsetShadowWithOutline:(const GskRoundedRect*)outline color:(const GdkRGBA*)color dx:(float)dx dy:(float)dy spread:(float)spread blurRadius:(float)blurRadius
{
	gtk_snapshot_append_inset_shadow((GtkSnapshot*)[self castedGObject], outline, color, dx, dy, spread, blurRadius);
}

- (void)appendLayout:(OGPangoLayout*)layout color:(const GdkRGBA*)color
{
	gtk_snapshot_append_layout((GtkSnapshot*)[self castedGObject], [layout castedGObject], color);
}

- (void)appendLinearGradientWithBounds:(const graphene_rect_t*)bounds startPoint:(const graphene_point_t*)startPoint endPoint:(const graphene_point_t*)endPoint stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_linear_gradient((GtkSnapshot*)[self castedGObject], bounds, startPoint, endPoint, stops, nstops);
}

- (void)appendNode:(GskRenderNode*)node
{
	gtk_snapshot_append_node((GtkSnapshot*)[self castedGObject], node);
}

- (void)appendOutsetShadowWithOutline:(const GskRoundedRect*)outline color:(const GdkRGBA*)color dx:(float)dx dy:(float)dy spread:(float)spread blurRadius:(float)blurRadius
{
	gtk_snapshot_append_outset_shadow((GtkSnapshot*)[self castedGObject], outline, color, dx, dy, spread, blurRadius);
}

- (void)appendRadialGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center hradius:(float)hradius vradius:(float)vradius start:(float)start end:(float)end stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_radial_gradient((GtkSnapshot*)[self castedGObject], bounds, center, hradius, vradius, start, end, stops, nstops);
}

- (void)appendRepeatingLinearGradientWithBounds:(const graphene_rect_t*)bounds startPoint:(const graphene_point_t*)startPoint endPoint:(const graphene_point_t*)endPoint stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_repeating_linear_gradient((GtkSnapshot*)[self castedGObject], bounds, startPoint, endPoint, stops, nstops);
}

- (void)appendRepeatingRadialGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center hradius:(float)hradius vradius:(float)vradius start:(float)start end:(float)end stops:(const GskColorStop*)stops nstops:(gsize)nstops
{
	gtk_snapshot_append_repeating_radial_gradient((GtkSnapshot*)[self castedGObject], bounds, center, hradius, vradius, start, end, stops, nstops);
}

- (void)appendScaledTexture:(OGdkTexture*)texture filter:(GskScalingFilter)filter bounds:(const graphene_rect_t*)bounds
{
	gtk_snapshot_append_scaled_texture((GtkSnapshot*)[self castedGObject], [texture castedGObject], filter, bounds);
}

- (void)appendStrokeWithPath:(GskPath*)path stroke:(const GskStroke*)stroke color:(const GdkRGBA*)color
{
	gtk_snapshot_append_stroke((GtkSnapshot*)[self castedGObject], path, stroke, color);
}

- (void)appendTexture:(OGdkTexture*)texture bounds:(const graphene_rect_t*)bounds
{
	gtk_snapshot_append_texture((GtkSnapshot*)[self castedGObject], [texture castedGObject], bounds);
}

- (GskRenderNode*)freeToNode
{
	GskRenderNode* returnValue = (GskRenderNode*)gtk_snapshot_free_to_node((GtkSnapshot*)[self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)freeToPaintableWithSize:(const graphene_size_t*)size
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_snapshot_free_to_paintable((GtkSnapshot*)[self castedGObject], size);

	return returnValue;
}

- (void)glShaderPopTexture
{
	gtk_snapshot_gl_shader_pop_texture((GtkSnapshot*)[self castedGObject]);
}

- (void)perspectiveWithDepth:(float)depth
{
	gtk_snapshot_perspective((GtkSnapshot*)[self castedGObject], depth);
}

- (void)pop
{
	gtk_snapshot_pop((GtkSnapshot*)[self castedGObject]);
}

- (void)pushBlendWithBlendMode:(GskBlendMode)blendMode
{
	gtk_snapshot_push_blend((GtkSnapshot*)[self castedGObject], blendMode);
}

- (void)pushBlurWithRadius:(double)radius
{
	gtk_snapshot_push_blur((GtkSnapshot*)[self castedGObject], radius);
}

- (void)pushClipWithBounds:(const graphene_rect_t*)bounds
{
	gtk_snapshot_push_clip((GtkSnapshot*)[self castedGObject], bounds);
}

- (void)pushColorMatrix:(const graphene_matrix_t*)colorMatrix colorOffset:(const graphene_vec4_t*)colorOffset
{
	gtk_snapshot_push_color_matrix((GtkSnapshot*)[self castedGObject], colorMatrix, colorOffset);
}

- (void)pushCrossFadeWithProgress:(double)progress
{
	gtk_snapshot_push_cross_fade((GtkSnapshot*)[self castedGObject], progress);
}

- (void)pushFillWithPath:(GskPath*)path fillRule:(GskFillRule)fillRule
{
	gtk_snapshot_push_fill((GtkSnapshot*)[self castedGObject], path, fillRule);
}

- (void)pushGlShader:(OGskGLShader*)shader bounds:(const graphene_rect_t*)bounds takeArgs:(GBytes*)takeArgs
{
	gtk_snapshot_push_gl_shader((GtkSnapshot*)[self castedGObject], [shader castedGObject], bounds, takeArgs);
}

- (void)pushMaskWithMaskMode:(GskMaskMode)maskMode
{
	gtk_snapshot_push_mask((GtkSnapshot*)[self castedGObject], maskMode);
}

- (void)pushOpacity:(double)opacity
{
	gtk_snapshot_push_opacity((GtkSnapshot*)[self castedGObject], opacity);
}

- (void)pushRepeatWithBounds:(const graphene_rect_t*)bounds childBounds:(const graphene_rect_t*)childBounds
{
	gtk_snapshot_push_repeat((GtkSnapshot*)[self castedGObject], bounds, childBounds);
}

- (void)pushRoundedClipWithBounds:(const GskRoundedRect*)bounds
{
	gtk_snapshot_push_rounded_clip((GtkSnapshot*)[self castedGObject], bounds);
}

- (void)pushShadow:(const GskShadow*)shadow nshadows:(gsize)nshadows
{
	gtk_snapshot_push_shadow((GtkSnapshot*)[self castedGObject], shadow, nshadows);
}

- (void)pushStrokeWithPath:(GskPath*)path stroke:(const GskStroke*)stroke
{
	gtk_snapshot_push_stroke((GtkSnapshot*)[self castedGObject], path, stroke);
}

- (void)renderBackgroundWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height
{
	gtk_snapshot_render_background((GtkSnapshot*)[self castedGObject], [context castedGObject], x, y, width, height);
}

- (void)renderFocusWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height
{
	gtk_snapshot_render_focus((GtkSnapshot*)[self castedGObject], [context castedGObject], x, y, width, height);
}

- (void)renderFrameWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height
{
	gtk_snapshot_render_frame((GtkSnapshot*)[self castedGObject], [context castedGObject], x, y, width, height);
}

- (void)renderInsertionCursorWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y layout:(OGPangoLayout*)layout index:(int)index direction:(PangoDirection)direction
{
	gtk_snapshot_render_insertion_cursor((GtkSnapshot*)[self castedGObject], [context castedGObject], x, y, [layout castedGObject], index, direction);
}

- (void)renderLayoutWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y layout:(OGPangoLayout*)layout
{
	gtk_snapshot_render_layout((GtkSnapshot*)[self castedGObject], [context castedGObject], x, y, [layout castedGObject]);
}

- (void)restore
{
	gtk_snapshot_restore((GtkSnapshot*)[self castedGObject]);
}

- (void)rotateWithAngle:(float)angle
{
	gtk_snapshot_rotate((GtkSnapshot*)[self castedGObject], angle);
}

- (void)rotate3dWithAngle:(float)angle axis:(const graphene_vec3_t*)axis
{
	gtk_snapshot_rotate_3d((GtkSnapshot*)[self castedGObject], angle, axis);
}

- (void)save
{
	gtk_snapshot_save((GtkSnapshot*)[self castedGObject]);
}

- (void)scaleWithFactorX:(float)factorX factorY:(float)factorY
{
	gtk_snapshot_scale((GtkSnapshot*)[self castedGObject], factorX, factorY);
}

- (void)scale3dWithFactorX:(float)factorX factorY:(float)factorY factorZ:(float)factorZ
{
	gtk_snapshot_scale_3d((GtkSnapshot*)[self castedGObject], factorX, factorY, factorZ);
}

- (GskRenderNode*)toNode
{
	GskRenderNode* returnValue = (GskRenderNode*)gtk_snapshot_to_node((GtkSnapshot*)[self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)toPaintableWithSize:(const graphene_size_t*)size
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_snapshot_to_paintable((GtkSnapshot*)[self castedGObject], size);

	return returnValue;
}

- (void)transformWithTransform:(GskTransform*)transform
{
	gtk_snapshot_transform((GtkSnapshot*)[self castedGObject], transform);
}

- (void)transformMatrix:(const graphene_matrix_t*)matrix
{
	gtk_snapshot_transform_matrix((GtkSnapshot*)[self castedGObject], matrix);
}

- (void)translateWithPoint:(const graphene_point_t*)point
{
	gtk_snapshot_translate((GtkSnapshot*)[self castedGObject], point);
}

- (void)translate3dWithPoint:(const graphene_point3d_t*)point
{
	gtk_snapshot_translate_3d((GtkSnapshot*)[self castedGObject], point);
}


@end