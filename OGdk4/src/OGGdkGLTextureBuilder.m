/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkGLTextureBuilder.h"

#import "OGGdkGLContext.h"
#import "OGGdkTexture.h"

@implementation OGGdkGLTextureBuilder

- (instancetype)init
{
	GdkGLTextureBuilder* gobjectValue = GDK_GL_TEXTURE_BUILDER(gdk_gl_texture_builder_new());

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

- (GdkGLTextureBuilder*)castedGObject
{
	return GDK_GL_TEXTURE_BUILDER([self gObject]);
}

- (OGGdkTexture*)buildWithDestroy:(GDestroyNotify)destroy data:(gpointer)data
{
	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_gl_texture_builder_build([self castedGObject], destroy, data));

	OGGdkTexture* returnValue = [OGGdkTexture withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGGdkGLContext*)context
{
	GdkGLContext* gobjectValue = GDK_GL_CONTEXT(gdk_gl_texture_builder_get_context([self castedGObject]));

	OGGdkGLContext* returnValue = [OGGdkGLContext withGObject:gobjectValue];
	return returnValue;
}

- (GdkMemoryFormat)format
{
	GdkMemoryFormat returnValue = gdk_gl_texture_builder_get_format([self castedGObject]);

	return returnValue;
}

- (bool)hasMipmap
{
	bool returnValue = gdk_gl_texture_builder_get_has_mipmap([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = gdk_gl_texture_builder_get_height([self castedGObject]);

	return returnValue;
}

- (guint)id
{
	guint returnValue = gdk_gl_texture_builder_get_id([self castedGObject]);

	return returnValue;
}

- (gpointer)sync
{
	gpointer returnValue = gdk_gl_texture_builder_get_sync([self castedGObject]);

	return returnValue;
}

- (cairo_region_t*)updateRegion
{
	cairo_region_t* returnValue = gdk_gl_texture_builder_get_update_region([self castedGObject]);

	return returnValue;
}

- (OGGdkTexture*)updateTexture
{
	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_gl_texture_builder_get_update_texture([self castedGObject]));

	OGGdkTexture* returnValue = [OGGdkTexture withGObject:gobjectValue];
	return returnValue;
}

- (int)width
{
	int returnValue = gdk_gl_texture_builder_get_width([self castedGObject]);

	return returnValue;
}

- (void)setContext:(OGGdkGLContext*)context
{
	gdk_gl_texture_builder_set_context([self castedGObject], [context castedGObject]);
}

- (void)setFormat:(GdkMemoryFormat)format
{
	gdk_gl_texture_builder_set_format([self castedGObject], format);
}

- (void)setHasMipmap:(bool)hasMipmap
{
	gdk_gl_texture_builder_set_has_mipmap([self castedGObject], hasMipmap);
}

- (void)setHeight:(int)height
{
	gdk_gl_texture_builder_set_height([self castedGObject], height);
}

- (void)setId:(guint)id
{
	gdk_gl_texture_builder_set_id([self castedGObject], id);
}

- (void)setSync:(gpointer)sync
{
	gdk_gl_texture_builder_set_sync([self castedGObject], sync);
}

- (void)setUpdateRegion:(cairo_region_t*)region
{
	gdk_gl_texture_builder_set_update_region([self castedGObject], region);
}

- (void)setUpdateTexture:(OGGdkTexture*)texture
{
	gdk_gl_texture_builder_set_update_texture([self castedGObject], [texture castedGObject]);
}

- (void)setWidth:(int)width
{
	gdk_gl_texture_builder_set_width([self castedGObject], width);
}


@end