/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk-pixbuf/gdk-pixbuf.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGInputStream;
@class OGdkPixbuf;
@class OGdkPixbufAnimationIter;

/**
 * An opaque object representing an animation.
 * 
 * The GdkPixBuf library provides a simple mechanism to load and
 * represent animations. An animation is conceptually a series of
 * frames to be displayed over time.
 * 
 * The animation may not be represented as a series of frames
 * internally; for example, it may be stored as a sprite and
 * instructions for moving the sprite around a background.
 * 
 * To display an animation you don't need to understand its
 * representation, however; you just ask `GdkPixbuf` what should
 * be displayed at a given point in time.
 *
 */
@interface OGdkPixbufAnimation : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Creates a new animation by asynchronously loading an image from an input stream.
 * 
 * For more details see gdk_pixbuf_new_from_stream(), which is the synchronous
 * version of this function.
 * 
 * When the operation is finished, `callback` will be called in the main thread.
 * You can then call gdk_pixbuf_animation_new_from_stream_finish() to get the
 * result of the operation.
 *
 * @param stream a #GInputStream from which to load the animation
 * @param cancellable optional #GCancellable object
 * @param callback a `GAsyncReadyCallback` to call when the pixbuf is loaded
 * @param userData the data to pass to the callback function
 */
+ (void)newFromStreamAsync:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Constructors
 */
+ (instancetype)pixbufAnimationFromFileWithFilename:(OFString*)filename;
+ (instancetype)pixbufAnimationFromResourceWithResourcePath:(OFString*)resourcePath;
+ (instancetype)pixbufAnimationFromStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable;
+ (instancetype)pixbufAnimationFromStreamFinishWithAsyncResult:(GAsyncResult*)asyncResult;

/**
 * Methods
 */

- (GdkPixbufAnimation*)castedGObject;

/**
 * Queries the height of the bounding box of a pixbuf animation.
 *
 * @return Height of the bounding box of the animation.
 */
- (int)height;

/**
 * Get an iterator for displaying an animation.
 * 
 * The iterator provides the frames that should be displayed at a
 * given time.
 * 
 * @start_time would normally come from g_get_current_time(), and marks
 * the beginning of animation playback. After creating an iterator, you
 * should immediately display the pixbuf returned by
 * gdk_pixbuf_animation_iter_get_pixbuf(). Then, you should install
 * a timeout (with g_timeout_add()) or by some other mechanism ensure
 * that you'll update the image after
 * gdk_pixbuf_animation_iter_get_delay_time() milliseconds. Each time
 * the image is updated, you should reinstall the timeout with the new,
 * possibly-changed delay time.
 * 
 * As a shortcut, if @start_time is `NULL`, the result of
 * g_get_current_time() will be used automatically.
 * 
 * To update the image (i.e. possibly change the result of
 * gdk_pixbuf_animation_iter_get_pixbuf() to a new frame of the animation),
 * call gdk_pixbuf_animation_iter_advance().
 * 
 * If you're using #GdkPixbufLoader, in addition to updating the image
 * after the delay time, you should also update it whenever you
 * receive the area_updated signal and
 * gdk_pixbuf_animation_iter_on_currently_loading_frame() returns
 * `TRUE`. In this case, the frame currently being fed into the loader
 * has received new data, so needs to be refreshed. The delay time for
 * a frame may also be modified after an area_updated signal, for
 * example if the delay time for a frame is encoded in the data after
 * the frame itself. So your timeout should be reinstalled after any
 * area_updated signal.
 * 
 * A delay time of -1 is possible, indicating "infinite".
 *
 * @param startTime time when the animation starts playing
 * @return an iterator to move over the animation
 */
- (OGdkPixbufAnimationIter*)iterWithStartTime:(const GTimeVal*)startTime;

/**
 * Retrieves a static image for the animation.
 * 
 * If an animation is really just a plain image (has only one frame),
 * this function returns that image.
 * 
 * If the animation is an animation, this function returns a reasonable
 * image to use as a static unanimated image, which might be the first
 * frame, or something more sophisticated depending on the file format.
 * 
 * If an animation hasn't loaded any frames yet, this function will
 * return `NULL`.
 *
 * @return unanimated image representing the animation
 */
- (OGdkPixbuf*)staticImage;

/**
 * Queries the width of the bounding box of a pixbuf animation.
 *
 * @return Width of the bounding box of the animation.
 */
- (int)width;

/**
 * Checks whether the animation is a static image.
 * 
 * If you load a file with gdk_pixbuf_animation_new_from_file() and it
 * turns out to be a plain, unanimated image, then this function will
 * return `TRUE`. Use gdk_pixbuf_animation_get_static_image() to retrieve
 * the image.
 *
 * @return `TRUE` if the "animation" was really just an image
 */
- (bool)isStaticImage;

@end