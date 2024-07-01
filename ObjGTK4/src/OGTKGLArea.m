/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGLArea.h"

#import <OGdk4/OGGdkGLContext.h>

@implementation OGTKGLArea

- (instancetype)init
{
	GtkGLArea* gobjectValue = GTK_GL_AREA(gtk_gl_area_new());

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

- (GtkGLArea*)castedGObject
{
	return GTK_GL_AREA([self gObject]);
}

- (void)attachBuffers
{
	gtk_gl_area_attach_buffers([self castedGObject]);
}

- (bool)autoRender
{
	bool returnValue = gtk_gl_area_get_auto_render([self castedGObject]);

	return returnValue;
}

- (OGGdkGLContext*)context
{
	GdkGLContext* gobjectValue = GDK_GL_CONTEXT(gtk_gl_area_get_context([self castedGObject]));

	OGGdkGLContext* returnValue = [OGGdkGLContext withGObject:gobjectValue];
	return returnValue;
}

- (GError*)error
{
	GError* returnValue = gtk_gl_area_get_error([self castedGObject]);

	return returnValue;
}

- (bool)hasDepthBuffer
{
	bool returnValue = gtk_gl_area_get_has_depth_buffer([self castedGObject]);

	return returnValue;
}

- (bool)hasStencilBuffer
{
	bool returnValue = gtk_gl_area_get_has_stencil_buffer([self castedGObject]);

	return returnValue;
}

- (void)requiredVersionWithMajor:(int*)major minor:(int*)minor
{
	gtk_gl_area_get_required_version([self castedGObject], major, minor);
}

- (bool)useEs
{
	bool returnValue = gtk_gl_area_get_use_es([self castedGObject]);

	return returnValue;
}

- (void)makeCurrent
{
	gtk_gl_area_make_current([self castedGObject]);
}

- (void)queueRender
{
	gtk_gl_area_queue_render([self castedGObject]);
}

- (void)setAutoRender:(bool)autoRender
{
	gtk_gl_area_set_auto_render([self castedGObject], autoRender);
}

- (void)setError:(const GError*)error
{
	gtk_gl_area_set_error([self castedGObject], error);
}

- (void)setHasDepthBuffer:(bool)hasDepthBuffer
{
	gtk_gl_area_set_has_depth_buffer([self castedGObject], hasDepthBuffer);
}

- (void)setHasStencilBuffer:(bool)hasStencilBuffer
{
	gtk_gl_area_set_has_stencil_buffer([self castedGObject], hasStencilBuffer);
}

- (void)setRequiredVersionWithMajor:(int)major minor:(int)minor
{
	gtk_gl_area_set_required_version([self castedGObject], major, minor);
}

- (void)setUseEs:(bool)useEs
{
	gtk_gl_area_set_use_es([self castedGObject], useEs);
}


@end