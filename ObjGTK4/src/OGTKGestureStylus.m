/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureStylus.h"

#import <OGdk4/OGdkDeviceTool.h>
#import "OGTKGesture.h"

@implementation OGTKGestureStylus

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GESTURE_STYLUS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkGestureStylus* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_gesture_stylus_new(), GtkGestureStylus, GtkGestureStylus);

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

- (GtkGestureStylus*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGestureStylus, GtkGestureStylus);
}

- (bool)axesWithAxes:(GdkAxisUse*)axes values:(double**)values
{
	bool returnValue = (bool)gtk_gesture_stylus_get_axes([self castedGObject], axes, values);

	return returnValue;
}

- (bool)axisWithAxis:(GdkAxisUse)axis value:(double*)value
{
	bool returnValue = (bool)gtk_gesture_stylus_get_axis([self castedGObject], axis, value);

	return returnValue;
}

- (bool)backlogWithBacklog:(GdkTimeCoord**)backlog nelems:(guint*)nelems
{
	bool returnValue = (bool)gtk_gesture_stylus_get_backlog([self castedGObject], backlog, nelems);

	return returnValue;
}

- (OGdkDeviceTool*)deviceTool
{
	GdkDeviceTool* gobjectValue = gtk_gesture_stylus_get_device_tool([self castedGObject]);

	OGdkDeviceTool* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)stylusOnly
{
	bool returnValue = (bool)gtk_gesture_stylus_get_stylus_only([self castedGObject]);

	return returnValue;
}

- (void)setStylusOnly:(bool)stylusOnly
{
	gtk_gesture_stylus_set_stylus_only([self castedGObject], stylusOnly);
}


@end