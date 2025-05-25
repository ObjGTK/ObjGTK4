/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkSurface.h"

#import "OGdkCairoContext.h"
#import "OGdkCursor.h"
#import "OGdkDevice.h"
#import "OGdkDisplay.h"
#import "OGdkFrameClock.h"
#import "OGdkGLContext.h"
#import "OGdkVulkanContext.h"

@implementation OGdkSurface

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_SURFACE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_SURFACE);
	return gObjectClass;
}

+ (instancetype)surfacePopupWithParent:(OGdkSurface*)parent autohide:(bool)autohide
{
	GdkSurface* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_surface_new_popup([parent castedGObject], autohide), GDK_TYPE_SURFACE, GdkSurface);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkSurface* wrapperObject;
	@try {
		wrapperObject = [[OGdkSurface alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)surfaceToplevelWithDisplay:(OGdkDisplay*)display
{
	GdkSurface* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_surface_new_toplevel([display castedGObject]), GDK_TYPE_SURFACE, GdkSurface);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkSurface* wrapperObject;
	@try {
		wrapperObject = [[OGdkSurface alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkSurface*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_SURFACE, GdkSurface);
}

- (void)beep
{
	gdk_surface_beep((GdkSurface*)[self castedGObject]);
}

- (OGdkCairoContext*)createCairoContext
{
	GdkCairoContext* gobjectValue = gdk_surface_create_cairo_context((GdkSurface*)[self castedGObject]);

	OGdkCairoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkGLContext*)createGlContext
{
	GError* err = NULL;

	GdkGLContext* gobjectValue = gdk_surface_create_gl_context((GdkSurface*)[self castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (cairo_surface_t*)createSimilarSurfaceWithContent:(cairo_content_t)content width:(int)width height:(int)height
{
	cairo_surface_t* returnValue = (cairo_surface_t*)gdk_surface_create_similar_surface((GdkSurface*)[self castedGObject], content, width, height);

	return returnValue;
}

- (OGdkVulkanContext*)createVulkanContext
{
	GError* err = NULL;

	GdkVulkanContext* gobjectValue = gdk_surface_create_vulkan_context((GdkSurface*)[self castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkVulkanContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)destroy
{
	gdk_surface_destroy((GdkSurface*)[self castedGObject]);
}

- (OGdkCursor*)cursor
{
	GdkCursor* gobjectValue = gdk_surface_get_cursor((GdkSurface*)[self castedGObject]);

	OGdkCursor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkCursor*)deviceCursorWithDevice:(OGdkDevice*)device
{
	GdkCursor* gobjectValue = gdk_surface_get_device_cursor((GdkSurface*)[self castedGObject], [device castedGObject]);

	OGdkCursor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)devicePositionWithDevice:(OGdkDevice*)device x:(double*)x y:(double*)y mask:(GdkModifierType*)mask
{
	bool returnValue = (bool)gdk_surface_get_device_position((GdkSurface*)[self castedGObject], [device castedGObject], x, y, mask);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_surface_get_display((GdkSurface*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkFrameClock*)frameClock
{
	GdkFrameClock* gobjectValue = gdk_surface_get_frame_clock((GdkSurface*)[self castedGObject]);

	OGdkFrameClock* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)height
{
	int returnValue = (int)gdk_surface_get_height((GdkSurface*)[self castedGObject]);

	return returnValue;
}

- (bool)mapped
{
	bool returnValue = (bool)gdk_surface_get_mapped((GdkSurface*)[self castedGObject]);

	return returnValue;
}

- (double)scale
{
	double returnValue = (double)gdk_surface_get_scale((GdkSurface*)[self castedGObject]);

	return returnValue;
}

- (int)scaleFactor
{
	int returnValue = (int)gdk_surface_get_scale_factor((GdkSurface*)[self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)gdk_surface_get_width((GdkSurface*)[self castedGObject]);

	return returnValue;
}

- (void)hide
{
	gdk_surface_hide((GdkSurface*)[self castedGObject]);
}

- (bool)isDestroyed
{
	bool returnValue = (bool)gdk_surface_is_destroyed((GdkSurface*)[self castedGObject]);

	return returnValue;
}

- (void)queueRender
{
	gdk_surface_queue_render((GdkSurface*)[self castedGObject]);
}

- (void)requestLayout
{
	gdk_surface_request_layout((GdkSurface*)[self castedGObject]);
}

- (void)setCursor:(OGdkCursor*)cursor
{
	gdk_surface_set_cursor((GdkSurface*)[self castedGObject], [cursor castedGObject]);
}

- (void)setDeviceCursor:(OGdkDevice*)device cursor:(OGdkCursor*)cursor
{
	gdk_surface_set_device_cursor((GdkSurface*)[self castedGObject], [device castedGObject], [cursor castedGObject]);
}

- (void)setInputRegion:(cairo_region_t*)region
{
	gdk_surface_set_input_region((GdkSurface*)[self castedGObject], region);
}

- (void)setOpaqueRegion:(cairo_region_t*)region
{
	gdk_surface_set_opaque_region((GdkSurface*)[self castedGObject], region);
}

- (bool)translateCoordinatesWithTo:(OGdkSurface*)to x:(double*)x y:(double*)y
{
	bool returnValue = (bool)gdk_surface_translate_coordinates((GdkSurface*)[self castedGObject], [to castedGObject], x, y);

	return returnValue;
}


@end