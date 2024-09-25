/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGskRenderer.h"

#import <OGdk4/OGGdkDisplay.h>
#import <OGdk4/OGGdkSurface.h>
#import <OGdk4/OGGdkTexture.h>

@implementation OGGskRenderer

- (instancetype)initForSurface:(OGGdkSurface*)surface
{
	GskRenderer* gobjectValue = GSK_RENDERER(gsk_renderer_new_for_surface([surface castedGObject]));

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
	return GSK_RENDERER([self gObject]);
}

- (OGGdkSurface*)surface
{
	GdkSurface* gobjectValue = GDK_SURFACE(gsk_renderer_get_surface([self castedGObject]));

	OGGdkSurface* returnValue = [OGGdkSurface withGObject:gobjectValue];
	return returnValue;
}

- (bool)isRealized
{
	bool returnValue = gsk_renderer_is_realized([self castedGObject]);

	return returnValue;
}

- (bool)realize:(OGGdkSurface*)surface
{
	GError* err = NULL;

	bool returnValue = gsk_renderer_realize([self castedGObject], [surface castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)realizeForDisplay:(OGGdkDisplay*)display
{
	GError* err = NULL;

	bool returnValue = gsk_renderer_realize_for_display([self castedGObject], [display castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)renderWithRoot:(GskRenderNode*)root region:(const cairo_region_t*)region
{
	gsk_renderer_render([self castedGObject], root, region);
}

- (OGGdkTexture*)renderTextureWithRoot:(GskRenderNode*)root viewport:(const graphene_rect_t*)viewport
{
	GdkTexture* gobjectValue = GDK_TEXTURE(gsk_renderer_render_texture([self castedGObject], root, viewport));

	OGGdkTexture* returnValue = [OGGdkTexture withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)unrealize
{
	gsk_renderer_unrealize([self castedGObject]);
}


@end