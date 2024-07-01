/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDeviceTool.h"

@implementation OGGdkDeviceTool

- (GdkDeviceTool*)castedGObject
{
	return GDK_DEVICE_TOOL([self gObject]);
}

- (GdkAxisFlags)axes
{
	GdkAxisFlags returnValue = gdk_device_tool_get_axes([self castedGObject]);

	return returnValue;
}

- (guint64)hardwareId
{
	guint64 returnValue = gdk_device_tool_get_hardware_id([self castedGObject]);

	return returnValue;
}

- (guint64)serial
{
	guint64 returnValue = gdk_device_tool_get_serial([self castedGObject]);

	return returnValue;
}

- (GdkDeviceToolType)toolType
{
	GdkDeviceToolType returnValue = gdk_device_tool_get_tool_type([self castedGObject]);

	return returnValue;
}


@end