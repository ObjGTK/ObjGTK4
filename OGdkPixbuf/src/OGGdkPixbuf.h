/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk-pixbuf/gdk-pixbuf.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGInputStream;
@class OGOutputStream;

/**
 * A pixel buffer.
 * 
 * `GdkPixbuf` contains information about an image's pixel data,
 * its color space, bits per sample, width and height, and the
 * rowstride (the number of bytes between the start of one row
 * and the start of the next).
 * 
 * ## Creating new `GdkPixbuf`
 * 
 * The most basic way to create a pixbuf is to wrap an existing pixel
 * buffer with a [class@GdkPixbuf.Pixbuf] instance. You can use the
 * [`ctor@GdkPixbuf.Pixbuf.new_from_data`] function to do this.
 * 
 * Every time you create a new `GdkPixbuf` instance for some data, you
 * will need to specify the destroy notification function that will be
 * called when the data buffer needs to be freed; this will happen when
 * a `GdkPixbuf` is finalized by the reference counting functions. If
 * you have a chunk of static data compiled into your application, you
 * can pass in `NULL` as the destroy notification function so that the
 * data will not be freed.
 * 
 * The [`ctor@GdkPixbuf.Pixbuf.new`] constructor function can be used
 * as a convenience to create a pixbuf with an empty buffer; this is
 * equivalent to allocating a data buffer using `malloc()` and then
 * wrapping it with `gdk_pixbuf_new_from_data()`. The `gdk_pixbuf_new()`
 * function will compute an optimal rowstride so that rendering can be
 * performed with an efficient algorithm.
 * 
 * As a special case, you can use the [`ctor@GdkPixbuf.Pixbuf.new_from_xpm_data`]
 * function to create a pixbuf from inline XPM image data.
 * 
 * You can also copy an existing pixbuf with the [method@Pixbuf.copy]
 * function. This is not the same as just acquiring a reference to
 * the old pixbuf instance: the copy function will actually duplicate
 * the pixel data in memory and create a new [class@Pixbuf] instance
 * for it.
 * 
 * ## Reference counting
 * 
 * `GdkPixbuf` structures are reference counted. This means that an
 * application can share a single pixbuf among many parts of the
 * code. When a piece of the program needs to use a pixbuf, it should
 * acquire a reference to it by calling `g_object_ref()`; when it no
 * longer needs the pixbuf, it should release the reference it acquired
 * by calling `g_object_unref()`. The resources associated with a
 * `GdkPixbuf` will be freed when its reference count drops to zero.
 * Newly-created `GdkPixbuf` instances start with a reference count
 * of one.
 * 
 * ## Image Data
 * 
 * Image data in a pixbuf is stored in memory in an uncompressed,
 * packed format. Rows in the image are stored top to bottom, and
 * in each row pixels are stored from left to right.
 * 
 * There may be padding at the end of a row.
 * 
 * The "rowstride" value of a pixbuf, as returned by [`method@GdkPixbuf.Pixbuf.get_rowstride`],
 * indicates the number of bytes between rows.
 * 
 * **NOTE**: If you are copying raw pixbuf data with `memcpy()` note that the
 * last row in the pixbuf may not be as wide as the full rowstride, but rather
 * just as wide as the pixel data needs to be; that is: it is unsafe to do
 * `memcpy (dest, pixels, rowstride * height)` to copy a whole pixbuf. Use
 * [method@GdkPixbuf.Pixbuf.copy] instead, or compute the width in bytes of the
 * last row as:
 * 
 * ```c
 * last_row = width * ((n_channels * bits_per_sample + 7) / 8);
 * ```
 * 
 * The same rule applies when iterating over each row of a `GdkPixbuf` pixels
 * array.
 * 
 * The following code illustrates a simple `put_pixel()`
 * function for RGB pixbufs with 8 bits per channel with an alpha
 * channel.
 * 
 * ```c
 * static void
 * put_pixel (GdkPixbuf *pixbuf,
 *            int x,
 * 	   int y,
 * 	   guchar red,
 * 	   guchar green,
 * 	   guchar blue,
 * 	   guchar alpha)
 * {
 *   int n_channels = gdk_pixbuf_get_n_channels (pixbuf);
 * 
 *   // Ensure that the pixbuf is valid
 *   g_assert (gdk_pixbuf_get_colorspace (pixbuf) == GDK_COLORSPACE_RGB);
 *   g_assert (gdk_pixbuf_get_bits_per_sample (pixbuf) == 8);
 *   g_assert (gdk_pixbuf_get_has_alpha (pixbuf));
 *   g_assert (n_channels == 4);
 * 
 *   int width = gdk_pixbuf_get_width (pixbuf);
 *   int height = gdk_pixbuf_get_height (pixbuf);
 * 
 *   // Ensure that the coordinates are in a valid range
 *   g_assert (x >= 0 && x < width);
 *   g_assert (y >= 0 && y < height);
 * 
 *   int rowstride = gdk_pixbuf_get_rowstride (pixbuf);
 * 
 *   // The pixel buffer in the GdkPixbuf instance
 *   guchar *pixels = gdk_pixbuf_get_pixels (pixbuf);
 * 
 *   // The pixel we wish to modify
 *   guchar *p = pixels + y * rowstride + x * n_channels;
 *   p[0] = red;
 *   p[1] = green;
 *   p[2] = blue;
 *   p[3] = alpha;
 * }
 * ```
 * 
 * ## Loading images
 * 
 * The `GdkPixBuf` class provides a simple mechanism for loading
 * an image from a file in synchronous and asynchronous fashion.
 * 
 * For GUI applications, it is recommended to use the asynchronous
 * stream API to avoid blocking the control flow of the application.
 * 
 * Additionally, `GdkPixbuf` provides the [class@GdkPixbuf.PixbufLoader`]
 * API for progressive image loading.
 * 
 * ## Saving images
 * 
 * The `GdkPixbuf` class provides methods for saving image data in
 * a number of file formats. The formatted data can be written to a
 * file or to a memory buffer. `GdkPixbuf` can also call a user-defined
 * callback on the data, which allows to e.g. write the image
 * to a socket or store it in a database.
 *
 */
@interface OGGdkPixbuf : OGObject
{

}

/**
 * Functions
 */

/**
 * Calculates the rowstride that an image created with those values would
 * have.
 * 
 * This function is useful for front-ends and backends that want to check
 * image values without needing to create a `GdkPixbuf`.
 *
 * @param colorspace Color space for image
 * @param hasAlpha Whether the image should have transparency information
 * @param bitsPerSample Number of bits per color sample
 * @param width Width of image in pixels, must be > 0
 * @param height Height of image in pixels, must be > 0
 * @return the rowstride for the given values, or -1 in case of error.
 */
+ (gint)calculateRowstrideWithColorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height;

/**
 * Parses an image file far enough to determine its format and size.
 *
 * @param filename The name of the file to identify.
 * @param width Return location for the width of the image
 * @param height Return location for the height of the image
 * @return A `GdkPixbufFormat` describing
 *   the image format of the file
 */
+ (GdkPixbufFormat*)fileInfoWithFilename:(OFString*)filename width:(gint*)width height:(gint*)height;

/**
 * Asynchronously parses an image file far enough to determine its
 * format and size.
 * 
 * For more details see gdk_pixbuf_get_file_info(), which is the synchronous
 * version of this function.
 * 
 * When the operation is finished, @callback will be called in the
 * main thread. You can then call gdk_pixbuf_get_file_info_finish() to
 * get the result of the operation.
 *
 * @param filename The name of the file to identify
 * @param cancellable optional `GCancellable` object, `NULL` to ignore
 * @param callback a `GAsyncReadyCallback` to call when the file info is available
 * @param userData the data to pass to the callback function
 */
+ (void)fileInfoAsyncWithFilename:(OFString*)filename cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous pixbuf parsing operation started with
 * gdk_pixbuf_get_file_info_async().
 *
 * @param asyncResult a `GAsyncResult`
 * @param width Return location for the width of the image, or `NULL`
 * @param height Return location for the height of the image, or `NULL`
 * @return A `GdkPixbufFormat` describing the
 *   image format of the file
 */
+ (GdkPixbufFormat*)fileInfoFinishWithAsyncResult:(GAsyncResult*)asyncResult width:(gint*)width height:(gint*)height;

/**
 * Obtains the available information about the image formats supported
 * by GdkPixbuf.
 *
 * @return A list of
 *   support image formats.
 */
+ (GSList*)formats;

/**
 * Initalizes the gdk-pixbuf loader modules referenced by the `loaders.cache`
 * file present inside that directory.
 * 
 * This is to be used by applications that want to ship certain loaders
 * in a different location from the system ones.
 * 
 * This is needed when the OS or runtime ships a minimal number of loaders
 * so as to reduce the potential attack surface of carefully crafted image
 * files, especially for uncommon file types. Applications that require
 * broader image file types coverage, such as image viewers, would be
 * expected to ship the gdk-pixbuf modules in a separate location, bundled
 * with the application in a separate directory from the OS or runtime-
 * provided modules.
 *
 * @param path Path to directory where the `loaders.cache` is installed
 * @return
 */
+ (bool)initModules:(OFString*)path;

/**
 * Creates a new pixbuf by asynchronously loading an image from an input stream.
 * 
 * For more details see gdk_pixbuf_new_from_stream(), which is the synchronous
 * version of this function.
 * 
 * When the operation is finished, @callback will be called in the main thread.
 * You can then call gdk_pixbuf_new_from_stream_finish() to get the result of
 * the operation.
 *
 * @param stream a `GInputStream` from which to load the pixbuf
 * @param cancellable optional `GCancellable` object, `NULL` to ignore
 * @param callback a `GAsyncReadyCallback` to call when the pixbuf is loaded
 * @param userData the data to pass to the callback function
 */
+ (void)newFromStreamAsyncWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Creates a new pixbuf by asynchronously loading an image from an input stream.
 * 
 * For more details see gdk_pixbuf_new_from_stream_at_scale(), which is the synchronous
 * version of this function.
 * 
 * When the operation is finished, @callback will be called in the main thread.
 * You can then call gdk_pixbuf_new_from_stream_finish() to get the result of the operation.
 *
 * @param stream a `GInputStream` from which to load the pixbuf
 * @param width the width the image should have or -1 to not constrain the width
 * @param height the height the image should have or -1 to not constrain the height
 * @param preserveAspectRatio `TRUE` to preserve the image's aspect ratio
 * @param cancellable optional `GCancellable` object, `NULL` to ignore
 * @param callback a `GAsyncReadyCallback` to call when the pixbuf is loaded
 * @param userData the data to pass to the callback function
 */
+ (void)newFromStreamAtScaleAsyncWithStream:(OGInputStream*)stream width:(gint)width height:(gint)height preserveAspectRatio:(bool)preserveAspectRatio cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous pixbuf save operation started with
 * gdk_pixbuf_save_to_stream_async().
 *
 * @param asyncResult a `GAsyncResult`
 * @return `TRUE` if the pixbuf was saved successfully, `FALSE` if an error was set.
 */
+ (bool)saveToStreamFinish:(GAsyncResult*)asyncResult;

/**
 * Constructors
 */
- (instancetype)initWithColorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height;
- (instancetype)initFromBytesWithData:(GBytes*)data colorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height rowstride:(int)rowstride;
- (instancetype)initFromDataWithData:(const guchar*)data colorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height rowstride:(int)rowstride destroyFn:(GdkPixbufDestroyNotify)destroyFn destroyFnData:(gpointer)destroyFnData;
- (instancetype)initFromFile:(OFString*)filename;
- (instancetype)initFromFileAtScaleWithFilename:(OFString*)filename width:(int)width height:(int)height preserveAspectRatio:(bool)preserveAspectRatio;
- (instancetype)initFromFileAtSizeWithFilename:(OFString*)filename width:(int)width height:(int)height;
- (instancetype)initFromInlineWithDataLength:(gint)dataLength data:(const guint8*)data copyPixels:(bool)copyPixels;
- (instancetype)initFromResource:(OFString*)resourcePath;
- (instancetype)initFromResourceAtScaleWithResourcePath:(OFString*)resourcePath width:(int)width height:(int)height preserveAspectRatio:(bool)preserveAspectRatio;
- (instancetype)initFromStreamWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable;
- (instancetype)initFromStreamAtScaleWithStream:(OGInputStream*)stream width:(gint)width height:(gint)height preserveAspectRatio:(bool)preserveAspectRatio cancellable:(OGCancellable*)cancellable;
- (instancetype)initFromStreamFinish:(GAsyncResult*)asyncResult;
- (instancetype)initFromXpmData:(const char**)data;

/**
 * Methods
 */

- (GdkPixbuf*)castedGObject;

/**
 * Takes an existing pixbuf and adds an alpha channel to it.
 * 
 * If the existing pixbuf already had an alpha channel, the channel
 * values are copied from the original; otherwise, the alpha channel
 * is initialized to 255 (full opacity).
 * 
 * If `substitute_color` is `TRUE`, then the color specified by the
 * (`r`, `g`, `b`) arguments will be assigned zero opacity. That is,
 * if you pass `(255, 255, 255)` for the substitute color, all white
 * pixels will become fully transparent.
 * 
 * If `substitute_color` is `FALSE`, then the (`r`, `g`, `b`) arguments
 * will be ignored.
 *
 * @param substituteColor Whether to set a color to zero opacity.
 * @param r Red value to substitute.
 * @param g Green value to substitute.
 * @param b Blue value to substitute.
 * @return A newly-created pixbuf
 */
- (OGGdkPixbuf*)addAlphaWithSubstituteColor:(bool)substituteColor r:(guchar)r g:(guchar)g b:(guchar)b;

/**
 * Takes an existing pixbuf and checks for the presence of an
 * associated "orientation" option.
 * 
 * The orientation option may be provided by the JPEG loader (which
 * reads the exif orientation tag) or the TIFF loader (which reads
 * the TIFF orientation tag, and compensates it for the partial
 * transforms performed by libtiff).
 * 
 * If an orientation option/tag is present, the appropriate transform
 * will be performed so that the pixbuf is oriented correctly.
 *
 * @return A newly-created pixbuf
 */
- (OGGdkPixbuf*)applyEmbeddedOrientation;

/**
 * Creates a transformation of the source image @src by scaling by
 * @scale_x and @scale_y then translating by @offset_x and @offset_y.
 * 
 * This gives an image in the coordinates of the destination pixbuf.
 * The rectangle (@dest_x, @dest_y, @dest_width, @dest_height)
 * is then alpha blended onto the corresponding rectangle of the
 * original destination image.
 * 
 * When the destination rectangle contains parts not in the source
 * image, the data at the edges of the source image is replicated
 * to infinity.
 * 
 * ![](composite.png)
 *
 * @param dest the #GdkPixbuf into which to render the results
 * @param destX the left coordinate for region to render
 * @param destY the top coordinate for region to render
 * @param destWidth the width of the region to render
 * @param destHeight the height of the region to render
 * @param offsetX the offset in the X direction (currently rounded to an integer)
 * @param offsetY the offset in the Y direction (currently rounded to an integer)
 * @param scaleX the scale factor in the X direction
 * @param scaleY the scale factor in the Y direction
 * @param interpType the interpolation type for the transformation.
 * @param overallAlpha overall alpha for source image (0..255)
 */
- (void)compositeWithDest:(OGGdkPixbuf*)dest destX:(int)destX destY:(int)destY destWidth:(int)destWidth destHeight:(int)destHeight offsetX:(double)offsetX offsetY:(double)offsetY scaleX:(double)scaleX scaleY:(double)scaleY interpType:(GdkInterpType)interpType overallAlpha:(int)overallAlpha;

/**
 * Creates a transformation of the source image @src by scaling by
 * @scale_x and @scale_y then translating by @offset_x and @offset_y,
 * then alpha blends the rectangle (@dest_x ,@dest_y, @dest_width,
 * @dest_height) of the resulting image with a checkboard of the
 * colors @color1 and @color2 and renders it onto the destination
 * image.
 * 
 * If the source image has no alpha channel, and @overall_alpha is 255, a fast
 * path is used which omits the alpha blending and just performs the scaling.
 * 
 * See gdk_pixbuf_composite_color_simple() for a simpler variant of this
 * function suitable for many tasks.
 *
 * @param dest the #GdkPixbuf into which to render the results
 * @param destX the left coordinate for region to render
 * @param destY the top coordinate for region to render
 * @param destWidth the width of the region to render
 * @param destHeight the height of the region to render
 * @param offsetX the offset in the X direction (currently rounded to an integer)
 * @param offsetY the offset in the Y direction (currently rounded to an integer)
 * @param scaleX the scale factor in the X direction
 * @param scaleY the scale factor in the Y direction
 * @param interpType the interpolation type for the transformation.
 * @param overallAlpha overall alpha for source image (0..255)
 * @param checkX the X offset for the checkboard (origin of checkboard is at -@check_x, -@check_y)
 * @param checkY the Y offset for the checkboard
 * @param checkSize the size of checks in the checkboard (must be a power of two)
 * @param color1 the color of check at upper left
 * @param color2 the color of the other check
 */
- (void)compositeColorWithDest:(OGGdkPixbuf*)dest destX:(int)destX destY:(int)destY destWidth:(int)destWidth destHeight:(int)destHeight offsetX:(double)offsetX offsetY:(double)offsetY scaleX:(double)scaleX scaleY:(double)scaleY interpType:(GdkInterpType)interpType overallAlpha:(int)overallAlpha checkX:(int)checkX checkY:(int)checkY checkSize:(int)checkSize color1:(guint32)color1 color2:(guint32)color2;

/**
 * Creates a new pixbuf by scaling `src` to `dest_width` x `dest_height`
 * and alpha blending the result with a checkboard of colors `color1`
 * and `color2`.
 *
 * @param destWidth the width of destination image
 * @param destHeight the height of destination image
 * @param interpType the interpolation type for the transformation.
 * @param overallAlpha overall alpha for source image (0..255)
 * @param checkSize the size of checks in the checkboard (must be a power of two)
 * @param color1 the color of check at upper left
 * @param color2 the color of the other check
 * @return the new pixbuf
 */
- (OGGdkPixbuf*)compositeColorSimpleWithDestWidth:(int)destWidth destHeight:(int)destHeight interpType:(GdkInterpType)interpType overallAlpha:(int)overallAlpha checkSize:(int)checkSize color1:(guint32)color1 color2:(guint32)color2;

/**
 * Creates a new `GdkPixbuf` with a copy of the information in the specified
 * `pixbuf`.
 * 
 * Note that this does not copy the options set on the original `GdkPixbuf`,
 * use gdk_pixbuf_copy_options() for this.
 *
 * @return A newly-created pixbuf
 */
- (OGGdkPixbuf*)copy;

/**
 * Copies a rectangular area from `src_pixbuf` to `dest_pixbuf`.
 * 
 * Conversion of pixbuf formats is done automatically.
 * 
 * If the source rectangle overlaps the destination rectangle on the
 * same pixbuf, it will be overwritten during the copy operation.
 * Therefore, you can not use this function to scroll a pixbuf.
 *
 * @param srcX Source X coordinate within @src_pixbuf.
 * @param srcY Source Y coordinate within @src_pixbuf.
 * @param width Width of the area to copy.
 * @param height Height of the area to copy.
 * @param destPixbuf Destination pixbuf.
 * @param destX X coordinate within @dest_pixbuf.
 * @param destY Y coordinate within @dest_pixbuf.
 */
- (void)copyAreaWithSrcX:(int)srcX srcY:(int)srcY width:(int)width height:(int)height destPixbuf:(OGGdkPixbuf*)destPixbuf destX:(int)destX destY:(int)destY;

/**
 * Copies the key/value pair options attached to a `GdkPixbuf` to another
 * `GdkPixbuf`.
 * 
 * This is useful to keep original metadata after having manipulated
 * a file. However be careful to remove metadata which you've already
 * applied, such as the "orientation" option after rotating the image.
 *
 * @param destPixbuf the destination pixbuf
 * @return `TRUE` on success.
 */
- (bool)copyOptions:(OGGdkPixbuf*)destPixbuf;

/**
 * Clears a pixbuf to the given RGBA value, converting the RGBA value into
 * the pixbuf's pixel format.
 * 
 * The alpha component will be ignored if the pixbuf doesn't have an alpha
 * channel.
 *
 * @param pixel RGBA pixel to used to clear (`0xffffffff` is opaque white,
 *   `0x00000000` transparent black)
 */
- (void)fill:(guint32)pixel;

/**
 * Flips a pixbuf horizontally or vertically and returns the
 * result in a new pixbuf.
 *
 * @param horizontal `TRUE` to flip horizontally, `FALSE` to flip vertically
 * @return the new pixbuf
 */
- (OGGdkPixbuf*)flip:(bool)horizontal;

/**
 * Queries the number of bits per color sample in a pixbuf.
 *
 * @return Number of bits per color sample.
 */
- (int)bitsPerSample;

/**
 * Returns the length of the pixel data, in bytes.
 *
 * @return The length of the pixel data.
 */
- (gsize)byteLength;

/**
 * Queries the color space of a pixbuf.
 *
 * @return Color space.
 */
- (GdkColorspace)colorspace;

/**
 * Queries whether a pixbuf has an alpha channel (opacity information).
 *
 * @return `TRUE` if it has an alpha channel, `FALSE` otherwise.
 */
- (bool)hasAlpha;

/**
 * Queries the height of a pixbuf.
 *
 * @return Height in pixels.
 */
- (int)height;

/**
 * Queries the number of channels of a pixbuf.
 *
 * @return Number of channels.
 */
- (int)nchannels;

/**
 * Looks up @key in the list of options that may have been attached to the
 * @pixbuf when it was loaded, or that may have been attached by another
 * function using gdk_pixbuf_set_option().
 * 
 * For instance, the ANI loader provides "Title" and "Artist" options.
 * The ICO, XBM, and XPM loaders provide "x_hot" and "y_hot" hot-spot
 * options for cursor definitions. The PNG loader provides the tEXt ancillary
 * chunk key/value pairs as options. Since 2.12, the TIFF and JPEG loaders
 * return an "orientation" option string that corresponds to the embedded
 * TIFF/Exif orientation tag (if present). Since 2.32, the TIFF loader sets
 * the "multipage" option string to "yes" when a multi-page TIFF is loaded.
 * Since 2.32 the JPEG and PNG loaders set "x-dpi" and "y-dpi" if the file
 * contains image density information in dots per inch.
 * Since 2.36.6, the JPEG loader sets the "comment" option with the comment
 * EXIF tag.
 *
 * @param key a nul-terminated string.
 * @return the value associated with `key`
 */
- (OFString*)option:(OFString*)key;

/**
 * Returns a `GHashTable` with a list of all the options that may have been
 * attached to the `pixbuf` when it was loaded, or that may have been
 * attached by another function using [method@GdkPixbuf.Pixbuf.set_option].
 *
 * @return a #GHashTable
 *   of key/values pairs
 */
- (GHashTable*)options;

/**
 * Queries a pointer to the pixel data of a pixbuf.
 * 
 * This function will cause an implicit copy of the pixbuf data if the
 * pixbuf was created from read-only data.
 * 
 * Please see the section on [image data](class.Pixbuf.html#image-data) for information
 * about how the pixel data is stored in memory.
 *
 * @return A pointer to the pixbuf's pixel data.
 */
- (guchar*)pixels;

/**
 * Queries a pointer to the pixel data of a pixbuf.
 * 
 * This function will cause an implicit copy of the pixbuf data if the
 * pixbuf was created from read-only data.
 * 
 * Please see the section on [image data](class.Pixbuf.html#image-data) for information
 * about how the pixel data is stored in memory.
 *
 * @param length The length of the binary data.
 * @return A pointer to the pixbuf's
 * pixel data.
 */
- (guchar*)pixelsWithLength:(guint*)length;

/**
 * Queries the rowstride of a pixbuf, which is the number of bytes between
 * the start of a row and the start of the next row.
 *
 * @return Distance between row starts.
 */
- (int)rowstride;

/**
 * Queries the width of a pixbuf.
 *
 * @return Width in pixels.
 */
- (int)width;

/**
 * Creates a new pixbuf which represents a sub-region of `src_pixbuf`.
 * 
 * The new pixbuf shares its pixels with the original pixbuf, so
 * writing to one affects both.  The new pixbuf holds a reference to
 * `src_pixbuf`, so `src_pixbuf` will not be finalized until the new
 * pixbuf is finalized.
 * 
 * Note that if `src_pixbuf` is read-only, this function will force it
 * to be mutable.
 *
 * @param srcX X coord in @src_pixbuf
 * @param srcY Y coord in @src_pixbuf
 * @param width width of region in @src_pixbuf
 * @param height height of region in @src_pixbuf
 * @return a new pixbuf
 */
- (OGGdkPixbuf*)newSubpixbufWithSrcX:(int)srcX srcY:(int)srcY width:(int)width height:(int)height;

/**
 * Provides a #GBytes buffer containing the raw pixel data; the data
 * must not be modified.
 * 
 * This function allows skipping the implicit copy that must be made
 * if gdk_pixbuf_get_pixels() is called on a read-only pixbuf.
 *
 * @return A new reference to a read-only copy of
 *   the pixel data.  Note that for mutable pixbufs, this function will
 *   incur a one-time copy of the pixel data for conversion into the
 *   returned #GBytes.
 */
- (GBytes*)readPixelBytes;

/**
 * Provides a read-only pointer to the raw pixel data.
 * 
 * This function allows skipping the implicit copy that must be made
 * if gdk_pixbuf_get_pixels() is called on a read-only pixbuf.
 *
 * @return a read-only pointer to the raw pixel data
 */
- (const guint8*)readPixels;

/**
 * Removes the key/value pair option attached to a `GdkPixbuf`.
 *
 * @param key a nul-terminated string representing the key to remove.
 * @return `TRUE` if an option was removed, `FALSE` if not.
 */
- (bool)removeOption:(OFString*)key;

/**
 * Rotates a pixbuf by a multiple of 90 degrees, and returns the
 * result in a new pixbuf.
 * 
 * If `angle` is 0, this function will return a copy of `src`.
 *
 * @param angle the angle to rotate by
 * @return the new pixbuf
 */
- (OGGdkPixbuf*)rotateSimple:(GdkPixbufRotation)angle;

/**
 * Modifies saturation and optionally pixelates `src`, placing the result in
 * `dest`.
 * 
 * The `src` and `dest` pixbufs must have the same image format, size, and
 * rowstride.
 * 
 * The `src` and `dest` arguments may be the same pixbuf with no ill effects.
 * 
 * If `saturation` is 1.0 then saturation is not changed. If it's less than 1.0,
 * saturation is reduced (the image turns toward grayscale); if greater than
 * 1.0, saturation is increased (the image gets more vivid colors).
 * 
 * If `pixelate` is `TRUE`, then pixels are faded in a checkerboard pattern to
 * create a pixelated image.
 *
 * @param dest place to write modified version of @src
 * @param saturation saturation factor
 * @param pixelate whether to pixelate
 */
- (void)saturateAndPixelateWithDest:(OGGdkPixbuf*)dest saturation:(gfloat)saturation pixelate:(bool)pixelate;

/**
 * Vector version of `gdk_pixbuf_save_to_buffer()`.
 * 
 * Saves pixbuf to a new buffer in format @type, which is currently "jpeg",
 * "tiff", "png", "ico" or "bmp".
 * 
 * See [method@GdkPixbuf.Pixbuf.save_to_buffer] for more details.
 *
 * @param buffer location to receive a pointer to the new buffer.
 * @param bufferSize location to receive the size of the new buffer.
 * @param type name of file format.
 * @param optionKeys name of options to set
 * @param optionValues values for named options
 * @return whether an error was set
 */
- (bool)saveToBuffervWithBuffer:(gchar**)buffer bufferSize:(gsize*)bufferSize type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues;

/**
 * Vector version of `gdk_pixbuf_save_to_callback()`.
 * 
 * Saves pixbuf to a callback in format @type, which is currently "jpeg",
 * "png", "tiff", "ico" or "bmp".
 * 
 * If @error is set, `FALSE` will be returned.
 * 
 * See [method@GdkPixbuf.Pixbuf.save_to_callback] for more details.
 *
 * @param saveFunc a function that is called to save each block of data that
 *   the save routine generates.
 * @param userData user data to pass to the save function.
 * @param type name of file format.
 * @param optionKeys name of options to set
 * @param optionValues values for named options
 * @return whether an error was set
 */
- (bool)saveToCallbackvWithSaveFunc:(GdkPixbufSaveFunc)saveFunc userData:(gpointer)userData type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues;

/**
 * Saves `pixbuf` to an output stream.
 * 
 * Supported file formats are currently "jpeg", "tiff", "png", "ico" or
 * "bmp".
 * 
 * See [method@GdkPixbuf.Pixbuf.save_to_stream] for more details.
 *
 * @param stream a `GOutputStream` to save the pixbuf to
 * @param type name of file format
 * @param optionKeys name of options to set
 * @param optionValues values for named options
 * @param cancellable optional `GCancellable` object, `NULL` to ignore
 * @return `TRUE` if the pixbuf was saved successfully, `FALSE` if an
 *   error was set.
 */
- (bool)saveToStreamvWithStream:(OGOutputStream*)stream type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues cancellable:(OGCancellable*)cancellable;

/**
 * Saves `pixbuf` to an output stream asynchronously.
 * 
 * For more details see gdk_pixbuf_save_to_streamv(), which is the synchronous
 * version of this function.
 * 
 * When the operation is finished, `callback` will be called in the main thread.
 * 
 * You can then call gdk_pixbuf_save_to_stream_finish() to get the result of
 * the operation.
 *
 * @param stream a `GOutputStream` to which to save the pixbuf
 * @param type name of file format
 * @param optionKeys name of options to set
 * @param optionValues values for named options
 * @param cancellable optional `GCancellable` object, `NULL` to ignore
 * @param callback a `GAsyncReadyCallback` to call when the pixbuf is saved
 * @param userData the data to pass to the callback function
 */
- (void)saveToStreamvAsyncWithStream:(OGOutputStream*)stream type:(OFString*)type optionKeys:(gchar**)optionKeys optionValues:(gchar**)optionValues cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Vector version of `gdk_pixbuf_save()`.
 * 
 * Saves pixbuf to a file in `type`, which is currently "jpeg", "png", "tiff", "ico" or "bmp".
 * 
 * If @error is set, `FALSE` will be returned.
 * 
 * See [method@GdkPixbuf.Pixbuf.save] for more details.
 *
 * @param filename name of file to save.
 * @param type name of file format.
 * @param optionKeys name of options to set
 * @param optionValues values for named options
 * @return whether an error was set
 */
- (bool)savevWithFilename:(OFString*)filename type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues;

/**
 * Creates a transformation of the source image @src by scaling by
 * @scale_x and @scale_y then translating by @offset_x and @offset_y,
 * then renders the rectangle (@dest_x, @dest_y, @dest_width,
 * @dest_height) of the resulting image onto the destination image
 * replacing the previous contents.
 * 
 * Try to use gdk_pixbuf_scale_simple() first; this function is
 * the industrial-strength power tool you can fall back to, if
 * gdk_pixbuf_scale_simple() isn't powerful enough.
 * 
 * If the source rectangle overlaps the destination rectangle on the
 * same pixbuf, it will be overwritten during the scaling which
 * results in rendering artifacts.
 *
 * @param dest the #GdkPixbuf into which to render the results
 * @param destX the left coordinate for region to render
 * @param destY the top coordinate for region to render
 * @param destWidth the width of the region to render
 * @param destHeight the height of the region to render
 * @param offsetX the offset in the X direction (currently rounded to an integer)
 * @param offsetY the offset in the Y direction (currently rounded to an integer)
 * @param scaleX the scale factor in the X direction
 * @param scaleY the scale factor in the Y direction
 * @param interpType the interpolation type for the transformation.
 */
- (void)scaleWithDest:(OGGdkPixbuf*)dest destX:(int)destX destY:(int)destY destWidth:(int)destWidth destHeight:(int)destHeight offsetX:(double)offsetX offsetY:(double)offsetY scaleX:(double)scaleX scaleY:(double)scaleY interpType:(GdkInterpType)interpType;

/**
 * Create a new pixbuf containing a copy of `src` scaled to
 * `dest_width` x `dest_height`.
 * 
 * This function leaves `src` unaffected.
 * 
 * The `interp_type` should be `GDK_INTERP_NEAREST` if you want maximum
 * speed (but when scaling down `GDK_INTERP_NEAREST` is usually unusably
 * ugly). The default `interp_type` should be `GDK_INTERP_BILINEAR` which
 * offers reasonable quality and speed.
 * 
 * You can scale a sub-portion of `src` by creating a sub-pixbuf
 * pointing into `src`; see [method@GdkPixbuf.Pixbuf.new_subpixbuf].
 * 
 * If `dest_width` and `dest_height` are equal to the width and height of
 * `src`, this function will return an unscaled copy of `src`.
 * 
 * For more complicated scaling/alpha blending see [method@GdkPixbuf.Pixbuf.scale]
 * and [method@GdkPixbuf.Pixbuf.composite].
 *
 * @param destWidth the width of destination image
 * @param destHeight the height of destination image
 * @param interpType the interpolation type for the transformation.
 * @return the new pixbuf
 */
- (OGGdkPixbuf*)scaleSimpleWithDestWidth:(int)destWidth destHeight:(int)destHeight interpType:(GdkInterpType)interpType;

/**
 * Attaches a key/value pair as an option to a `GdkPixbuf`.
 * 
 * If `key` already exists in the list of options attached to the `pixbuf`,
 * the new value is ignored and `FALSE` is returned.
 *
 * @param key a nul-terminated string.
 * @param value a nul-terminated string.
 * @return `TRUE` on success
 */
- (bool)setOptionWithKey:(OFString*)key value:(OFString*)value;

@end