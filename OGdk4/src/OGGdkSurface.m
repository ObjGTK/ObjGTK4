/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkSurface.h"

#import "OGGdkFrameClock.h"
#import "OGGdkDisplay.h"
#import "OGGdkDevice.h"
#import "OGGdkCairoContext.h"
#import "OGGdkVulkanContext.h"
#import "OGGdkGLContext.h"
#import "OGGdkCursor.h"

@implementation OGGdkSurface

- (instancetype)initPopupWithParent:(OGGdkSurface*)parent autohide:(bool)autohide
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_surface_new_popup([parent castedGObject], autohide));

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

- (instancetype)initToplevel:(OGGdkDisplay*)display
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_surface_new_toplevel([display castedGObject]));

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

- (GdkSurface*)castedGObject
{
	return GDK_SURFACE([self gObject]);
}

- (void)beep
{
	gdk_surface_beep([self castedGObject]);
}

- (OGGdkCairoContext*)createCairoContext
{
	GdkCairoContext* gobjectValue = GDK_CAIRO_CONTEXT(gdk_surface_create_cairo_context([self castedGObject]));

	OGGdkCairoContext* returnValue = [OGGdkCairoContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGGdkGLContext*)createGlContext
{
	GError* err = NULL;

	GdkGLContext* gobjectValue = GDK_GL_CONTEXT(gdk_surface_create_gl_context([self castedGObject], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGGdkGLContext* returnValue = [OGGdkGLContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (cairo_surface_t*)createSimilarSurfaceWithContent:(cairo_content_t)content width:(int)width height:(int)height
{
	cairo_surface_t* returnValue = gdk_surface_create_similar_surface([self castedGObject], content, width, height);

	return returnValue;
}

- (OGGdkVulkanContext*)createVulkanContext
{
	GError* err = NULL;

	GdkVulkanContext* gobjectValue = GDK_VULKAN_CONTEXT(gdk_surface_create_vulkan_context([self castedGObject], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGGdkVulkanContext* returnValue = [OGGdkVulkanContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)destroy
{
	gdk_surface_destroy([self castedGObject]);
}

- (OGGdkCursor*)cursor
{
	GdkCursor* gobjectValue = GDK_CURSOR(gdk_surface_get_cursor([self castedGObject]));

	OGGdkCursor* returnValue = [OGGdkCursor withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkCursor*)deviceCursor:(OGGdkDevice*)device
{
	GdkCursor* gobjectValue = GDK_CURSOR(gdk_surface_get_device_cursor([self castedGObject], [device castedGObject]));

	OGGdkCursor* returnValue = [OGGdkCursor withGObject:gobjectValue];
	return returnValue;
}

- (bool)devicePositionWithDevice:(OGGdkDevice*)device x:(double*)x y:(double*)y mask:(GdkModifierType*)mask
{
	bool returnValue = gdk_surface_get_device_position([self castedGObject], [device castedGObject], x, y, mask);

	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_surface_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkFrameClock*)frameClock
{
	GdkFrameClock* gobjectValue = GDK_FRAME_CLOCK(gdk_surface_get_frame_clock([self castedGObject]));

	OGGdkFrameClock* returnValue = [OGGdkFrameClock withGObject:gobjectValue];
	return returnValue;
}

- (int)height
{
	int returnValue = gdk_surface_get_height([self castedGObject]);

	return returnValue;
}

- (bool)mapped
{
	bool returnValue = gdk_surface_get_mapped([self castedGObject]);

	return returnValue;
}

- (double)scale
{
	double returnValue = gdk_surface_get_scale([self castedGObject]);

	return returnValue;
}

- (int)scaleFactor
{
	int returnValue = gdk_surface_get_scale_factor([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = gdk_surface_get_width([self castedGObject]);

	return returnValue;
}

- (void)hide
{
	gdk_surface_hide([self castedGObject]);
}

- (bool)isDestroyed
{
	bool returnValue = gdk_surface_is_destroyed([self castedGObject]);

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

- (void)setCursor:(OGGdkCursor*)cursor
{
	gdk_surface_set_cursor([self castedGObject], [cursor castedGObject]);
}

- (void)setDeviceCursorWithDevice:(OGGdkDevice*)device cursor:(OGGdkCursor*)cursor
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

- (bool)translateCoordinatesWithTo:(OGGdkSurface*)to x:(double*)x y:(double*)y
{
	bool returnValue = gdk_surface_translate_coordinates([self castedGObject], [to castedGObject], x, y);

	return returnValue;
}


@end