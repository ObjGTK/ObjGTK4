/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkSeat.h"

#import "OGGdkDevice.h"
#import "OGGdkDisplay.h"

@implementation OGGdkSeat

- (GdkSeat*)castedGObject
{
	return GDK_SEAT([self gObject]);
}

- (GdkSeatCapabilities)capabilities
{
	GdkSeatCapabilities returnValue = gdk_seat_get_capabilities([self castedGObject]);

	return returnValue;
}

- (GList*)devices:(GdkSeatCapabilities)capabilities
{
	GList* returnValue = gdk_seat_get_devices([self castedGObject], capabilities);

	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_seat_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDevice*)keyboard
{
	GdkDevice* gobjectValue = GDK_DEVICE(gdk_seat_get_keyboard([self castedGObject]));

	OGGdkDevice* returnValue = [OGGdkDevice withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDevice*)pointer
{
	GdkDevice* gobjectValue = GDK_DEVICE(gdk_seat_get_pointer([self castedGObject]));

	OGGdkDevice* returnValue = [OGGdkDevice withGObject:gobjectValue];
	return returnValue;
}

- (GList*)tools
{
	GList* returnValue = gdk_seat_get_tools([self castedGObject]);

	return returnValue;
}


@end