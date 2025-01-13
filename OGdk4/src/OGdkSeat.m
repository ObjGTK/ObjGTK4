/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkSeat.h"

#import "OGdkDevice.h"
#import "OGdkDisplay.h"

@implementation OGdkSeat

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_SEAT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GdkSeat*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkSeat, GdkSeat);
}

- (GdkSeatCapabilities)capabilities
{
	GdkSeatCapabilities returnValue = (GdkSeatCapabilities)gdk_seat_get_capabilities([self castedGObject]);

	return returnValue;
}

- (GList*)devicesWithCapabilities:(GdkSeatCapabilities)capabilities
{
	GList* returnValue = (GList*)gdk_seat_get_devices([self castedGObject], capabilities);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_seat_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDevice*)keyboard
{
	GdkDevice* gobjectValue = gdk_seat_get_keyboard([self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDevice*)pointer
{
	GdkDevice* gobjectValue = gdk_seat_get_pointer([self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)tools
{
	GList* returnValue = (GList*)gdk_seat_get_tools([self castedGObject]);

	return returnValue;
}


@end