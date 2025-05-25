/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkSeat.h"

#import "OGdkDevice.h"
#import "OGdkDisplay.h"

@implementation OGdkSeat

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_SEAT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_SEAT);
	return gObjectClass;
}

- (GdkSeat*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_SEAT, GdkSeat);
}

- (GdkSeatCapabilities)capabilities
{
	GdkSeatCapabilities returnValue = (GdkSeatCapabilities)gdk_seat_get_capabilities((GdkSeat*)[self castedGObject]);

	return returnValue;
}

- (GList*)devicesWithCapabilities:(GdkSeatCapabilities)capabilities
{
	GList* returnValue = (GList*)gdk_seat_get_devices((GdkSeat*)[self castedGObject], capabilities);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_seat_get_display((GdkSeat*)[self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDevice*)keyboard
{
	GdkDevice* gobjectValue = gdk_seat_get_keyboard((GdkSeat*)[self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDevice*)pointer
{
	GdkDevice* gobjectValue = gdk_seat_get_pointer((GdkSeat*)[self castedGObject]);

	OGdkDevice* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GList*)tools
{
	GList* returnValue = (GList*)gdk_seat_get_tools((GdkSeat*)[self castedGObject]);

	return returnValue;
}


@end