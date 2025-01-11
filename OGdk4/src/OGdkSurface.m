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

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_SURFACE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)surfacePopupWithParent:(OGdkSurface*)parent autohide:(bool)autohide
{
	GdkSurface* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_surface_new_popup([parent castedGObject], autohide), GdkSurface, GdkSurface);

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

+ (instancetype)surfaceToplevel:(OGdkDisplay*)display
{
	GdkSurface* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_surface_new_toplevel([display castedGObject]), GdkSurface, GdkSurface);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkSurface, GdkSurface);
}

- (void)beep
{
	gdk_surface_beep([self castedGObject]);
}

- (OGdkCairoContext*)createCairoContext
{
	GdkCairoContext* gobjectValue = gdk_surface_create_cairo_context([self castedGObject]);

	OGdkCairoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkGLContext*)createGlContext
{
	GError* err = NULL;

	GdkGLContext* gobjectValue = gdk_surface_create_gl_context([self castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (cairo_surface_t*)createSimilarSurfaceWithContent:(cairo_content_t)content width:(int)width height:(int)height
{
	cairo_surface_t* returnValue = (cairo_surface_t*)gdk_surface_create_similar_surface([self castedGObject], content, width, height);

	return returnValue;
}

- (OGdkVulkanContext*)createVulkanContext
{
	GError* err = NULL;

	GdkVulkanContext* gobjectValue = gdk_surface_create_vulkan_context([self castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkVulkanContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)destroy
{
	gdk_surface_destroy([self castedGObject]);
}

- (OGdkCursor*)cursor
{
	GdkCursor* gobjectValue = gdk_surface_get_cursor([self castedGObject]);

	OGdkCursor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkCursor*)deviceCursor:(OGdkDevice*)device
{
	GdkCursor* gobjectValue = gdk_surface_get_device_cursor([self castedGObject], [device castedGObject]);

	OGdkCursor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)devicePositionWithDevice:(OGdkDevice*)device x:(double*)x y:(double*)y mask:(GdkModifierType*)mask
{
	bool returnValue = (bool)gdk_surface_get_device_position([self castedGObject], [device castedGObject], x, y, mask);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_surface_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkFrameClock*)frameClock
{
	GdkFrameClock* gobjectValue = gdk_surface_get_frame_clock([self castedGObject]);

	OGdkFrameClock* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)height
{
	int returnValue = (int)gdk_surface_get_height([self castedGObject]);

	return returnValue;
}

- (bool)mapped
{
	bool returnValue = (bool)gdk_surface_get_mapped([self castedGObject]);

	return returnValue;
}

- (double)scale
{
	double returnValue = (double)gdk_surface_get_scale([self castedGObject]);

	return returnValue;
}

- (int)scaleFactor
{
	int returnValue = (int)gdk_surface_get_scale_factor([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)gdk_surface_get_width([self castedGObject]);

	return returnValue;
}

- (void)hide
{
	gdk_surface_hide([self castedGObject]);
}

- (bool)isDestroyed
{
	bool returnValue = (bool)gdk_surface_is_destroyed([self castedGObject]);

	return returnValue;
}

- (void)queueRender
{
	gdk_surface_queue_render([self castedGObject]);
}

- (void)requestLayout
{
	gdk_surface_request_layout([self castedGObject]);
}

- (void)setCursor:(OGdkCursor*)cursor
{
	gdk_surface_set_cursor([self castedGObject], [cursor castedGObject]);
}

- (void)setDeviceCursorWithDevice:(OGdkDevice*)device cursor:(OGdkCursor*)cursor
{
	gdk_surface_set_device_cursor([self castedGObject], [device castedGObject], [cursor castedGObject]);
}

- (void)setInputRegion:(cairo_region_t*)region
{
	gdk_surface_set_input_region([self castedGObject], region);
}

- (void)setOpaqueRegion:(cairo_region_t*)region
{
	gdk_surface_set_opaque_region([self castedGObject], region);
}

- (bool)translateCoordinatesWithTo:(OGdkSurface*)to x:(double*)x y:(double*)y
{
	bool returnValue = (bool)gdk_surface_translate_coordinates([self castedGObject], [to castedGObject], x, y);

	return returnValue;
}


@end