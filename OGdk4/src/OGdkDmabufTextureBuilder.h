/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGdkDisplay;
@class OGdkTexture;

/**
 * `GdkDmabufTextureBuilder` is a builder used to construct [class@Gdk.Texture]
 * objects from DMA buffers.
 * 
 * DMA buffers are commonly called **_dma-bufs_**.
 * 
 * DMA buffers are a feature of the Linux kernel to enable efficient buffer and
 * memory sharing between hardware such as codecs, GPUs, displays, cameras and the
 * kernel drivers controlling them. For example, a decoder may want its output to
 * be directly shared with the display server for rendering without a copy.
 * 
 * Any device driver which participates in DMA buffer sharing, can do so as either
 * the exporter or importer of buffers (or both).
 * 
 * The memory that is shared via DMA buffers is usually stored in non-system memory
 * (maybe in device's local memory or something else not directly accessible by the
 * CPU), and accessing this memory from the CPU may have higher-than-usual overhead.
 * 
 * In particular for graphics data, it is not uncommon that data consists of multiple
 * separate blocks of memory, for example one block for each of the red, green and
 * blue channels. These blocks are called **_planes_**. DMA buffers can have up to
 * four planes. Even if the memory is a single block, the data can be organized in
 * multiple planes, by specifying offsets from the beginning of the data.
 * 
 * DMA buffers are exposed to user-space as file descriptors allowing to pass them
 * between processes. If a DMA buffer has multiple planes, there is one file
 * descriptor per plane.
 * 
 * The format of the data (for graphics data, essentially its colorspace) is described
 * by a 32-bit integer. These format identifiers are defined in the header file `drm_fourcc.h`
 * and commonly referred to as **_fourcc_** values, since they are identified by 4 ASCII
 * characters. Additionally, each DMA buffer has a **_modifier_**, which is a 64-bit integer
 * that describes driver-specific details of the memory layout, such as tiling or compression.
 * 
 * For historical reasons, some producers of dma-bufs don't provide an explicit modifier, but
 * instead return `DMA_FORMAT_MOD_INVALID` to indicate that their modifier is **_implicit_**.
 * GTK tries to accommodate this situation by accepting `DMA_FORMAT_MOD_INVALID` as modifier.
 * 
 * The operation of `GdkDmabufTextureBuilder` is quite simple: Create a texture builder,
 * set all the necessary properties, and then call [method@Gdk.DmabufTextureBuilder.build]
 * to create the new texture.
 * 
 * The required properties for a dma-buf texture are
 * 
 *  * The width and height in pixels
 * 
 *  * The `fourcc` code and `modifier` which identify the format and memory layout of the dma-buf
 * 
 *  * The file descriptor, offset and stride for each of the planes
 * 
 * `GdkDmabufTextureBuilder` can be used for quick one-shot construction of
 * textures as well as kept around and reused to construct multiple textures.
 * 
 * For further information, see
 * 
 * * The Linux kernel [documentation](https://docs.kernel.org/driver-api/dma-buf.html)
 * 
 * * The header file [drm_fourcc.h](https://gitlab.freedesktop.org/mesa/drm/-/blob/main/include/drm/drm_fourcc.h)
 *
 */
@interface OGdkDmabufTextureBuilder : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)dmabufTextureBuilder;

/**
 * Methods
 */

- (GdkDmabufTextureBuilder*)castedGObject;

/**
 * Builds a new `GdkTexture` with the values set up in the builder.
 * 
 * It is a programming error to call this function if any mandatory
 * property has not been set.
 * 
 * If the dmabuf is not supported by GTK, %NULL will be returned and @error will be set.
 * 
 * The `destroy` function gets called when the returned texture gets released.
 * 
 * It is possible to call this function multiple times to create multiple textures,
 * possibly with changing properties in between.
 * 
 * It is the responsibility of the caller to keep the file descriptors for the planes
 * open until the created texture is no longer used, and close them afterwards (possibly
 * using the @destroy notify).
 * 
 * Not all formats defined in the `drm_fourcc.h` header are supported. You can use
 * [method@Gdk.Display.get_dmabuf_formats] to get a list of supported formats.
 *
 * @param destroy destroy function to be called when the texture is
 *   released
 * @param data user data to pass to the destroy function
 * @return a newly built `GdkTexture` or `NULL`
 *   if the format is not supported
 */
- (OGdkTexture*)buildWithDestroy:(GDestroyNotify)destroy data:(gpointer)data;

/**
 * Returns the display that this texture builder is
 * associated with.
 *
 * @return the display
 */
- (OGdkDisplay*)display;

/**
 * Gets the file descriptor for a plane.
 *
 * @param plane the plane to get the fd for
 * @return the file descriptor
 */
- (int)fdWithPlane:(unsigned int)plane;

/**
 * Gets the format previously set via gdk_dmabuf_texture_builder_set_fourcc()
 * or 0 if the format wasn't set.
 * 
 * The format is specified as a fourcc code.
 *
 * @return The format
 */
- (guint32)fourcc;

/**
 * Gets the height previously set via gdk_dmabuf_texture_builder_set_height() or
 * 0 if the height wasn't set.
 *
 * @return The height
 */
- (unsigned int)height;

/**
 * Gets the modifier value.
 *
 * @return the modifier
 */
- (guint64)modifier;

/**
 * Gets the number of planes.
 *
 * @return The number of planes
 */
- (unsigned int)nplanes;

/**
 * Gets the offset value for a plane.
 *
 * @param plane the plane to get the offset for
 * @return the offset
 */
- (unsigned int)offsetWithPlane:(unsigned int)plane;

/**
 * Whether the data is premultiplied.
 *
 * @return whether the data is premultiplied
 */
- (bool)premultiplied;

/**
 * Gets the stride value for a plane.
 *
 * @param plane the plane to get the stride for
 * @return the stride
 */
- (unsigned int)strideWithPlane:(unsigned int)plane;

/**
 * Gets the region previously set via gdk_dmabuf_texture_builder_set_update_region() or
 * %NULL if none was set.
 *
 * @return The region
 */
- (cairo_region_t*)updateRegion;

/**
 * Gets the texture previously set via gdk_dmabuf_texture_builder_set_update_texture() or
 * %NULL if none was set.
 *
 * @return The texture
 */
- (OGdkTexture*)updateTexture;

/**
 * Gets the width previously set via gdk_dmabuf_texture_builder_set_width() or
 * 0 if the width wasn't set.
 *
 * @return The width
 */
- (unsigned int)width;

/**
 * Sets the display that this texture builder is
 * associated with.
 * 
 * The display is used to determine the supported
 * dma-buf formats.
 *
 * @param display the display
 */
- (void)setDisplay:(OGdkDisplay*)display;

/**
 * Sets the file descriptor for a plane.
 *
 * @param plane the plane to set the fd for
 * @param fd the file descriptor
 */
- (void)setFdWithPlane:(unsigned int)plane fd:(int)fd;

/**
 * Sets the format of the texture.
 * 
 * The format is specified as a fourcc code.
 * 
 * The format must be set before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param fourcc the texture's format or 0 to unset
 */
- (void)setFourcc:(guint32)fourcc;

/**
 * Sets the height of the texture.
 * 
 * The height must be set before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param height the texture's height or 0 to unset
 */
- (void)setHeight:(unsigned int)height;

/**
 * Sets the modifier.
 *
 * @param modifier the modifier value
 */
- (void)setModifier:(guint64)modifier;

/**
 * Sets the number of planes of the texture.
 *
 * @param nplanes the number of planes
 */
- (void)setNplanes:(unsigned int)nplanes;

/**
 * Sets the offset for a plane.
 *
 * @param plane the plane to set the offset for
 * @param offset the offset value
 */
- (void)setOffsetWithPlane:(unsigned int)plane offset:(unsigned int)offset;

/**
 * Sets whether the data is premultiplied.
 * 
 * Unless otherwise specified, all formats including alpha channels are assumed
 * to be premultiplied.
 *
 * @param premultiplied whether the data is premultiplied
 */
- (void)setPremultiplied:(bool)premultiplied;

/**
 * Sets the stride for a plane.
 * 
 * The stride must be set for all planes before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param plane the plane to set the stride for
 * @param stride the stride value
 */
- (void)setStrideWithPlane:(unsigned int)plane stride:(unsigned int)stride;

/**
 * Sets the region to be updated by this texture. Together with
 * [property@Gdk.DmabufTextureBuilder:update-texture] this describes an
 * update of a previous texture.
 * 
 * When rendering animations of large textures, it is possible that
 * consecutive textures are only updating contents in parts of the texture.
 * It is then possible to describe this update via these two properties,
 * so that GTK can avoid rerendering parts that did not change.
 * 
 * An example would be a screen recording where only the mouse pointer moves.
 *
 * @param region the region to update
 */
- (void)setUpdateRegion:(cairo_region_t*)region;

/**
 * Sets the texture to be updated by this texture. See
 * [method@Gdk.DmabufTextureBuilder.set_update_region] for an explanation.
 *
 * @param texture the texture to update
 */
- (void)setUpdateTexture:(OGdkTexture*)texture;

/**
 * Sets the width of the texture.
 * 
 * The width must be set before calling [method@Gdk.GLTextureBuilder.build].
 *
 * @param width The texture's width or 0 to unset
 */
- (void)setWidth:(unsigned int)width;

@end