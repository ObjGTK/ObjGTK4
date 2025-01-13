/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkGLTextureBuilder.h"

#import "OGdkGLContext.h"
#import "OGdkTexture.h"

@implementation OGdkGLTextureBuilder

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_GL_TEXTURE_BUILDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gLTextureBuilder
{
	GdkGLTextureBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_gl_texture_builder_new(), GdkGLTextureBuilder, GdkGLTextureBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkGLTextureBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGdkGLTextureBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkGLTextureBuilder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkGLTextureBuilder, GdkGLTextureBuilder);
}

- (OGdkTexture*)buildWithDestroy:(GDestroyNotify)destroy data:(gpointer)data
{
	GdkTexture* gobjectValue = gdk_gl_texture_builder_build([self castedGObject], destroy, data);

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkGLContext*)context
{
	GdkGLContext* gobjectValue = gdk_gl_texture_builder_get_context([self castedGObject]);

	OGdkGLContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkMemoryFormat)format
{
	GdkMemoryFormat returnValue = (GdkMemoryFormat)gdk_gl_texture_builder_get_format([self castedGObject]);

	return returnValue;
}

- (bool)hasMipmap
{
	bool returnValue = (bool)gdk_gl_texture_builder_get_has_mipmap([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = (int)gdk_gl_texture_builder_get_height([self castedGObject]);

	return returnValue;
}

- (guint)id
{
	guint returnValue = (guint)gdk_gl_texture_builder_get_id([self castedGObject]);

	return returnValue;
}

- (gpointer)sync
{
	gpointer returnValue = (gpointer)gdk_gl_texture_builder_get_sync([self castedGObject]);

	return returnValue;
}

- (cairo_region_t*)updateRegion
{
	cairo_region_t* returnValue = (cairo_region_t*)gdk_gl_texture_builder_get_update_region([self castedGObject]);

	return returnValue;
}

- (OGdkTexture*)updateTexture
{
	GdkTexture* gobjectValue = gdk_gl_texture_builder_get_update_texture([self castedGObject]);

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)width
{
	int returnValue = (int)gdk_gl_texture_builder_get_width([self castedGObject]);

	return returnValue;
}

- (void)setContext:(OGdkGLContext*)context
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

- (void)setIdWithIdentifier:(guint)identifier
{
	gdk_gl_texture_builder_set_id([self castedGObject], identifier);
}

- (void)setSync:(gpointer)sync
{
	gdk_gl_texture_builder_set_sync([self castedGObject], sync);
}

- (void)setUpdateRegion:(cairo_region_t*)region
{
	gdk_gl_texture_builder_set_update_region([self castedGObject], region);
}

- (void)setUpdateTexture:(OGdkTexture*)texture
{
	gdk_gl_texture_builder_set_update_texture([self castedGObject], [texture castedGObject]);
}

- (void)setWidth:(int)width
{
	gdk_gl_texture_builder_set_width([self castedGObject], width);
}


@end