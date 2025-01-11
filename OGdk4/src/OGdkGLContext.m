/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkGLContext.h"

#import "OGdkDisplay.h"
#import "OGdkSurface.h"

@implementation OGdkGLContext

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_GL_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (void)clearCurrent
{
	gdk_gl_context_clear_current();
}

+ (OGdkGLContext*)current
{
	GdkGLContext* gobjectValue = gdk_gl_context_get_current();

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkGLContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkGLContext, GdkGLContext);
}

- (GdkGLAPI)allowedApis
{
	GdkGLAPI returnValue = (GdkGLAPI)gdk_gl_context_get_allowed_apis([self castedGObject]);

	return returnValue;
}

- (GdkGLAPI)api
{
	GdkGLAPI returnValue = (GdkGLAPI)gdk_gl_context_get_api([self castedGObject]);

	return returnValue;
}

- (bool)debugEnabled
{
	bool returnValue = (bool)gdk_gl_context_get_debug_enabled([self castedGObject]);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_gl_context_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)forwardCompatible
{
	bool returnValue = (bool)gdk_gl_context_get_forward_compatible([self castedGObject]);

	return returnValue;
}

- (void)requiredVersionWithMajor:(int*)major minor:(int*)minor
{
	gdk_gl_context_get_required_version([self castedGObject], major, minor);
}

- (OGdkGLContext*)sharedContext
{
	GdkGLContext* gobjectValue = gdk_gl_context_get_shared_context([self castedGObject]);

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkSurface*)surface
{
	GdkSurface* gobjectValue = gdk_gl_context_get_surface([self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)useEs
{
	bool returnValue = (bool)gdk_gl_context_get_use_es([self castedGObject]);

	return returnValue;
}

- (void)versionWithMajor:(int*)major minor:(int*)minor
{
	gdk_gl_context_get_version([self castedGObject], major, minor);
}

- (bool)isLegacy
{
	bool returnValue = (bool)gdk_gl_context_is_legacy([self castedGObject]);

	return returnValue;
}

- (bool)isShared:(OGdkGLContext*)other
{
	bool returnValue = (bool)gdk_gl_context_is_shared([self castedGObject], [other castedGObject]);

	return returnValue;
}

- (void)makeCurrent
{
	gdk_gl_context_make_current([self castedGObject]);
}

- (bool)realize
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_gl_context_realize([self castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setAllowedApis:(GdkGLAPI)apis
{
	gdk_gl_context_set_allowed_apis([self castedGObject], apis);
}

- (void)setDebugEnabled:(bool)enabled
{
	gdk_gl_context_set_debug_enabled([self castedGObject], enabled);
}

- (void)setForwardCompatible:(bool)compatible
{
	gdk_gl_context_set_forward_compatible([self castedGObject], compatible);
}

- (void)setRequiredVersionWithMajor:(int)major minor:(int)minor
{
	gdk_gl_context_set_required_version([self castedGObject], major, minor);
}

- (void)setUseEs:(int)useEs
{
	gdk_gl_context_set_use_es([self castedGObject], useEs);
}


@end