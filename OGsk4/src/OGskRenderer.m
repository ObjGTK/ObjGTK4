/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGskRenderer.h"

#import <OGdk4/OGdkDisplay.h>
#import <OGdk4/OGdkSurface.h>
#import <OGdk4/OGdkTexture.h>

@implementation OGskRenderer

+ (void)load
{
	GType gtypeToAssociate = GSK_TYPE_RENDERER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithSurfaceForSurface:(OGdkSurface*)surface
{
	GskRenderer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gsk_renderer_new_for_surface([surface castedGObject]), GskRenderer, GskRenderer);

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

- (GskRenderer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GskRenderer, GskRenderer);
}

- (OGdkSurface*)surface
{
	GdkSurface* gobjectValue = gsk_renderer_get_surface([self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)isRealized
{
	bool returnValue = (bool)gsk_renderer_is_realized([self castedGObject]);

	return returnValue;
}

- (bool)realize:(OGdkSurface*)surface
{
	GError* err = NULL;

	bool returnValue = (bool)gsk_renderer_realize([self castedGObject], [surface castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)realizeForDisplay:(OGdkDisplay*)display
{
	GError* err = NULL;

	bool returnValue = (bool)gsk_renderer_realize_for_display([self castedGObject], [display castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)renderWithRoot:(GskRenderNode*)root region:(const cairo_region_t*)region
{
	gsk_renderer_render([self castedGObject], root, region);
}

- (OGdkTexture*)renderTextureWithRoot:(GskRenderNode*)root viewport:(const graphene_rect_t*)viewport
{
	GdkTexture* gobjectValue = gsk_renderer_render_texture([self castedGObject], root, viewport);

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)unrealize
{
	gsk_renderer_unrealize([self castedGObject]);
}


@end