/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureZoom.h"

@implementation OGTKGestureZoom

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_ZOOM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GESTURE_ZOOM);
	return gObjectClass;
}

+ (instancetype)gestureZoom
{
	GtkGestureZoom* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_zoom_new(), GTK_TYPE_GESTURE_ZOOM, GtkGestureZoom);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKGestureZoom* wrapperObject;
	@try {
		wrapperObject = [[OGTKGestureZoom alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGestureZoom*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GESTURE_ZOOM, GtkGestureZoom);
}

- (double)scaleDelta
{
	double returnValue = (double)gtk_gesture_zoom_get_scale_delta((GtkGestureZoom*)[self castedGObject]);

	return returnValue;
}


@end