/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDeviceTool.h"

@implementation OGdkDeviceTool

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DEVICE_TOOL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GdkDeviceTool*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkDeviceTool, GdkDeviceTool);
}

- (GdkAxisFlags)axes
{
	GdkAxisFlags returnValue = (GdkAxisFlags)gdk_device_tool_get_axes([self castedGObject]);

	return returnValue;
}

- (guint64)hardwareId
{
	guint64 returnValue = (guint64)gdk_device_tool_get_hardware_id([self castedGObject]);

	return returnValue;
}

- (guint64)serial
{
	guint64 returnValue = (guint64)gdk_device_tool_get_serial([self castedGObject]);

	return returnValue;
}

- (GdkDeviceToolType)toolType
{
	GdkDeviceToolType returnValue = (GdkDeviceToolType)gdk_device_tool_get_tool_type([self castedGObject]);

	return returnValue;
}


@end