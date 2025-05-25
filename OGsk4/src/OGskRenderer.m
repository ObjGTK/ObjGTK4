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

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GSK_TYPE_RENDERER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GSK_TYPE_RENDERER);
	return gObjectClass;
}

+ (instancetype)rendererForSurface:(OGdkSurface*)surface
{
	GskRenderer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gsk_renderer_new_for_surface([surface castedGObject]), GSK_TYPE_RENDERER, GskRenderer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGskRenderer* wrapperObject;
	@try {
		wrapperObject = [[OGskRenderer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GskRenderer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GSK_TYPE_RENDERER, GskRenderer);
}

- (OGdkSurface*)surface
{
	GdkSurface* gobjectValue = gsk_renderer_get_surface((GskRenderer*)[self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)isRealized
{
	bool returnValue = (bool)gsk_renderer_is_realized((GskRenderer*)[self castedGObject]);

	return returnValue;
}

- (bool)realizeWithSurface:(OGdkSurface*)surface
{
	GError* err = NULL;

	bool returnValue = (bool)gsk_renderer_realize((GskRenderer*)[self castedGObject], [surface castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)realizeForDisplay:(OGdkDisplay*)display
{
	GError* err = NULL;

	bool returnValue = (bool)gsk_renderer_realize_for_display((GskRenderer*)[self castedGObject], [display castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)renderWithRoot:(GskRenderNode*)root region:(const cairo_region_t*)region
{
	gsk_renderer_render((GskRenderer*)[self castedGObject], root, region);
}

- (OGdkTexture*)renderTextureWithRoot:(GskRenderNode*)root viewport:(const graphene_rect_t*)viewport
{
	GdkTexture* gobjectValue = gsk_renderer_render_texture((GskRenderer*)[self castedGObject], root, viewport);

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)unrealize
{
	gsk_renderer_unrealize((GskRenderer*)[self castedGObject]);
}


@end