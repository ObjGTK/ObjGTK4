/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGdkDeviceTool;
@class OGdkDisplay;
@class OGdkSeat;
@class OGdkSurface;

/**
 * The `GdkDevice` object represents an input device, such
 * as a keyboard, a mouse, or a touchpad.
 * 
 * See the [class@Gdk.Seat] documentation for more information
 * about the various kinds of devices, and their relationships.
 *
 */
@interface OGdkDevice : OGObject
{

}


/**
 * Methods
 */

- (GdkDevice*)castedGObject;

/**
 * Retrieves whether the Caps Lock modifier of the keyboard is locked.
 * 
 * This is only relevant for keyboard devices.
 *
 * @return %TRUE if Caps Lock is on for @device
 */
- (bool)capsLockState;

/**
 * Retrieves the current tool for @device.
 *
 * @return the `GdkDeviceTool`
 */
- (OGdkDeviceTool*)deviceTool;

/**
 * Returns the direction of effective layout of the keyboard.
 * 
 * This is only relevant for keyboard devices.
 * 
 * The direction of a layout is the direction of the majority
 * of its symbols. See [func@Pango.unichar_direction].
 *
 * @return %PANGO_DIRECTION_LTR or %PANGO_DIRECTION_RTL
 *   if it can determine the direction. %PANGO_DIRECTION_NEUTRAL
 *   otherwise
 */
- (PangoDirection)direction;

/**
 * Returns the `GdkDisplay` to which @device pertains.
 *
 * @return a `GdkDisplay`
 */
- (OGdkDisplay*)display;

/**
 * Determines whether the pointer follows device motion.
 * 
 * This is not meaningful for keyboard devices, which
 * don't have a pointer.
 *
 * @return %TRUE if the pointer follows device motion
 */
- (bool)hasCursor;

/**
 * Retrieves the current modifier state of the keyboard.
 * 
 * This is only relevant for keyboard devices.
 *
 * @return the current modifier state
 */
- (GdkModifierType)modifierState;

/**
 * The name of the device, suitable for showing in a user interface.
 *
 * @return a name
 */
- (OFString*)name;

/**
 * Retrieves whether the Num Lock modifier of the keyboard is locked.
 * 
 * This is only relevant for keyboard devices.
 *
 * @return %TRUE if Num Lock is on for @device
 */
- (bool)numLockState;

/**
 * Retrieves the number of touch points associated to @device.
 *
 * @return the number of touch points
 */
- (guint)numTouches;

/**
 * Returns the product ID of this device.
 * 
 * This ID is retrieved from the device, and does not change.
 * See [method@Gdk.Device.get_vendor_id] for more information.
 *
 * @return the product ID
 */
- (OFString*)productId;

/**
 * Retrieves whether the Scroll Lock modifier of the keyboard is locked.
 * 
 * This is only relevant for keyboard devices.
 *
 * @return %TRUE if Scroll Lock is on for @device
 */
- (bool)scrollLockState;

/**
 * Returns the `GdkSeat` the device belongs to.
 *
 * @return a `GdkSeat`
 */
- (OGdkSeat*)seat;

/**
 * Determines the type of the device.
 *
 * @return a `GdkInputSource`
 */
- (GdkInputSource)source;

/**
 * Obtains the surface underneath @device, returning the location of the
 * device in @win_x and @win_y.
 * 
 * Returns %NULL if the surface tree under @device is not known to GDK
 * (for example, belongs to another application).
 *
 * @param winX return location for the X coordinate
 *   of the device location relative to the surface origin
 * @param winY return location for the Y coordinate
 *   of the device location relative to the surface origin
 * @return the `GdkSurface` under the
 *   device position
 */
- (OGdkSurface*)surfaceAtPositionWithWinX:(double*)winX winY:(double*)winY;

/**
 * Returns the timestamp of the last activity for this device.
 * 
 * In practice, this means the timestamp of the last event that was
 * received from the OS for this device. (GTK may occasionally produce
 * events for a device that are not received from the OS, and will not
 * update the timestamp).
 *
 * @return the timestamp of the last activity for this device
 */
- (guint32)timestamp;

/**
 * Returns the vendor ID of this device.
 * 
 * This ID is retrieved from the device, and does not change.
 * 
 * This function, together with [method@Gdk.Device.get_product_id],
 * can be used to eg. compose `GSettings` paths to store settings
 * for this device.
 * 
 * ```c
 *  static GSettings *
 *  get_device_settings (GdkDevice *device)
 *  {
 *    const char *vendor, *product;
 *    GSettings *settings;
 *    GdkDevice *device;
 *    char *path;
 * 
 *    vendor = gdk_device_get_vendor_id (device);
 *    product = gdk_device_get_product_id (device);
 * 
 *    path = g_strdup_printf ("/org/example/app/devices/%s:%s/", vendor, product);
 *    settings = g_settings_new_with_path (DEVICE_SCHEMA, path);
 *    g_free (path);
 * 
 *    return settings;
 *  }
 * ```
 *
 * @return the vendor ID
 */
- (OFString*)vendorId;

/**
 * Determines if layouts for both right-to-left and
 * left-to-right languages are in use on the keyboard.
 * 
 * This is only relevant for keyboard devices.
 *
 * @return %TRUE if there are layouts with both directions, %FALSE otherwise
 */
- (bool)hasBidiLayouts;

@end