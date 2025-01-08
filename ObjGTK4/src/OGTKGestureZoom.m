/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureZoom.h"

@implementation OGTKGestureZoom

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_ZOOM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkGestureZoom* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_zoom_new(), GtkGestureZoom, GtkGestureZoom);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkGestureZoom*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGestureZoom, GtkGestureZoom);
}

- (double)scaleDelta
{
	double returnValue = (double)gtk_gesture_zoom_get_scale_delta([self castedGObject]);

	return returnValue;
}


@end