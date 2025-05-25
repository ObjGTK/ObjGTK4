/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDrawContext.h"

#import "OGdkDisplay.h"
#import "OGdkSurface.h"

@implementation OGdkDrawContext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DRAW_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_DRAW_CONTEXT);
	return gObjectClass;
}

- (GdkDrawContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_DRAW_CONTEXT, GdkDrawContext);
}

- (void)beginFrameWithRegion:(const cairo_region_t*)region
{
	gdk_draw_context_begin_frame((GdkDrawContext*)[self castedGObject], region);
}

- (void)endFrame
{
	gdk_draw_context_end_frame((GdkDrawContext*)[self castedGObject]);
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_draw_context_get_display((GdkDrawContext*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (const cairo_region_t*)frameRegion
{
	const cairo_region_t* returnValue = (const cairo_region_t*)gdk_draw_context_get_frame_region((GdkDrawContext*)[self castedGObject]);

	return returnValue;
}

- (OGdkSurface*)surface
{
	GdkSurface* gobjectValue = gdk_draw_context_get_surface((GdkDrawContext*)[self castedGObject]);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)isInFrame
{
	bool returnValue = (bool)gdk_draw_context_is_in_frame((GdkDrawContext*)[self castedGObject]);

	return returnValue;
}


@end