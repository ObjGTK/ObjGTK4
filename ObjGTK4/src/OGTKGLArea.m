/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGLArea.h"

#import <OGdk4/OGdkGLContext.h>

@implementation OGTKGLArea

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GL_AREA;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gLArea
{
	GtkGLArea* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gl_area_new(), GtkGLArea, GtkGLArea);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKGLArea* wrapperObject;
	@try {
		wrapperObject = [[OGTKGLArea alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGLArea*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGLArea, GtkGLArea);
}

- (void)attachBuffers
{
	gtk_gl_area_attach_buffers([self castedGObject]);
}

- (GdkGLAPI)allowedApis
{
	GdkGLAPI returnValue = (GdkGLAPI)gtk_gl_area_get_allowed_apis([self castedGObject]);

	return returnValue;
}

- (GdkGLAPI)api
{
	GdkGLAPI returnValue = (GdkGLAPI)gtk_gl_area_get_api([self castedGObject]);

	return returnValue;
}

- (bool)autoRender
{
	bool returnValue = (bool)gtk_gl_area_get_auto_render([self castedGObject]);

	return returnValue;
}

- (OGdkGLContext*)context
{
	GdkGLContext* gobjectValue = gtk_gl_area_get_context([self castedGObject]);

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GError*)error
{
	GError* returnValue = (GError*)gtk_gl_area_get_error([self castedGObject]);

	return returnValue;
}

- (bool)hasDepthBuffer
{
	bool returnValue = (bool)gtk_gl_area_get_has_depth_buffer([self castedGObject]);

	return returnValue;
}

- (bool)hasStencilBuffer
{
	bool returnValue = (bool)gtk_gl_area_get_has_stencil_buffer([self castedGObject]);

	return returnValue;
}

- (void)requiredVersionWithMajor:(int*)major minor:(int*)minor
{
	gtk_gl_area_get_required_version([self castedGObject], major, minor);
}

- (bool)useEs
{
	bool returnValue = (bool)gtk_gl_area_get_use_es([self castedGObject]);

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

- (void)setAllowedApis:(GdkGLAPI)apis
{
	gtk_gl_area_set_allowed_apis([self castedGObject], apis);
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