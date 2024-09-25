/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureStylus.h"

#import <OGdk4/OGGdkDeviceTool.h>
#import "OGTKGesture.h"

@implementation OGTKGestureStylus

- (instancetype)init
{
	GtkGestureStylus* gobjectValue = GTK_GESTURE_STYLUS(gtk_gesture_stylus_new());

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
	return GTK_GESTURE_STYLUS([self gObject]);
}

- (bool)axesWithAxes:(GdkAxisUse*)axes values:(double**)values
{
	bool returnValue = gtk_gesture_stylus_get_axes([self castedGObject], axes, values);

	return returnValue;
}

- (bool)axisWithAxis:(GdkAxisUse)axis value:(double*)value
{
	bool returnValue = gtk_gesture_stylus_get_axis([self castedGObject], axis, value);

	return returnValue;
}

- (bool)backlogWithBacklog:(GdkTimeCoord**)backlog nelems:(guint*)nelems
{
	bool returnValue = gtk_gesture_stylus_get_backlog([self castedGObject], backlog, nelems);

	return returnValue;
}

- (OGGdkDeviceTool*)deviceTool
{
	GdkDeviceTool* gobjectValue = GDK_DEVICE_TOOL(gtk_gesture_stylus_get_device_tool([self castedGObject]));

	OGGdkDeviceTool* returnValue = [OGGdkDeviceTool withGObject:gobjectValue];
	return returnValue;
}

- (bool)stylusOnly
{
	bool returnValue = gtk_gesture_stylus_get_stylus_only([self castedGObject]);

	return returnValue;
}

- (void)setStylusOnly:(bool)stylusOnly
{
	gtk_gesture_stylus_set_stylus_only([self castedGObject], stylusOnly);
}


@end