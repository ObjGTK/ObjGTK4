/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkGLTexture.h"

#import "OGGdkGLContext.h"

@implementation OGGdkGLTexture

- (instancetype)initWithContext:(OGGdkGLContext*)context id:(guint)id width:(int)width height:(int)height destroy:(GDestroyNotify)destroy data:(gpointer)data
{
	GdkGLTexture* gobjectValue = GDK_GL_TEXTURE(gdk_gl_texture_new([context castedGObject], id, width, height, destroy, data));

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

- (GdkGLTexture*)castedGObject
{
	return GDK_GL_TEXTURE([self gObject]);
}

- (void)release
{
	gdk_gl_texture_release([self castedGObject]);
}


@end