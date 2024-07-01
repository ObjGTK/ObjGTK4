/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkDevice;
@class OGGdkDisplay;

/**
 * The `GdkSeat` object represents a collection of input devices
 * that belong to a user.
 *
 */
@interface OGGdkSeat : OGObject
{

}


/**
 * Methods
 */

- (GdkSeat*)castedGObject;

/**
 * Returns the capabilities this `GdkSeat` currently has.
 *
 * @return the seat capabilities
 */
- (GdkSeatCapabilities)capabilities;

/**
 * Returns the devices that match the given capabilities.
 *
 * @param capabilities capabilities to get devices for
 * @return A list
 *   of `GdkDevices`. The list must be freed with g_list_free(),
 *   the elements are owned by GTK and must not be freed.
 */
- (GList*)devices:(GdkSeatCapabilities)capabilities;

/**
 * Returns the `GdkDisplay` this seat belongs to.
 *
 * @return a `GdkDisplay`. This object
 *   is owned by GTK and must not be freed.
 */
- (OGGdkDisplay*)display;

/**
 * Returns the device that routes keyboard events.
 *
 * @return a `GdkDevice` with keyboard
 *   capabilities. This object is owned by GTK and must not be freed.
 */
- (OGGdkDevice*)keyboard;

/**
 * Returns the device that routes pointer events.
 *
 * @return a `GdkDevice` with pointer
 *   capabilities. This object is owned by GTK and must not be freed.
 */
- (OGGdkDevice*)pointer;

/**
 * Returns all `GdkDeviceTools` that are known to the application.
 *
 * @return A list of tools. Free with g_list_free().
 */
- (GList*)tools;

@end