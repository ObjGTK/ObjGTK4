/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkDisplay;

/**
 * `GdkMonitor` objects represent the individual outputs that are
 * associated with a `GdkDisplay`.
 * 
 * `GdkDisplay` keeps a `GListModel` to enumerate and monitor
 * monitors with [method@Gdk.Display.get_monitors]. You can use
 * [method@Gdk.Display.get_monitor_at_surface] to find a particular
 * monitor.
 *
 */
@interface OGGdkMonitor : OGObject
{

}


/**
 * Methods
 */

- (GdkMonitor*)castedGObject;

/**
 * Gets the name of the monitor's connector, if available.
 * 
 * These are strings such as "eDP-1", or "HDMI-2". They depend
 * on software and hardware configuration, and should not be
 * relied on as stable identifiers of a specific monitor.
 *
 * @return the name of the connector
 */
- (OFString*)connector;

/**
 * Gets a string describing the monitor, if available.
 * 
 * This can be used to identify a monitor in the UI.
 *
 * @return the monitor description
 */
- (OFString*)description;

/**
 * Gets the display that this monitor belongs to.
 *
 * @return the display
 */
- (OGGdkDisplay*)display;

/**
 * Retrieves the size and position of the monitor within the
 * display coordinate space.
 * 
 * The returned geometry is in  ”application pixels”, not in
 * ”device pixels” (see [method@Gdk.Monitor.get_scale]).
 *
 * @param geometry a `GdkRectangle` to be filled with the monitor geometry
 */
- (void)geometry:(GdkRectangle*)geometry;

/**
 * Gets the height in millimeters of the monitor.
 *
 * @return the physical height of the monitor
 */
- (int)heightMm;

/**
 * Gets the name or PNP ID of the monitor's manufacturer.
 * 
 * Note that this value might also vary depending on actual
 * display backend.
 * 
 * The PNP ID registry is located at
 * [https://uefi.org/pnp_id_list](https://uefi.org/pnp_id_list).
 *
 * @return the name of the manufacturer
 */
- (OFString*)manufacturer;

/**
 * Gets the string identifying the monitor model, if available.
 *
 * @return the monitor model
 */
- (OFString*)model;

/**
 * Gets the refresh rate of the monitor, if available.
 * 
 * The value is in milli-Hertz, so a refresh rate of 60Hz
 * is returned as 60000.
 *
 * @return the refresh rate in milli-Hertz, or 0
 */
- (int)refreshRate;

/**
 * Gets the internal scale factor that maps from monitor coordinates
 * to device pixels.
 * 
 * This can be used if you want to create pixel based data for a
 * particular monitor, but most of the time you’re drawing to a surface
 * where it is better to use [method@Gdk.Surface.get_scale] instead.
 *
 * @return the scale
 */
- (double)scale;

/**
 * Gets the internal scale factor that maps from monitor coordinates
 * to device pixels.
 * 
 * On traditional systems this is 1, but on very high density outputs
 * it can be a higher value (often 2).
 * 
 * This can be used if you want to create pixel based data for a
 * particular monitor, but most of the time you’re drawing to a surface
 * where it is better to use [method@Gdk.Surface.get_scale_factor] instead.
 *
 * @return the scale factor
 */
- (int)scaleFactor;

/**
 * Gets information about the layout of red, green and blue
 * primaries for pixels.
 *
 * @return the subpixel layout
 */
- (GdkSubpixelLayout)subpixelLayout;

/**
 * Gets the width in millimeters of the monitor.
 *
 * @return the physical width of the monitor
 */
- (int)widthMm;

/**
 * Returns %TRUE if the @monitor object corresponds to a
 * physical monitor.
 * 
 * The @monitor becomes invalid when the physical monitor
 * is unplugged or removed.
 *
 * @return %TRUE if the object corresponds to a physical monitor
 */
- (bool)isValid;

@end