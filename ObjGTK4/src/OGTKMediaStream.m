/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMediaStream.h"

#import <OGdk4/OGdkSurface.h>

@implementation OGTKMediaStream

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_MEDIA_STREAM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_MEDIA_STREAM);
	return gObjectClass;
}

- (GtkMediaStream*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_MEDIA_STREAM, GtkMediaStream);
}

- (void)ended
{
	gtk_media_stream_ended((GtkMediaStream*)[self castedGObject]);
}

- (void)errorValistWithDomain:(GQuark)domain code:(int)code format:(OFString*)format args:(va_list)args
{
	gtk_media_stream_error_valist((GtkMediaStream*)[self castedGObject], domain, code, [format UTF8String], args);
}

- (void)gerror:(GError*)error
{
	gtk_media_stream_gerror((GtkMediaStream*)[self castedGObject], error);
}

- (gint64)duration
{
	gint64 returnValue = (gint64)gtk_media_stream_get_duration((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)hasEnded
{
	bool returnValue = (bool)gtk_media_stream_get_ended((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (const GError*)error
{
	const GError* returnValue = (const GError*)gtk_media_stream_get_error((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)loop
{
	bool returnValue = (bool)gtk_media_stream_get_loop((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)muted
{
	bool returnValue = (bool)gtk_media_stream_get_muted((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)playing
{
	bool returnValue = (bool)gtk_media_stream_get_playing((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (gint64)timestamp
{
	gint64 returnValue = (gint64)gtk_media_stream_get_timestamp((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (double)volume
{
	double returnValue = (double)gtk_media_stream_get_volume((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)hasAudio
{
	bool returnValue = (bool)gtk_media_stream_has_audio((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)hasVideo
{
	bool returnValue = (bool)gtk_media_stream_has_video((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)isPrepared
{
	bool returnValue = (bool)gtk_media_stream_is_prepared((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)isSeekable
{
	bool returnValue = (bool)gtk_media_stream_is_seekable((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (bool)isSeeking
{
	bool returnValue = (bool)gtk_media_stream_is_seeking((GtkMediaStream*)[self castedGObject]);

	return returnValue;
}

- (void)pause
{
	gtk_media_stream_pause((GtkMediaStream*)[self castedGObject]);
}

- (void)play
{
	gtk_media_stream_play((GtkMediaStream*)[self castedGObject]);
}

- (void)preparedWithHasAudio:(bool)hasAudio hasVideo:(bool)hasVideo seekable:(bool)seekable duration:(gint64)duration
{
	gtk_media_stream_prepared((GtkMediaStream*)[self castedGObject], hasAudio, hasVideo, seekable, duration);
}

- (void)realizeWithSurface:(OGdkSurface*)surface
{
	gtk_media_stream_realize((GtkMediaStream*)[self castedGObject], [surface castedGObject]);
}

- (void)seekWithTimestamp:(gint64)timestamp
{
	gtk_media_stream_seek((GtkMediaStream*)[self castedGObject], timestamp);
}

- (void)seekFailed
{
	gtk_media_stream_seek_failed((GtkMediaStream*)[self castedGObject]);
}

- (void)seekSuccess
{
	gtk_media_stream_seek_success((GtkMediaStream*)[self castedGObject]);
}

- (void)setLoop:(bool)loop
{
	gtk_media_stream_set_loop((GtkMediaStream*)[self castedGObject], loop);
}

- (void)setMuted:(bool)muted
{
	gtk_media_stream_set_muted((GtkMediaStream*)[self castedGObject], muted);
}

- (void)setPlaying:(bool)playing
{
	gtk_media_stream_set_playing((GtkMediaStream*)[self castedGObject], playing);
}

- (void)setVolume:(double)volume
{
	gtk_media_stream_set_volume((GtkMediaStream*)[self castedGObject], volume);
}

- (void)streamEnded
{
	gtk_media_stream_stream_ended((GtkMediaStream*)[self castedGObject]);
}

- (void)streamPreparedWithHasAudio:(bool)hasAudio hasVideo:(bool)hasVideo seekable:(bool)seekable duration:(gint64)duration
{
	gtk_media_stream_stream_prepared((GtkMediaStream*)[self castedGObject], hasAudio, hasVideo, seekable, duration);
}

- (void)streamUnprepared
{
	gtk_media_stream_stream_unprepared((GtkMediaStream*)[self castedGObject]);
}

- (void)unprepared
{
	gtk_media_stream_unprepared((GtkMediaStream*)[self castedGObject]);
}

- (void)unrealizeWithSurface:(OGdkSurface*)surface
{
	gtk_media_stream_unrealize((GtkMediaStream*)[self castedGObject], [surface castedGObject]);
}

- (void)updateWithTimestamp:(gint64)timestamp
{
	gtk_media_stream_update((GtkMediaStream*)[self castedGObject], timestamp);
}


@end
