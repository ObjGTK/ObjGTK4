/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkFrameClock.h"

@implementation OGGdkFrameClock

- (GdkFrameClock*)castedGObject
{
	return GDK_FRAME_CLOCK([self gObject]);
}

- (void)beginUpdating
{
	gdk_frame_clock_begin_updating([self castedGObject]);
}

- (void)endUpdating
{
	gdk_frame_clock_end_updating([self castedGObject]);
}

- (GdkFrameTimings*)currentTimings
{
	GdkFrameTimings* returnValue = gdk_frame_clock_get_current_timings([self castedGObject]);

	return returnValue;
}

- (double)fps
{
	double returnValue = gdk_frame_clock_get_fps([self castedGObject]);

	return returnValue;
}

- (gint64)frameCounter
{
	gint64 returnValue = gdk_frame_clock_get_frame_counter([self castedGObject]);

	return returnValue;
}

- (gint64)frameTime
{
	gint64 returnValue = gdk_frame_clock_get_frame_time([self castedGObject]);

	return returnValue;
}

- (gint64)historyStart
{
	gint64 returnValue = gdk_frame_clock_get_history_start([self castedGObject]);

	return returnValue;
}

- (void)refreshInfoWithBaseTime:(gint64)baseTime refreshIntervalReturn:(gint64*)refreshIntervalReturn presentationTimeReturn:(gint64*)presentationTimeReturn
{
	gdk_frame_clock_get_refresh_info([self castedGObject], baseTime, refreshIntervalReturn, presentationTimeReturn);
}

- (GdkFrameTimings*)timings:(gint64)frameCounter
{
	GdkFrameTimings* returnValue = gdk_frame_clock_get_timings([self castedGObject], frameCounter);

	return returnValue;
}

- (void)requestPhase:(GdkFrameClockPhase)phase
{
	gdk_frame_clock_request_phase([self castedGObject], phase);
}


@end