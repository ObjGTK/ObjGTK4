/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk-pixbuf/gdk-pixbuf.h>

#import <OGObject/OGObject.h>

@class OGGdkPixbuf;
@class OGGdkPixbufAnimation;

/**
 * Incremental image loader.
 * 
 * `GdkPixbufLoader` provides a way for applications to drive the
 * process of loading an image, by letting them send the image data
 * directly to the loader instead of having the loader read the data
 * from a file. Applications can use this functionality instead of
 * `gdk_pixbuf_new_from_file()` or `gdk_pixbuf_animation_new_from_file()`
 * when they need to parse image data in small chunks. For example,
 * it should be used when reading an image from a (potentially) slow
 * network connection, or when loading an extremely large file.
 * 
 * To use `GdkPixbufLoader` to load an image, create a new instance,
 * and call [method@GdkPixbuf.PixbufLoader.write] to send the data
 * to it. When done, [method@GdkPixbuf.PixbufLoader.close] should be
 * called to end the stream and finalize everything.
 * 
 * The loader will emit three important signals throughout the process:
 * 
 *  - [signal@GdkPixbuf.PixbufLoader::size-prepared] will be emitted as
 *    soon as the image has enough information to determine the size of
 *    the image to be used. If you want to scale the image while loading
 *    it, you can call [method@GdkPixbuf.PixbufLoader.set_size] in
 *    response to this signal.
 *  - [signal@GdkPixbuf.PixbufLoader::area-prepared] will be emitted as
 *    soon as the pixbuf of the desired has been allocated. You can obtain
 *    the `GdkPixbuf` instance by calling [method@GdkPixbuf.PixbufLoader.get_pixbuf].
 *    If you want to use it, simply acquire a reference to it. You can
 *    also call `gdk_pixbuf_loader_get_pixbuf()` later to get the same
 *    pixbuf.
 *  - [signal@GdkPixbuf.PixbufLoader::area-updated] will be emitted every
 *    time a region is updated. This way you can update a partially
 *    completed image. Note that you do not know anything about the
 *    completeness of an image from the updated area. For example, in an
 *    interlaced image you will need to make several passes before the
 *    image is done loading.
 * 
 * ## Loading an animation
 * 
 * Loading an animation is almost as easy as loading an image. Once the
 * first [signal@GdkPixbuf.PixbufLoader::area-prepared] signal has been
 * emitted, you can call [method@GdkPixbuf.PixbufLoader.get_animation] to
 * get the [class@GdkPixbuf.PixbufAnimation] instance, and then call
 * and [method@GdkPixbuf.PixbufAnimation.get_iter] to get a
 * [class@GdkPixbuf.PixbufAnimationIter] to retrieve the pixbuf for the
 * desired time stamp.
 *
 */
@interface OGGdkPixbufLoader : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithMimeType:(OFString*)mimeType;
- (instancetype)initWithType:(OFString*)imageType;

/**
 * Methods
 */

- (GdkPixbufLoader*)castedGObject;

/**
 * Informs a pixbuf loader that no further writes with
 * gdk_pixbuf_loader_write() will occur, so that it can free its
 * internal loading structures.
 * 
 * This function also tries to parse any data that hasn't yet been parsed;
 * if the remaining data is partial or corrupt, an error will be returned.
 * 
 * If `FALSE` is returned, `error` will be set to an error from the
 * `GDK_PIXBUF_ERROR` or `G_FILE_ERROR` domains.
 * 
 * If you're just cancelling a load rather than expecting it to be finished,
 * passing `NULL` for `error` to ignore it is reasonable.
 * 
 * Remember that this function does not release a reference on the loader, so
 * you will need to explicitly release any reference you hold.
 *
 * @return `TRUE` if all image data written so far was successfully
 *   passed out via the update_area signal
 */
- (bool)close;

/**
 * Queries the #GdkPixbufAnimation that a pixbuf loader is currently creating.
 * 
 * In general it only makes sense to call this function after the
 * [signal@GdkPixbuf.PixbufLoader::area-prepared] signal has been emitted by
 * the loader.
 * 
 * If the loader doesn't have enough bytes yet, and hasn't emitted the `area-prepared`
 * signal, this function will return `NULL`.
 *
 * @return The animation that the loader is
 *   currently loading
 */
- (OGGdkPixbufAnimation*)animation;

/**
 * Obtains the available information about the format of the
 * currently loading image file.
 *
 * @return A #GdkPixbufFormat
 */
- (GdkPixbufFormat*)format;

/**
 * Queries the #GdkPixbuf that a pixbuf loader is currently creating.
 * 
 * In general it only makes sense to call this function after the
 * [signal@GdkPixbuf.PixbufLoader::area-prepared] signal has been
 * emitted by the loader; this means that enough data has been read
 * to know the size of the image that will be allocated.
 * 
 * If the loader has not received enough data via gdk_pixbuf_loader_write(),
 * then this function returns `NULL`.
 * 
 * The returned pixbuf will be the same in all future calls to the loader,
 * so if you want to keep using it, you should acquire a reference to it.
 * 
 * Additionally, if the loader is an animation, it will return the "static
 * image" of the animation (see gdk_pixbuf_animation_get_static_image()).
 *
 * @return The pixbuf that the loader is
 *   creating
 */
- (OGGdkPixbuf*)pixbuf;

/**
 * Causes the image to be scaled while it is loaded.
 * 
 * The desired image size can be determined relative to the original
 * size of the image by calling gdk_pixbuf_loader_set_size() from a
 * signal handler for the ::size-prepared signal.
 * 
 * Attempts to set the desired image size  are ignored after the
 * emission of the ::size-prepared signal.
 *
 * @param width The desired width of the image being loaded.
 * @param height The desired height of the image being loaded.
 */
- (void)setSizeWithWidth:(int)width height:(int)height;

/**
 * Parses the next `count` bytes in the given image buffer.
 *
 * @param buf Pointer to image data.
 * @param count Length of the @buf buffer in bytes.
 * @return `TRUE` if the write was successful, or
 *   `FALSE` if the loader cannot parse the buffer
 */
- (bool)writeWithBuf:(const guchar*)buf count:(gsize)count;

/**
 * Parses the next contents of the given image buffer.
 *
 * @param buffer The image data as a `GBytes` buffer.
 * @return `TRUE` if the write was successful, or `FALSE` if
 *   the loader cannot parse the buffer
 */
- (bool)writeBytes:(GBytes*)buffer;

@end