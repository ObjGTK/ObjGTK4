/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGdk4/OGGdkSnapshot.h>

@class OGGskGLShader;
@class OGTKStyleContext;
@class OGPangoLayout;
@class OGGdkTexture;

/**
 * `GtkSnapshot` assists in creating [class@Gsk.RenderNode]s for widgets.
 * 
 * It functions in a similar way to a cairo context, and maintains a stack
 * of render nodes and their associated transformations.
 * 
 * The node at the top of the stack is the one that `gtk_snapshot_append_…()`
 * functions operate on. Use the `gtk_snapshot_push_…()` functions and
 * [method@Snapshot.pop] to change the current node.
 * 
 * The typical way to obtain a `GtkSnapshot` object is as an argument to
 * the [vfunc@Gtk.Widget.snapshot] vfunc. If you need to create your own
 * `GtkSnapshot`, use [ctor@Gtk.Snapshot.new].
 *
 */
@interface OGTKSnapshot : OGGdkSnapshot
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkSnapshot*)castedGObject;

/**
 * Appends a stroked border rectangle inside the given @outline.
 * 
 * The four sides of the border can have different widths and colors.
 *
 * @param outline the outline of the border
 * @param borderWidth the stroke width of the border on
 *   the top, right, bottom and left side respectively.
 * @param borderColor the color used on the top, right,
 *   bottom and left side.
 */
- (void)appendBorderWithOutline:(const GskRoundedRect*)outline borderWidth:(const float*)borderWidth borderColor:(const GdkRGBA*)borderColor;

/**
 * Creates a new [class@Gsk.CairoNode] and appends it to the current
 * render node of @snapshot, without changing the current node.
 *
 * @param bounds the bounds for the new node
 * @return a `cairo_t` suitable for drawing the contents of
 *   the newly created render node
 */
- (cairo_t*)appendCairo:(const graphene_rect_t*)bounds;

/**
 * Creates a new render node drawing the @color into the
 * given @bounds and appends it to the current render node
 * of @snapshot.
 * 
 * You should try to avoid calling this function if
 * @color is transparent.
 *
 * @param color the color to draw
 * @param bounds the bounds for the new node
 */
- (void)appendColorWithColor:(const GdkRGBA*)color bounds:(const graphene_rect_t*)bounds;

/**
 * Appends a conic gradient node with the given stops to @snapshot.
 *
 * @param bounds the rectangle to render the gradient into
 * @param center the center point of the conic gradient
 * @param rotation the clockwise rotation in degrees of the starting angle.
 *   0 means the starting angle is the top.
 * @param stops the color stops defining the gradient
 * @param nstops the number of elements in @stops
 */
- (void)appendConicGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center rotation:(float)rotation stops:(const GskColorStop*)stops nstops:(gsize)nstops;

/**
 * Appends an inset shadow into the box given by @outline.
 *
 * @param outline outline of the region surrounded by shadow
 * @param color color of the shadow
 * @param dx horizontal offset of shadow
 * @param dy vertical offset of shadow
 * @param spread how far the shadow spreads towards the inside
 * @param blurRadius how much blur to apply to the shadow
 */
- (void)appendInsetShadowWithOutline:(const GskRoundedRect*)outline color:(const GdkRGBA*)color dx:(float)dx dy:(float)dy spread:(float)spread blurRadius:(float)blurRadius;

/**
 *
 * @param layout
 * @param color
 */
- (void)appendLayoutWithLayout:(OGPangoLayout*)layout color:(const GdkRGBA*)color;

/**
 * Appends a linear gradient node with the given stops to @snapshot.
 *
 * @param bounds the rectangle to render the linear gradient into
 * @param startPoint the point at which the linear gradient will begin
 * @param endPoint the point at which the linear gradient will finish
 * @param stops the color stops defining the gradient
 * @param nstops the number of elements in @stops
 */
- (void)appendLinearGradientWithBounds:(const graphene_rect_t*)bounds startPoint:(const graphene_point_t*)startPoint endPoint:(const graphene_point_t*)endPoint stops:(const GskColorStop*)stops nstops:(gsize)nstops;

/**
 * Appends @node to the current render node of @snapshot,
 * without changing the current node.
 * 
 * If @snapshot does not have a current node yet, @node
 * will become the initial node.
 *
 * @param node a `GskRenderNode`
 */
- (void)appendNode:(GskRenderNode*)node;

/**
 * Appends an outset shadow node around the box given by @outline.
 *
 * @param outline outline of the region surrounded by shadow
 * @param color color of the shadow
 * @param dx horizontal offset of shadow
 * @param dy vertical offset of shadow
 * @param spread how far the shadow spreads towards the outside
 * @param blurRadius how much blur to apply to the shadow
 */
- (void)appendOutsetShadowWithOutline:(const GskRoundedRect*)outline color:(const GdkRGBA*)color dx:(float)dx dy:(float)dy spread:(float)spread blurRadius:(float)blurRadius;

/**
 * Appends a radial gradient node with the given stops to @snapshot.
 *
 * @param bounds the rectangle to render the readial gradient into
 * @param center the center point for the radial gradient
 * @param hradius the horizontal radius
 * @param vradius the vertical radius
 * @param start the start position (on the horizontal axis)
 * @param end the end position (on the horizontal axis)
 * @param stops the color stops defining the gradient
 * @param nstops the number of elements in @stops
 */
- (void)appendRadialGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center hradius:(float)hradius vradius:(float)vradius start:(float)start end:(float)end stops:(const GskColorStop*)stops nstops:(gsize)nstops;

/**
 * Appends a repeating linear gradient node with the given stops to @snapshot.
 *
 * @param bounds the rectangle to render the linear gradient into
 * @param startPoint the point at which the linear gradient will begin
 * @param endPoint the point at which the linear gradient will finish
 * @param stops the color stops defining the gradient
 * @param nstops the number of elements in @stops
 */
- (void)appendRepeatingLinearGradientWithBounds:(const graphene_rect_t*)bounds startPoint:(const graphene_point_t*)startPoint endPoint:(const graphene_point_t*)endPoint stops:(const GskColorStop*)stops nstops:(gsize)nstops;

/**
 * Appends a repeating radial gradient node with the given stops to @snapshot.
 *
 * @param bounds the rectangle to render the readial gradient into
 * @param center the center point for the radial gradient
 * @param hradius the horizontal radius
 * @param vradius the vertical radius
 * @param start the start position (on the horizontal axis)
 * @param end the end position (on the horizontal axis)
 * @param stops the color stops defining the gradient
 * @param nstops the number of elements in @stops
 */
- (void)appendRepeatingRadialGradientWithBounds:(const graphene_rect_t*)bounds center:(const graphene_point_t*)center hradius:(float)hradius vradius:(float)vradius start:(float)start end:(float)end stops:(const GskColorStop*)stops nstops:(gsize)nstops;

/**
 * Creates a new render node drawing the @texture
 * into the given @bounds and appends it to the
 * current render node of @snapshot.
 *
 * @param texture the texture to render
 * @param bounds the bounds for the new node
 */
- (void)appendTextureWithTexture:(OGGdkTexture*)texture bounds:(const graphene_rect_t*)bounds;

/**
 * Returns the node that was constructed by @snapshot
 * and frees @snapshot.
 *
 * @return a newly-created [class@Gsk.RenderNode]
 */
- (GskRenderNode*)freeToNode;

/**
 * Returns a paintable for the node that was
 * constructed by @snapshot and frees @snapshot.
 *
 * @param size The size of the resulting paintable
 *   or %NULL to use the bounds of the snapshot
 * @return a newly-created [iface@Gdk.Paintable]
 */
- (GdkPaintable*)freeToPaintable:(const graphene_size_t*)size;

/**
 * Removes the top element from the stack of render nodes and
 * adds it to the nearest [class@Gsk.GLShaderNode] below it.
 * 
 * This must be called the same number of times as the number
 * of textures is needed for the shader in
 * [method@Gtk.Snapshot.push_gl_shader].
 *
 */
- (void)glShaderPopTexture;

/**
 * Applies a perspective projection transform.
 * 
 * See [method@Gsk.Transform.perspective] for a discussion on the details.
 *
 * @param depth distance of the z=0 plane
 */
- (void)perspective:(float)depth;

/**
 * Removes the top element from the stack of render nodes,
 * and appends it to the node underneath it.
 *
 */
- (void)pop;

/**
 * Blends together two images with the given blend mode.
 * 
 * Until the first call to [method@Gtk.Snapshot.pop], the
 * bottom image for the blend operation will be recorded.
 * After that call, the top image to be blended will be
 * recorded until the second call to [method@Gtk.Snapshot.pop].
 * 
 * Calling this function requires two subsequent calls
 * to [method@Gtk.Snapshot.pop].
 *
 * @param blendMode blend mode to use
 */
- (void)pushBlend:(GskBlendMode)blendMode;

/**
 * Blurs an image.
 * 
 * The image is recorded until the next call to [method@Gtk.Snapshot.pop].
 *
 * @param radius the blur radius to use. Must be positive
 */
- (void)pushBlur:(double)radius;

/**
 * Clips an image to a rectangle.
 * 
 * The image is recorded until the next call to [method@Gtk.Snapshot.pop].
 *
 * @param bounds the rectangle to clip to
 */
- (void)pushClip:(const graphene_rect_t*)bounds;

/**
 * Modifies the colors of an image by applying an affine transformation
 * in RGB space.
 * 
 * The image is recorded until the next call to [method@Gtk.Snapshot.pop].
 *
 * @param colorMatrix the color matrix to use
 * @param colorOffset the color offset to use
 */
- (void)pushColorMatrixWithColorMatrix:(const graphene_matrix_t*)colorMatrix colorOffset:(const graphene_vec4_t*)colorOffset;

/**
 * Snapshots a cross-fade operation between two images with the
 * given @progress.
 * 
 * Until the first call to [method@Gtk.Snapshot.pop], the start image
 * will be snapshot. After that call, the end image will be recorded
 * until the second call to [method@Gtk.Snapshot.pop].
 * 
 * Calling this function requires two subsequent calls
 * to [method@Gtk.Snapshot.pop].
 *
 * @param progress progress between 0.0 and 1.0
 */
- (void)pushCrossFade:(double)progress;

/**
 * Push a [class@Gsk.GLShaderNode].
 * 
 * The node uses the given [class@Gsk.GLShader] and uniform values
 * Additionally this takes a list of @n_children other nodes
 * which will be passed to the [class@Gsk.GLShaderNode].
 * 
 * The @take_args argument is a block of data to use for uniform
 * arguments, as per types and offsets defined by the @shader.
 * Normally this is generated by [method@Gsk.GLShader.format_args]
 * or [struct@Gsk.ShaderArgsBuilder].
 * 
 * The snapshotter takes ownership of @take_args, so the caller should
 * not free it after this.
 * 
 * If the renderer doesn't support GL shaders, or if there is any
 * problem when compiling the shader, then the node will draw pink.
 * You should use [method@Gsk.GLShader.compile] to ensure the @shader
 * will work for the renderer before using it.
 * 
 * If the shader requires textures (see [method@Gsk.GLShader.get_n_textures]),
 * then it is expected that you call [method@Gtk.Snapshot.gl_shader_pop_texture]
 * the number of times that are required. Each of these calls will generate
 * a node that is added as a child to the `GskGLShaderNode`, which in turn
 * will render these offscreen and pass as a texture to the shader.
 * 
 * Once all textures (if any) are pop:ed, you must call the regular
 * [method@Gtk.Snapshot.pop].
 * 
 * If you want to use pre-existing textures as input to the shader rather
 * than rendering new ones, use [method@Gtk.Snapshot.append_texture] to
 * push a texture node. These will be used directly rather than being
 * re-rendered.
 * 
 * For details on how to write shaders, see [class@Gsk.GLShader].
 *
 * @param shader The code to run
 * @param bounds the rectangle to render into
 * @param takeArgs Data block with arguments for the shader.
 */
- (void)pushGlShaderWithShader:(OGGskGLShader*)shader bounds:(const graphene_rect_t*)bounds takeArgs:(GBytes*)takeArgs;

/**
 * Modifies the opacity of an image.
 * 
 * The image is recorded until the next call to [method@Gtk.Snapshot.pop].
 *
 * @param opacity the opacity to use
 */
- (void)pushOpacity:(double)opacity;

/**
 * Creates a node that repeats the child node.
 * 
 * The child is recorded until the next call to [method@Gtk.Snapshot.pop].
 *
 * @param bounds the bounds within which to repeat
 * @param childBounds the bounds of the child or %NULL
 *   to use the full size of the collected child node
 */
- (void)pushRepeatWithBounds:(const graphene_rect_t*)bounds childBounds:(const graphene_rect_t*)childBounds;

/**
 * Clips an image to a rounded rectangle.
 * 
 * The image is recorded until the next call to [method@Gtk.Snapshot.pop].
 *
 * @param bounds the rounded rectangle to clip to
 */
- (void)pushRoundedClip:(const GskRoundedRect*)bounds;

/**
 * Applies a shadow to an image.
 * 
 * The image is recorded until the next call to [method@Gtk.Snapshot.pop].
 *
 * @param shadow the first shadow specification
 * @param nshadows number of shadow specifications
 */
- (void)pushShadowWithShadow:(const GskShadow*)shadow nshadows:(gsize)nshadows;

/**
 * Creates a render node for the CSS background according to @context,
 * and appends it to the current node of @snapshot, without changing
 * the current node.
 *
 * @param context the style context that defines the background
 * @param x X origin of the rectangle
 * @param y Y origin of the rectangle
 * @param width rectangle width
 * @param height rectangle height
 */
- (void)renderBackgroundWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height;

/**
 * Creates a render node for the focus outline according to @context,
 * and appends it to the current node of @snapshot, without changing
 * the current node.
 *
 * @param context the style context that defines the focus ring
 * @param x X origin of the rectangle
 * @param y Y origin of the rectangle
 * @param width rectangle width
 * @param height rectangle height
 */
- (void)renderFocusWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height;

/**
 * Creates a render node for the CSS border according to @context,
 * and appends it to the current node of @snapshot, without changing
 * the current node.
 *
 * @param context the style context that defines the frame
 * @param x X origin of the rectangle
 * @param y Y origin of the rectangle
 * @param width rectangle width
 * @param height rectangle height
 */
- (void)renderFrameWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y width:(double)width height:(double)height;

/**
 * Draws a text caret using @snapshot at the specified index of @layout.
 *
 * @param context a `GtkStyleContext`
 * @param x X origin
 * @param y Y origin
 * @param layout the `PangoLayout` of the text
 * @param index the index in the `PangoLayout`
 * @param direction the `PangoDirection` of the text
 */
- (void)renderInsertionCursorWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y layout:(OGPangoLayout*)layout index:(int)index direction:(PangoDirection)direction;

/**
 * Creates a render node for rendering @layout according to the style
 * information in @context, and appends it to the current node of @snapshot,
 * without changing the current node.
 *
 * @param context the style context that defines the text
 * @param x X origin of the rectangle
 * @param y Y origin of the rectangle
 * @param layout the `PangoLayout` to render
 */
- (void)renderLayoutWithContext:(OGTKStyleContext*)context x:(double)x y:(double)y layout:(OGPangoLayout*)layout;

/**
 * Restores @snapshot to the state saved by a preceding call to
 * [method@Snapshot.save] and removes that state from the stack of
 * saved states.
 *
 */
- (void)restore;

/**
 * Rotates @@snapshot's coordinate system by @angle degrees in 2D space -
 * or in 3D speak, rotates around the Z axis.
 * 
 * To rotate around other axes, use [method@Gsk.Transform.rotate_3d].
 *
 * @param angle the rotation angle, in degrees (clockwise)
 */
- (void)rotate:(float)angle;

/**
 * Rotates @snapshot's coordinate system by @angle degrees around @axis.
 * 
 * For a rotation in 2D space, use [method@Gsk.Transform.rotate].
 *
 * @param angle the rotation angle, in degrees (clockwise)
 * @param axis The rotation axis
 */
- (void)rotate3dWithAngle:(float)angle axis:(const graphene_vec3_t*)axis;

/**
 * Makes a copy of the current state of @snapshot and saves it
 * on an internal stack.
 * 
 * When [method@Gtk.Snapshot.restore] is called, @snapshot will
 * be restored to the saved state. Multiple calls to
 * [method@Snapshot.save] and [class@Snapshot.restore] can be nested;
 * each call to `gtk_snapshot_restore()` restores the state from
 * the matching paired `gtk_snapshot_save()`.
 * 
 * It is necessary to clear all saved states with corresponding
 * calls to `gtk_snapshot_restore()`.
 *
 */
- (void)save;

/**
 * Scales @snapshot's coordinate system in 2-dimensional space by
 * the given factors.
 * 
 * Use [method@Gtk.Snapshot.scale_3d] to scale in all 3 dimensions.
 *
 * @param factorX scaling factor on the X axis
 * @param factorY scaling factor on the Y axis
 */
- (void)scaleWithFactorX:(float)factorX factorY:(float)factorY;

/**
 * Scales @snapshot's coordinate system by the given factors.
 *
 * @param factorX scaling factor on the X axis
 * @param factorY scaling factor on the Y axis
 * @param factorZ scaling factor on the Z axis
 */
- (void)scale3dWithFactorX:(float)factorX factorY:(float)factorY factorZ:(float)factorZ;

/**
 * Returns the render node that was constructed
 * by @snapshot.
 * 
 * After calling this function, it is no longer possible to
 * add more nodes to @snapshot. The only function that should
 * be called after this is [method@GObject.Object.unref].
 *
 * @return the constructed `GskRenderNode`
 */
- (GskRenderNode*)toNode;

/**
 * Returns a paintable encapsulating the render node
 * that was constructed by @snapshot.
 * 
 * After calling this function, it is no longer possible to
 * add more nodes to @snapshot. The only function that should
 * be called after this is [method@GObject.Object.unref].
 *
 * @param size The size of the resulting paintable
 *   or %NULL to use the bounds of the snapshot
 * @return a new `GdkPaintable`
 */
- (GdkPaintable*)toPaintable:(const graphene_size_t*)size;

/**
 * Transforms @snapshot's coordinate system with the given @transform.
 *
 * @param transform the transform to apply
 */
- (void)transform:(GskTransform*)transform;

/**
 * Transforms @snapshot's coordinate system with the given @matrix.
 *
 * @param matrix the matrix to multiply the transform with
 */
- (void)transformMatrix:(const graphene_matrix_t*)matrix;

/**
 * Translates @snapshot's coordinate system by @point in 2-dimensional space.
 *
 * @param point the point to translate the snapshot by
 */
- (void)translate:(const graphene_point_t*)point;

/**
 * Translates @snapshot's coordinate system by @point.
 *
 * @param point the point to translate the snapshot by
 */
- (void)translate3d:(const graphene_point3d_t*)point;

@end