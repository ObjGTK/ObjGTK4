/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaStream.h"

#import <OGdk4/OGGdkSurface.h>

@implementation OGTKMediaStream

- (GtkMediaStream*)castedGObject
{
	return GTK_MEDIA_STREAM([self gObject]);
}

- (void)ended
{
	gtk_media_stream_ended([self castedGObject]);
}

- (void)errorValistWithDomain:(GQuark)domain code:(int)code format:(OFString*)format args:(va_list)args
{
	gtk_media_stream_error_valist([self castedGObject], domain, code, [format UTF8String], args);
}

- (void)gerror:(GError*)error
{
	gtk_media_stream_gerror([self castedGObject], error);
}

- (gint64)duration
{
	gint64 returnValue = gtk_media_stream_get_duration([self castedGObject]);

	return returnValue;
}

- (bool)ended
{
	bool returnValue = gtk_media_stream_get_ended([self castedGObject]);

	return returnValue;
}

- (const GError*)error
{
	const GError* returnValue = gtk_media_stream_get_error([self castedGObject]);

	return returnValue;
}

- (bool)loop
{
	bool returnValue = gtk_media_stream_get_loop([self castedGObject]);

	return returnValue;
}

- (bool)muted
{
	bool returnValue = gtk_media_stream_get_muted([self castedGObject]);

	return returnValue;
}

- (bool)playing
{
	bool returnValue = gtk_media_stream_get_playing([self castedGObject]);

	return returnValue;
}

- (gint64)timestamp
{
	gint64 returnValue = gtk_media_stream_get_timestamp([self castedGObject]);

	return returnValue;
}

- (double)volume
{
	double returnValue = gtk_media_stream_get_volume([self castedGObject]);

	return returnValue;
}

- (bool)hasAudio
{
	bool returnValue = gtk_media_stream_has_audio([self castedGObject]);

	return returnValue;
}

- (bool)hasVideo
{
	bool returnValue = gtk_media_stream_has_video([self castedGObject]);

	return returnValue;
}

- (bool)isPrepared
{
	bool returnValue = gtk_media_stream_is_prepared([self castedGObject]);

	return returnValue;
}

- (bool)isSeekable
{
	bool returnValue = gtk_media_stream_is_seekable([self castedGObject]);

	return returnValue;
}

- (bool)isSeeking
{
	bool returnValue = gtk_media_stream_is_seeking([self castedGObject]);

	return returnValue;
}

- (void)pause
{
	gtk_media_stream_pause([self castedGObject]);
}

- (void)play
{
	gtk_media_stream_play([self castedGObject]);
}

- (void)preparedWithHasAudio:(bool)hasAudio hasVideo:(bool)hasVideo seekable:(bool)seekable duration:(gint64)duration
{
	gtk_media_stream_prepared([self castedGObject], hasAudio, hasVideo, seekable, duration);
}

- (void)realize:(OGGdkSurface*)surface
{
	gtk_media_stream_realize([self castedGObject], [surface castedGObject]);
}

- (void)seek:(gint64)timestamp
{
	gtk_media_stream_seek([self castedGObject], timestamp);
}

- (void)seekFailed
{
	gtk_media_stream_seek_failed([self castedGObject]);
}

- (void)seekSuccess
{
	gtk_media_stream_seek_success([self castedGObject]);
}

- (void)setLoop:(bool)loop
{
	gtk_media_stream_set_loop([self castedGObject], loop);
}

- (void)setMuted:(bool)muted
{
	gtk_media_stream_set_muted([self castedGObject], muted);
}

- (void)setPlaying:(bool)playing
{
	gtk_media_stream_set_playing([self castedGObject], playing);
}

- (void)setVolume:(double)volume
{
	gtk_media_stream_set_volume([self castedGObject], volume);
}

- (void)streamEnded
{
	gtk_media_stream_stream_ended([self castedGObject]);
}

- (void)streamPreparedWithHasAudio:(bool)hasAudio hasVideo:(bool)hasVideo seekable:(bool)seekable duration:(gint64)duration
{
	gtk_media_stream_stream_prepared([self castedGObject], hasAudio, hasVideo, seekable, duration);
}

- (void)streamUnprepared
{
	gtk_media_stream_stream_unprepared([self castedGObject]);
}

- (void)unprepared
{
	gtk_media_stream_unprepared([self castedGObject]);
}

- (void)unrealize:(OGGdkSurface*)surface
{
	gtk_media_stream_unrealize([self castedGObject], [surface castedGObject]);
}

- (void)update:(gint64)timestamp
{
	gtk_media_stream_update([self castedGObject], timestamp);
}


@end