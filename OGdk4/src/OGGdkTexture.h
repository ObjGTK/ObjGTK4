/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkPixbuf;

/**
 * `GdkTexture` is the basic element used to refer to pixel data.
 * 
 * It is primarily meant for pixel data that will not change over
 * multiple frames, and will be used for a long time.
 * 
 * There are various ways to create `GdkTexture` objects from a
 * [class@GdkPixbuf.Pixbuf], or from bytes stored in memory, a file, or a
 * [struct@Gio.Resource].
 * 
 * The ownership of the pixel data is transferred to the `GdkTexture`
 * instance; you can only make a copy of it, via [method@Gdk.Texture.download].
 * 
 * `GdkTexture` is an immutable object: That means you cannot change
 * anything about it other than increasing the reference count via
 * [method@GObject.Object.ref], and consequently, it is a thread-safe object.
 *
 */
@interface OGGdkTexture : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initForPixbuf:(OGGdkPixbuf*)pixbuf;
- (instancetype)initFromBytes:(GBytes*)bytes;
- (instancetype)initFromFile:(GFile*)file;
- (instancetype)initFromFilename:(OFString*)path;
- (instancetype)initFromResource:(OFString*)resourcePath;

/**
 * Methods
 */

- (GdkTexture*)castedGObject;

/**
 * Downloads the @texture into local memory.
 * 
 * This may be an expensive operation, as the actual texture data
 * may reside on a GPU or on a remote display server.
 * 
 * The data format of the downloaded data is equivalent to
 * %CAIRO_FORMAT_ARGB32, so every downloaded pixel requires
 * 4 bytes of memory.
 * 
 * Downloading a texture into a Cairo image surface:
 * ```c
 * surface = cairo_image_surface_create (CAIRO_FORMAT_ARGB32,
 *                                       gdk_texture_get_width (texture),
 *                                       gdk_texture_get_height (texture));
 * gdk_texture_download (texture,
 *                       cairo_image_surface_get_data (surface),
 *                       cairo_image_surface_get_stride (surface));
 * cairo_surface_mark_dirty (surface);
 * ```
 * 
 * For more flexible download capabilities, see
 * [struct@Gdk.TextureDownloader].
 *
 * @param data pointer to enough memory to be filled with the
 *   downloaded data of @texture
 * @param stride rowstride in bytes
 */
- (void)downloadWithData:(guchar*)data stride:(gsize)stride;

/**
 * Gets the memory format most closely associated with the data of
 * the texture.
 * 
 * Note that it may not be an exact match for texture data
 * stored on the GPU or with compression.
 * 
 * The format can give an indication about the bit depth and opacity
 * of the texture and is useful to determine the best format for
 * downloading the texture.
 *
 * @return the preferred format for the texture's data
 */
- (GdkMemoryFormat)format;

/**
 * Returns the height of the @texture, in pixels.
 *
 * @return the height of the `GdkTexture`
 */
- (int)height;

/**
 * Returns the width of @texture, in pixels.
 *
 * @return the width of the `GdkTexture`
 */
- (int)width;

/**
 * Store the given @texture to the @filename as a PNG file.
 * 
 * This is a utility function intended for debugging and testing.
 * If you want more control over formats, proper error handling or
 * want to store to a [iface@Gio.File] or other location, you might want to
 * use [method@Gdk.Texture.save_to_png_bytes] or look into the
 * gdk-pixbuf library.
 *
 * @param filename the filename to store to
 * @return %TRUE if saving succeeded, %FALSE on failure.
 */
- (bool)saveToPng:(OFString*)filename;

/**
 * Store the given @texture in memory as a PNG file.
 * 
 * Use [ctor@Gdk.Texture.new_from_bytes] to read it back.
 * 
 * If you want to serialize a texture, this is a convenient and
 * portable way to do that.
 * 
 * If you need more control over the generated image, such as
 * attaching metadata, you should look into an image handling
 * library such as the gdk-pixbuf library.
 * 
 * If you are dealing with high dynamic range float data, you
 * might also want to consider [method@Gdk.Texture.save_to_tiff_bytes]
 * instead.
 *
 * @return a newly allocated `GBytes` containing PNG data
 */
- (GBytes*)saveToPngBytes;

/**
 * Store the given @texture to the @filename as a TIFF file.
 * 
 * GTK will attempt to store data without loss.
 *
 * @param filename the filename to store to
 * @return %TRUE if saving succeeded, %FALSE on failure.
 */
- (bool)saveToTiff:(OFString*)filename;

/**
 * Store the given @texture in memory as a TIFF file.
 * 
 * Use [ctor@Gdk.Texture.new_from_bytes] to read it back.
 * 
 * This function is intended to store a representation of the
 * texture's data that is as accurate as possible. This is
 * particularly relevant when working with high dynamic range
 * images and floating-point texture data.
 * 
 * If that is not your concern and you are interested in a
 * smaller size and a more portable format, you might want to
 * use [method@Gdk.Texture.save_to_png_bytes].
 *
 * @return a newly allocated `GBytes` containing TIFF data
 */
- (GBytes*)saveToTiffBytes;

@end