/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGGdkSurface;

/**
 * `GtkMediaStream` is the integration point for media playback inside GTK.
 * 
 * GTK provides an implementation of the `GtkMediaStream` interface that
 * is called [class@Gtk.MediaFile].
 * 
 * Apart from application-facing API for stream playback, `GtkMediaStream`
 * has a number of APIs that are only useful for implementations and should
 * not be used in applications:
 * [method@Gtk.MediaStream.prepared],
 * [method@Gtk.MediaStream.unprepared],
 * [method@Gtk.MediaStream.update],
 * [method@Gtk.MediaStream.ended],
 * [method@Gtk.MediaStream.seek_success],
 * [method@Gtk.MediaStream.seek_failed],
 * [method@Gtk.MediaStream.gerror],
 * [method@Gtk.MediaStream.error],
 * [method@Gtk.MediaStream.error_valist].
 *
 */
@interface OGTKMediaStream : OGObject
{

}


/**
 * Methods
 */

- (GtkMediaStream*)castedGObject;

/**
 * Pauses the media stream and marks it as ended.
 * 
 * This is a hint only, calls to [method@Gtk.MediaStream.play]
 * may still happen.
 * 
 * The media stream must be prepared when this function is called.
 *
 */
- (void)ended;

/**
 * Sets @self into an error state using a printf()-style format string.
 * 
 * This is a utility function that calls [method@Gtk.MediaStream.gerror].
 * See that function for details.
 *
 * @param domain error domain
 * @param code error code
 * @param format printf()-style format for error message
 * @param args `va_list` of parameters for the message format
 */
- (void)errorValistWithDomain:(GQuark)domain code:(int)code format:(OFString*)format args:(va_list)args;

/**
 * Sets @self into an error state.
 * 
 * This will pause the stream (you can check for an error
 * via [method@Gtk.MediaStream.get_error] in your
 * GtkMediaStream.pause() implementation), abort pending
 * seeks and mark the stream as prepared.
 * 
 * if the stream is already in an error state, this call
 * will be ignored and the existing error will be retained.
 * 
 * To unset an error, the stream must be reset via a call to
 * [method@Gtk.MediaStream.unprepared].
 *
 * @param error the `GError` to set
 */
- (void)gerror:(GError*)error;

/**
 * Gets the duration of the stream.
 * 
 * If the duration is not known, 0 will be returned.
 *
 * @return the duration of the stream or 0 if not known.
 */
- (gint64)duration;

/**
 * Returns whether the streams playback is finished.
 *
 * @return %TRUE if playback is finished
 */
- (bool)ended;

/**
 * If the stream is in an error state, returns the `GError`
 * explaining that state.
 * 
 * Any type of error can be reported here depending on the
 * implementation of the media stream.
 * 
 * A media stream in an error cannot be operated on, calls
 * like [method@Gtk.MediaStream.play] or
 * [method@Gtk.MediaStream.seek] will not have any effect.
 * 
 * `GtkMediaStream` itself does not provide a way to unset
 * an error, but implementations may provide options. For example,
 * a [class@Gtk.MediaFile] will unset errors when a new source is
 * set, e.g. with [method@Gtk.MediaFile.set_file].
 *
 * @return %NULL if not in an
 *   error state or the `GError` of the stream
 */
- (const GError*)error;

/**
 * Returns whether the stream is set to loop.
 * 
 * See [method@Gtk.MediaStream.set_loop] for details.
 *
 * @return %TRUE if the stream should loop
 */
- (bool)loop;

/**
 * Returns whether the audio for the stream is muted.
 * 
 * See [method@Gtk.MediaStream.set_muted] for details.
 *
 * @return %TRUE if the stream is muted
 */
- (bool)muted;

/**
 * Return whether the stream is currently playing.
 *
 * @return %TRUE if the stream is playing
 */
- (bool)playing;

/**
 * Returns the current presentation timestamp in microseconds.
 *
 * @return the timestamp in microseconds
 */
- (gint64)timestamp;

/**
 * Returns the volume of the audio for the stream.
 * 
 * See [method@Gtk.MediaStream.set_volume] for details.
 *
 * @return volume of the stream from 0.0 to 1.0
 */
- (double)volume;

/**
 * Returns whether the stream has audio.
 *
 * @return %TRUE if the stream has audio
 */
- (bool)hasAudio;

/**
 * Returns whether the stream has video.
 *
 * @return %TRUE if the stream has video
 */
- (bool)hasVideo;

/**
 * Returns whether the stream has finished initializing.
 * 
 * At this point the existence of audio and video is known.
 *
 * @return %TRUE if the stream is prepared
 */
- (bool)isPrepared;

/**
 * Checks if a stream may be seekable.
 * 
 * This is meant to be a hint. Streams may not allow seeking even if
 * this function returns %TRUE. However, if this function returns
 * %FALSE, streams are guaranteed to not be seekable and user interfaces
 * may hide controls that allow seeking.
 * 
 * It is allowed to call [method@Gtk.MediaStream.seek] on a non-seekable
 * stream, though it will not do anything.
 *
 * @return %TRUE if the stream may support seeking
 */
- (bool)isSeekable;

/**
 * Checks if there is currently a seek operation going on.
 *
 * @return %TRUE if a seek operation is ongoing.
 */
- (bool)isSeeking;

/**
 * Pauses playback of the stream.
 * 
 * If the stream is not playing, do nothing.
 *
 */
- (void)pause;

/**
 * Starts playing the stream.
 * 
 * If the stream is in error or already playing, do nothing.
 *
 */
- (void)play;

/**
 * Same as gtk_media_stream_stream_prepared().
 *
 * @param hasAudio %TRUE if the stream should advertise audio support
 * @param hasVideo %TRUE if the stream should advertise video support
 * @param seekable %TRUE if the stream should advertise seekability
 * @param duration The duration of the stream or 0 if unknown
 */
- (void)preparedWithHasAudio:(bool)hasAudio hasVideo:(bool)hasVideo seekable:(bool)seekable duration:(gint64)duration;

/**
 * Called by users to attach the media stream to a `GdkSurface` they manage.
 * 
 * The stream can then access the resources of @surface for its
 * rendering purposes. In particular, media streams might want to
 * create a `GdkGLContext` or sync to the `GdkFrameClock`.
 * 
 * Whoever calls this function is responsible for calling
 * [method@Gtk.MediaStream.unrealize] before either the stream
 * or @surface get destroyed.
 * 
 * Multiple calls to this function may happen from different
 * users of the video, even with the same @surface. Each of these
 * calls must be followed by its own call to
 * [method@Gtk.MediaStream.unrealize].
 * 
 * It is not required to call this function to make a media stream work.
 *
 * @param surface a `GdkSurface`
 */
- (void)realize:(OGGdkSurface*)surface;

/**
 * Start a seek operation on @self to @timestamp.
 * 
 * If @timestamp is out of range, it will be clamped.
 * 
 * Seek operations may not finish instantly. While a
 * seek operation is in process, the [property@Gtk.MediaStream:seeking]
 * property will be set.
 * 
 * When calling gtk_media_stream_seek() during an
 * ongoing seek operation, the new seek will override
 * any pending seek.
 *
 * @param timestamp timestamp to seek to.
 */
- (void)seek:(gint64)timestamp;

/**
 * Ends a seek operation started via GtkMediaStream.seek() as a failure.
 * 
 * This will not cause an error on the stream and will assume that
 * playback continues as if no seek had happened.
 * 
 * See [method@Gtk.MediaStream.seek_success] for the other way of
 * ending a seek.
 *
 */
- (void)seekFailed;

/**
 * Ends a seek operation started via GtkMediaStream.seek() successfully.
 * 
 * This function will unset the GtkMediaStream:ended property
 * if it was set.
 * 
 * See [method@Gtk.MediaStream.seek_failed] for the other way of
 * ending a seek.
 *
 */
- (void)seekSuccess;

/**
 * Sets whether the stream should loop.
 * 
 * In this case, it will attempt to restart playback
 * from the beginning instead of stopping at the end.
 * 
 * Not all streams may support looping, in particular
 * non-seekable streams. Those streams will ignore the
 * loop setting and just end.
 *
 * @param loop %TRUE if the stream should loop
 */
- (void)setLoop:(bool)loop;

/**
 * Sets whether the audio stream should be muted.
 * 
 * Muting a stream will cause no audio to be played, but it
 * does not modify the volume. This means that muting and
 * then unmuting the stream will restore the volume settings.
 * 
 * If the stream has no audio, calling this function will
 * still work but it will not have an audible effect.
 *
 * @param muted %TRUE if the stream should be muted
 */
- (void)setMuted:(bool)muted;

/**
 * Starts or pauses playback of the stream.
 *
 * @param playing whether to start or pause playback
 */
- (void)setPlaying:(bool)playing;

/**
 * Sets the volume of the audio stream.
 * 
 * This function call will work even if the stream is muted.
 * 
 * The given @volume should range from 0.0 for silence to 1.0
 * for as loud as possible. Values outside of this range will
 * be clamped to the nearest value.
 * 
 * If the stream has no audio or is muted, calling this function
 * will still work but it will not have an immediate audible effect.
 * When the stream is unmuted, the new volume setting will take effect.
 *
 * @param volume New volume of the stream from 0.0 to 1.0
 */
- (void)setVolume:(double)volume;

/**
 * Pauses the media stream and marks it as ended.
 * 
 * This is a hint only, calls to [method@Gtk.MediaStream.play]
 * may still happen.
 * 
 * The media stream must be prepared when this function is called.
 *
 */
- (void)streamEnded;

/**
 * Called by `GtkMediaStream` implementations to advertise the stream
 * being ready to play and providing details about the stream.
 * 
 * Note that the arguments are hints. If the stream implementation
 * cannot determine the correct values, it is better to err on the
 * side of caution and return %TRUE. User interfaces will use those
 * values to determine what controls to show.
 * 
 * This function may not be called again until the stream has been
 * reset via [method@Gtk.MediaStream.stream_unprepared].
 *
 * @param hasAudio %TRUE if the stream should advertise audio support
 * @param hasVideo %TRUE if the stream should advertise video support
 * @param seekable %TRUE if the stream should advertise seekability
 * @param duration The duration of the stream or 0 if unknown
 */
- (void)streamPreparedWithHasAudio:(bool)hasAudio hasVideo:(bool)hasVideo seekable:(bool)seekable duration:(gint64)duration;

/**
 * Resets a given media stream implementation.
 * 
 * [method@Gtk.MediaStream.stream_prepared] can then be called again.
 * 
 * This function will also reset any error state the stream was in.
 *
 */
- (void)streamUnprepared;

/**
 * Same as gtk_media_stream_stream_unprepared().
 *
 */
- (void)unprepared;

/**
 * Undoes a previous call to gtk_media_stream_realize().
 * 
 * This causes the stream to release all resources it had
 * allocated from @surface.
 *
 * @param surface the `GdkSurface` the stream was realized with
 */
- (void)unrealize:(OGGdkSurface*)surface;

/**
 * Media stream implementations should regularly call this
 * function to update the timestamp reported by the stream.
 * 
 * It is up to implementations to call this at the frequency
 * they deem appropriate.
 * 
 * The media stream must be prepared when this function is called.
 *
 * @param timestamp the new timestamp
 */
- (void)update:(gint64)timestamp;

@end