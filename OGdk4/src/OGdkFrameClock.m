/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkFrameClock.h"

@implementation OGdkFrameClock

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_FRAME_CLOCK;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_FRAME_CLOCK);
	return gObjectClass;
}

- (GdkFrameClock*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_FRAME_CLOCK, GdkFrameClock);
}

- (void)beginUpdating
{
	gdk_frame_clock_begin_updating((GdkFrameClock*)[self castedGObject]);
}

- (void)endUpdating
{
	gdk_frame_clock_end_updating((GdkFrameClock*)[self castedGObject]);
}

- (GdkFrameTimings*)currentTimings
{
	GdkFrameTimings* returnValue = (GdkFrameTimings*)gdk_frame_clock_get_current_timings((GdkFrameClock*)[self castedGObject]);

	return returnValue;
}

- (double)fps
{
	double returnValue = (double)gdk_frame_clock_get_fps((GdkFrameClock*)[self castedGObject]);

	return returnValue;
}

- (gint64)frameCounter
{
	gint64 returnValue = (gint64)gdk_frame_clock_get_frame_counter((GdkFrameClock*)[self castedGObject]);

	return returnValue;
}

- (gint64)frameTime
{
	gint64 returnValue = (gint64)gdk_frame_clock_get_frame_time((GdkFrameClock*)[self castedGObject]);

	return returnValue;
}

- (gint64)historyStart
{
	gint64 returnValue = (gint64)gdk_frame_clock_get_history_start((GdkFrameClock*)[self castedGObject]);

	return returnValue;
}

- (void)refreshInfoWithBaseTime:(gint64)baseTime refreshIntervalReturn:(gint64*)refreshIntervalReturn presentationTimeReturn:(gint64*)presentationTimeReturn
{
	gdk_frame_clock_get_refresh_info((GdkFrameClock*)[self castedGObject], baseTime, refreshIntervalReturn, presentationTimeReturn);
}

- (GdkFrameTimings*)timingsWithFrameCounter:(gint64)frameCounter
{
	GdkFrameTimings* returnValue = (GdkFrameTimings*)gdk_frame_clock_get_timings((GdkFrameClock*)[self castedGObject], frameCounter);

	return returnValue;
}

- (void)requestPhase:(GdkFrameClockPhase)phase
{
	gdk_frame_clock_request_phase((GdkFrameClock*)[self castedGObject], phase);
}


@end