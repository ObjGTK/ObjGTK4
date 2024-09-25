/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDrawContext.h"

#import "OGGdkSurface.h"
#import "OGGdkDisplay.h"

@implementation OGGdkDrawContext

- (GdkDrawContext*)castedGObject
{
	return GDK_DRAW_CONTEXT([self gObject]);
}

- (void)beginFrame:(const cairo_region_t*)region
{
	gdk_draw_context_begin_frame([self castedGObject], region);
}

- (void)endFrame
{
	gdk_draw_context_end_frame([self castedGObject]);
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_draw_context_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (const cairo_region_t*)frameRegion
{
	const cairo_region_t* returnValue = gdk_draw_context_get_frame_region([self castedGObject]);

	return returnValue;
}

- (OGGdkSurface*)surface
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_draw_context_get_surface([self castedGObject]));

	OGGdkSurface* returnValue = [OGGdkSurface withGObject:gobjectValue];
	return returnValue;
}

- (bool)isInFrame
{
	bool returnValue = gdk_draw_context_is_in_frame([self castedGObject]);

	return returnValue;
}


@end