/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkDevice.h"

#import "OGdkDeviceTool.h"
#import "OGdkDisplay.h"
#import "OGdkSeat.h"
#import "OGdkSurface.h"

@implementation OGdkDevice

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_DEVICE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GdkDevice*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkDevice, GdkDevice);
}

- (bool)capsLockState
{
	bool returnValue = (bool)gdk_device_get_caps_lock_state([self castedGObject]);

	return returnValue;
}

- (OGdkDeviceTool*)deviceTool
{
	GdkDeviceTool* gobjectValue = gdk_device_get_device_tool([self castedGObject]);

	OGdkDeviceTool* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (PangoDirection)direction
{
	PangoDirection returnValue = (PangoDirection)gdk_device_get_direction([self castedGObject]);

	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_device_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasCursor
{
	bool returnValue = (bool)gdk_device_get_has_cursor([self castedGObject]);

	return returnValue;
}

- (GdkModifierType)modifierState
{
	GdkModifierType returnValue = (GdkModifierType)gdk_device_get_modifier_state([self castedGObject]);

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
	bool returnValue = (bool)gdk_device_get_num_lock_state([self castedGObject]);

	return returnValue;
}

- (guint)numTouches
{
	guint returnValue = (guint)gdk_device_get_num_touches([self castedGObject]);

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
	bool returnValue = (bool)gdk_device_get_scroll_lock_state([self castedGObject]);

	return returnValue;
}

- (OGdkSeat*)seat
{
	GdkSeat* gobjectValue = gdk_device_get_seat([self castedGObject]);

	OGdkSeat* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkInputSource)source
{
	GdkInputSource returnValue = (GdkInputSource)gdk_device_get_source([self castedGObject]);

	return returnValue;
}

- (OGdkSurface*)surfaceAtPositionWithWinX:(double*)winX winY:(double*)winY
{
	GdkSurface* gobjectValue = gdk_device_get_surface_at_position([self castedGObject], winX, winY);

	OGdkSurface* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint32)timestamp
{
	guint32 returnValue = (guint32)gdk_device_get_timestamp([self castedGObject]);

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
	bool returnValue = (bool)gdk_device_has_bidi_layouts([self castedGObject]);

	return returnValue;
}


@end