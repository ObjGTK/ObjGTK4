/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkGLContext.h"

#import "OGGdkDisplay.h"
#import "OGGdkSurface.h"

@implementation OGGdkGLContext

+ (void)clearCurrent
{
	gdk_gl_context_clear_current();
}

+ (OGGdkGLContext*)current
{
	GdkGLContext* gobjectValue = GDK_GL_CONTEXT(gdk_gl_context_get_current());

	OGGdkGLContext* returnValue = [OGGdkGLContext withGObject:gobjectValue];
	return returnValue;
}

- (GdkGLContext*)castedGObject
{
	return GDK_GL_CONTEXT([self gObject]);
}

- (GdkGLAPI)allowedApis
{
	GdkGLAPI returnValue = gdk_gl_context_get_allowed_apis([self castedGObject]);

	return returnValue;
}

- (GdkGLAPI)api
{
	GdkGLAPI returnValue = gdk_gl_context_get_api([self castedGObject]);

	return returnValue;
}

- (bool)debugEnabled
{
	bool returnValue = gdk_gl_context_get_debug_enabled([self castedGObject]);

	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_gl_context_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (bool)forwardCompatible
{
	bool returnValue = gdk_gl_context_get_forward_compatible([self castedGObject]);

	return returnValue;
}

- (void)requiredVersionWithMajor:(int*)major minor:(int*)minor
{
	gdk_gl_context_get_required_version([self castedGObject], major, minor);
}

- (OGGdkGLContext*)sharedContext
{
	GdkGLContext* gobjectValue = GDK_GL_CONTEXT(gdk_gl_context_get_shared_context([self castedGObject]));

	OGGdkGLContext* returnValue = [OGGdkGLContext withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkSurface*)surface
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_gl_context_get_surface([self castedGObject]));

	OGGdkSurface* returnValue = [OGGdkSurface withGObject:gobjectValue];
	return returnValue;
}

- (bool)useEs
{
	bool returnValue = gdk_gl_context_get_use_es([self castedGObject]);

	return returnValue;
}

- (void)versionWithMajor:(int*)major minor:(int*)minor
{
	gdk_gl_context_get_version([self castedGObject], major, minor);
}

- (bool)isLegacy
{
	bool returnValue = gdk_gl_context_is_legacy([self castedGObject]);

	return returnValue;
}

- (bool)isShared:(OGGdkGLContext*)other
{
	bool returnValue = gdk_gl_context_is_shared([self castedGObject], [other castedGObject]);

	return returnValue;
}

- (void)makeCurrent
{
	gdk_gl_context_make_current([self castedGObject]);
}

- (bool)realize
{
	GError* err = NULL;

	bool returnValue = gdk_gl_context_realize([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

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