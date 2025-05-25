/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gsk/gsk.h>

#import <OGObject/OGObject.h>

@class OGdkDisplay;
@class OGdkSurface;
@class OGdkTexture;

/**
 * `GskRenderer` is a class that renders a scene graph defined via a
 * tree of [class@Gsk.RenderNode] instances.
 * 
 * Typically you will use a `GskRenderer` instance to repeatedly call
 * [method@Gsk.Renderer.render] to update the contents of its associated
 * [class@Gdk.Surface].
 * 
 * It is necessary to realize a `GskRenderer` instance using
 * [method@Gsk.Renderer.realize] before calling [method@Gsk.Renderer.render],
 * in order to create the appropriate windowing system resources needed
 * to render the scene.
 *
 */
@interface OGskRenderer : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)rendererForSurface:(OGdkSurface*)surface;

/**
 * Methods
 */

- (GskRenderer*)castedGObject;

/**
 * Retrieves the `GdkSurface` set using gsk_enderer_realize().
 * 
 * If the renderer has not been realized yet, %NULL will be returned.
 *
 * @return a `GdkSurface`
 */
- (OGdkSurface*)surface;

/**
 * Checks whether the @renderer is realized or not.
 *
 * @return %TRUE if the `GskRenderer` was realized, and %FALSE otherwise
 */
- (bool)isRealized;

/**
 * Creates the resources needed by the @renderer to render the scene
 * graph.
 * 
 * Since GTK 4.6, the surface may be `NULL`, which allows using
 * renderers without having to create a surface.
 * Since GTK 4.14, it is recommended to use [method@Gsk.Renderer.realize_for_display]
 * instead.
 * 
 * Note that it is mandatory to call [method@Gsk.Renderer.unrealize] before
 * destroying the renderer.
 *
 * @param surface the `GdkSurface` renderer will be used on
 * @return Whether the renderer was successfully realized
 */
- (bool)realizeWithSurface:(OGdkSurface*)surface;

/**
 * Creates the resources needed by the @renderer to render the scene
 * graph.
 * 
 * Note that it is mandatory to call [method@Gsk.Renderer.unrealize] before
 * destroying the renderer.
 *
 * @param display the `GdkDisplay` renderer will be used on
 * @return Whether the renderer was successfully realized
 */
- (bool)realizeForDisplay:(OGdkDisplay*)display;

/**
 * Renders the scene graph, described by a tree of `GskRenderNode` instances
 * to the renderer's surface,  ensuring that the given @region gets redrawn.
 * 
 * If the renderer has no associated surface, this function does nothing.
 * 
 * Renderers must ensure that changes of the contents given by the @root
 * node as well as the area given by @region are redrawn. They are however
 * free to not redraw any pixel outside of @region if they can guarantee that
 * it didn't change.
 * 
 * The @renderer will acquire a reference on the `GskRenderNode` tree while
 * the rendering is in progress.
 *
 * @param root a `GskRenderNode`
 * @param region the `cairo_region_t` that must be redrawn or %NULL
 *   for the whole window
 */
- (void)renderWithRoot:(GskRenderNode*)root region:(const cairo_region_t*)region;

/**
 * Renders the scene graph, described by a tree of `GskRenderNode` instances,
 * to a `GdkTexture`.
 * 
 * The @renderer will acquire a reference on the `GskRenderNode` tree while
 * the rendering is in progress.
 * 
 * If you want to apply any transformations to @root, you should put it into a
 * transform node and pass that node instead.
 *
 * @param root a `GskRenderNode`
 * @param viewport the section to draw or %NULL to use @root's bounds
 * @return a `GdkTexture` with the rendered contents of @root.
 */
- (OGdkTexture*)renderTextureWithRoot:(GskRenderNode*)root viewport:(const graphene_rect_t*)viewport;

/**
 * Releases all the resources created by gsk_renderer_realize().
 *
 */
- (void)unrealize;

@end