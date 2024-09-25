/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDmabufTextureBuilder.h"

#import "OGGdkDisplay.h"
#import "OGGdkTexture.h"

@implementation OGGdkDmabufTextureBuilder

- (instancetype)init
{
	GdkDmabufTextureBuilder* gobjectValue = GDK_DMABUF_TEXTURE_BUILDER(gdk_dmabuf_texture_builder_new());

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

- (GdkDmabufTextureBuilder*)castedGObject
{
	return GDK_DMABUF_TEXTURE_BUILDER([self gObject]);
}

- (OGGdkTexture*)buildWithDestroy:(GDestroyNotify)destroy data:(gpointer)data
{
	GError* err = NULL;

	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_dmabuf_texture_builder_build([self castedGObject], destroy, data, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGGdkTexture* returnValue = [OGGdkTexture withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_dmabuf_texture_builder_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (int)fd:(unsigned int)plane
{
	int returnValue = gdk_dmabuf_texture_builder_get_fd([self castedGObject], plane);

	return returnValue;
}

- (guint32)fourcc
{
	guint32 returnValue = gdk_dmabuf_texture_builder_get_fourcc([self castedGObject]);

	return returnValue;
}

- (unsigned int)height
{
	unsigned int returnValue = gdk_dmabuf_texture_builder_get_height([self castedGObject]);

	return returnValue;
}

- (guint64)modifier
{
	guint64 returnValue = gdk_dmabuf_texture_builder_get_modifier([self castedGObject]);

	return returnValue;
}

- (unsigned int)nplanes
{
	unsigned int returnValue = gdk_dmabuf_texture_builder_get_n_planes([self castedGObject]);

	return returnValue;
}

- (unsigned int)offset:(unsigned int)plane
{
	unsigned int returnValue = gdk_dmabuf_texture_builder_get_offset([self castedGObject], plane);

	return returnValue;
}

- (bool)premultiplied
{
	bool returnValue = gdk_dmabuf_texture_builder_get_premultiplied([self castedGObject]);

	return returnValue;
}

- (unsigned int)stride:(unsigned int)plane
{
	unsigned int returnValue = gdk_dmabuf_texture_builder_get_stride([self castedGObject], plane);

	return returnValue;
}

- (cairo_region_t*)updateRegion
{
	cairo_region_t* returnValue = gdk_dmabuf_texture_builder_get_update_region([self castedGObject]);

	return returnValue;
}

- (OGGdkTexture*)updateTexture
{
	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_dmabuf_texture_builder_get_update_texture([self castedGObject]));

	OGGdkTexture* returnValue = [OGGdkTexture withGObject:gobjectValue];
	return returnValue;
}

- (unsigned int)width
{
	unsigned int returnValue = gdk_dmabuf_texture_builder_get_width([self castedGObject]);

	return returnValue;
}

- (void)setDisplay:(OGGdkDisplay*)display
{
	gdk_dmabuf_texture_builder_set_display([self castedGObject], [display castedGObject]);
}

- (void)setFdWithPlane:(unsigned int)plane fd:(int)fd
{
	gdk_dmabuf_texture_builder_set_fd([self castedGObject], plane, fd);
}

- (void)setFourcc:(guint32)fourcc
{
	gdk_dmabuf_texture_builder_set_fourcc([self castedGObject], fourcc);
}

- (void)setHeight:(unsigned int)height
{
	gdk_dmabuf_texture_builder_set_height([self castedGObject], height);
}

- (void)setModifier:(guint64)modifier
{
	gdk_dmabuf_texture_builder_set_modifier([self castedGObject], modifier);
}

- (void)setNplanes:(unsigned int)nplanes
{
	gdk_dmabuf_texture_builder_set_n_planes([self castedGObject], nplanes);
}

- (void)setOffsetWithPlane:(unsigned int)plane offset:(unsigned int)offset
{
	gdk_dmabuf_texture_builder_set_offset([self castedGObject], plane, offset);
}

- (void)setPremultiplied:(bool)premultiplied
{
	gdk_dmabuf_texture_builder_set_premultiplied([self castedGObject], premultiplied);
}

- (void)setStrideWithPlane:(unsigned int)plane stride:(unsigned int)stride
{
	gdk_dmabuf_texture_builder_set_stride([self castedGObject], plane, stride);
}

- (void)setUpdateRegion:(cairo_region_t*)region
{
	gdk_dmabuf_texture_builder_set_update_region([self castedGObject], region);
}

- (void)setUpdateTexture:(OGGdkTexture*)texture
{
	gdk_dmabuf_texture_builder_set_update_texture([self castedGObject], [texture castedGObject]);
}

- (void)setWidth:(unsigned int)width
{
	gdk_dmabuf_texture_builder_set_width([self castedGObject], width);
}


@end