/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkDevice.h"

#import "OGGdkSeat.h"
#import "OGGdkDeviceTool.h"
#import "OGGdkDisplay.h"
#import "OGGdkSurface.h"

@implementation OGGdkDevice

- (GdkDevice*)castedGObject
{
	return GDK_DEVICE([self gObject]);
}

- (bool)capsLockState
{
	bool returnValue = gdk_device_get_caps_lock_state([self castedGObject]);

	return returnValue;
}

- (OGGdkDeviceTool*)deviceTool
{
	GdkDeviceTool* gobjectValue = GDK_DEVICE_TOOL(gdk_device_get_device_tool([self castedGObject]));

	OGGdkDeviceTool* returnValue = [OGGdkDeviceTool withGObject:gobjectValue];
	return returnValue;
}

- (PangoDirection)direction
{
	PangoDirection returnValue = gdk_device_get_direction([self castedGObject]);

	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_device_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (bool)hasCursor
{
	bool returnValue = gdk_device_get_has_cursor([self castedGObject]);

	return returnValue;
}

- (GdkModifierType)modifierState
{
	GdkModifierType returnValue = gdk_device_get_modifier_state([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gdk_device_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)numLockState
{
	bool returnValue = gdk_device_get_num_lock_state([self castedGObject]);

	return returnValue;
}

- (guint)numTouches
{
	guint returnValue = gdk_device_get_num_touches([self castedGObject]);

	return returnValue;
}

- (OFString*)productId
{
	const char* gobjectValue = gdk_device_get_product_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)scrollLockState
{
	bool returnValue = gdk_device_get_scroll_lock_state([self castedGObject]);

	return returnValue;
}

- (OGGdkSeat*)seat
{
	GdkSeat* gobjectValue = GDK_SEAT(gdk_device_get_seat([self castedGObject]));

	OGGdkSeat* returnValue = [OGGdkSeat withGObject:gobjectValue];
	return returnValue;
}

- (GdkInputSource)source
{
	GdkInputSource returnValue = gdk_device_get_source([self castedGObject]);

	return returnValue;
}

- (OGGdkSurface*)surfaceAtPositionWithWinX:(double*)winX winY:(double*)winY
{
	GdkSurface* gobjectValue = GDK_SURFACE(gdk_device_get_surface_at_position([self castedGObject], winX, winY));

	OGGdkSurface* returnValue = [OGGdkSurface withGObject:gobjectValue];
	return returnValue;
}

- (guint32)timestamp
{
	guint32 returnValue = gdk_device_get_timestamp([self castedGObject]);

	return returnValue;
}

- (OFString*)vendorId
{
	const char* gobjectValue = gdk_device_get_vendor_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)hasBidiLayouts
{
	bool returnValue = gdk_device_has_bidi_layouts([self castedGObject]);

	return returnValue;
}


@end