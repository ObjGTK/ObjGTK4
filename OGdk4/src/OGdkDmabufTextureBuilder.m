/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDmabufTextureBuilder.h"

#import "OGdkDisplay.h"
#import "OGdkTexture.h"

@implementation OGdkDmabufTextureBuilder

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DMABUF_TEXTURE_BUILDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_DMABUF_TEXTURE_BUILDER);
	return gObjectClass;
}

+ (instancetype)dmabufTextureBuilder
{
	GdkDmabufTextureBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_dmabuf_texture_builder_new(), GDK_TYPE_DMABUF_TEXTURE_BUILDER, GdkDmabufTextureBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkDmabufTextureBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGdkDmabufTextureBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkDmabufTextureBuilder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_DMABUF_TEXTURE_BUILDER, GdkDmabufTextureBuilder);
}

- (OGdkTexture*)buildWithDestroy:(GDestroyNotify)destroy data:(gpointer)data
{
	GError* err = NULL;

	GdkTexture* gobjectValue = gdk_dmabuf_texture_builder_build((GdkDmabufTextureBuilder*)[self castedGObject], destroy, data, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_dmabuf_texture_builder_get_display((GdkDmabufTextureBuilder*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)fdWithPlane:(unsigned int)plane
{
	int returnValue = (int)gdk_dmabuf_texture_builder_get_fd((GdkDmabufTextureBuilder*)[self castedGObject], plane);

	return returnValue;
}

- (guint32)fourcc
{
	guint32 returnValue = (guint32)gdk_dmabuf_texture_builder_get_fourcc((GdkDmabufTextureBuilder*)[self castedGObject]);

	return returnValue;
}

- (unsigned int)height
{
	unsigned int returnValue = (unsigned int)gdk_dmabuf_texture_builder_get_height((GdkDmabufTextureBuilder*)[self castedGObject]);

	return returnValue;
}

- (guint64)modifier
{
	guint64 returnValue = (guint64)gdk_dmabuf_texture_builder_get_modifier((GdkDmabufTextureBuilder*)[self castedGObject]);

	return returnValue;
}

- (unsigned int)nplanes
{
	unsigned int returnValue = (unsigned int)gdk_dmabuf_texture_builder_get_n_planes((GdkDmabufTextureBuilder*)[self castedGObject]);

	return returnValue;
}

- (unsigned int)offsetWithPlane:(unsigned int)plane
{
	unsigned int returnValue = (unsigned int)gdk_dmabuf_texture_builder_get_offset((GdkDmabufTextureBuilder*)[self castedGObject], plane);

	return returnValue;
}

- (bool)premultiplied
{
	bool returnValue = (bool)gdk_dmabuf_texture_builder_get_premultiplied((GdkDmabufTextureBuilder*)[self castedGObject]);

	return returnValue;
}

- (unsigned int)strideWithPlane:(unsigned int)plane
{
	unsigned int returnValue = (unsigned int)gdk_dmabuf_texture_builder_get_stride((GdkDmabufTextureBuilder*)[self castedGObject], plane);

	return returnValue;
}

- (cairo_region_t*)updateRegion
{
	cairo_region_t* returnValue = (cairo_region_t*)gdk_dmabuf_texture_builder_get_update_region((GdkDmabufTextureBuilder*)[self castedGObject]);

	return returnValue;
}

- (OGdkTexture*)updateTexture
{
	GdkTexture* gobjectValue = gdk_dmabuf_texture_builder_get_update_texture((GdkDmabufTextureBuilder*)[self castedGObject]);

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (unsigned int)width
{
	unsigned int returnValue = (unsigned int)gdk_dmabuf_texture_builder_get_width((GdkDmabufTextureBuilder*)[self castedGObject]);

	return returnValue;
}

- (void)setDisplay:(OGdkDisplay*)display
{
	gdk_dmabuf_texture_builder_set_display((GdkDmabufTextureBuilder*)[self castedGObject], [display castedGObject]);
}

- (void)setFdWithPlane:(unsigned int)plane fd:(int)fd
{
	gdk_dmabuf_texture_builder_set_fd((GdkDmabufTextureBuilder*)[self castedGObject], plane, fd);
}

- (void)setFourcc:(guint32)fourcc
{
	gdk_dmabuf_texture_builder_set_fourcc((GdkDmabufTextureBuilder*)[self castedGObject], fourcc);
}

- (void)setHeight:(unsigned int)height
{
	gdk_dmabuf_texture_builder_set_height((GdkDmabufTextureBuilder*)[self castedGObject], height);
}

- (void)setModifier:(guint64)modifier
{
	gdk_dmabuf_texture_builder_set_modifier((GdkDmabufTextureBuilder*)[self castedGObject], modifier);
}

- (void)setNplanes:(unsigned int)nplanes
{
	gdk_dmabuf_texture_builder_set_n_planes((GdkDmabufTextureBuilder*)[self castedGObject], nplanes);
}

- (void)setOffsetWithPlane:(unsigned int)plane offset:(unsigned int)offset
{
	gdk_dmabuf_texture_builder_set_offset((GdkDmabufTextureBuilder*)[self castedGObject], plane, offset);
}

- (void)setPremultiplied:(bool)premultiplied
{
	gdk_dmabuf_texture_builder_set_premultiplied((GdkDmabufTextureBuilder*)[self castedGObject], premultiplied);
}

- (void)setStrideWithPlane:(unsigned int)plane stride:(unsigned int)stride
{
	gdk_dmabuf_texture_builder_set_stride((GdkDmabufTextureBuilder*)[self castedGObject], plane, stride);
}

- (void)setUpdateRegion:(cairo_region_t*)region
{
	gdk_dmabuf_texture_builder_set_update_region((GdkDmabufTextureBuilder*)[self castedGObject], region);
}

- (void)setUpdateTexture:(OGdkTexture*)texture
{
	gdk_dmabuf_texture_builder_set_update_texture((GdkDmabufTextureBuilder*)[self castedGObject], [texture castedGObject]);
}

- (void)setWidth:(unsigned int)width
{
	gdk_dmabuf_texture_builder_set_width((GdkDmabufTextureBuilder*)[self castedGObject], width);
}


@end