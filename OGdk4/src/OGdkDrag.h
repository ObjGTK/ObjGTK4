/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGdkContentProvider;
@class OGdkDevice;
@class OGdkDisplay;
@class OGdkSurface;

/**
 * The `GdkDrag` object represents the source of an ongoing DND operation.
 * 
 * A `GdkDrag` is created when a drag is started, and stays alive for duration of
 * the DND operation. After a drag has been started with [func@Gdk.Drag.begin],
 * the caller gets informed about the status of the ongoing drag operation
 * with signals on the `GdkDrag` object.
 * 
 * GTK provides a higher level abstraction based on top of these functions,
 * and so they are not normally needed in GTK applications. See the
 * "Drag and Drop" section of the GTK documentation for more information.
 *
 */
@interface OGdkDrag : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Starts a drag and creates a new drag context for it.
 * 
 * This function is called by the drag source. After this call, you
 * probably want to set up the drag icon using the surface returned
 * by [method@Gdk.Drag.get_drag_surface].
 * 
 * This function returns a reference to the [class@Gdk.Drag] object,
 * but GTK keeps its own reference as well, as long as the DND operation
 * is going on.
 * 
 * Note: if @actions include %GDK_ACTION_MOVE, you need to listen for
 * the [signal@Gdk.Drag::dnd-finished] signal and delete the data at
 * the source if [method@Gdk.Drag.get_selected_action] returns
 * %GDK_ACTION_MOVE.
 *
 * @param surface the source surface for this drag
 * @param device the device that controls this drag
 * @param content the offered content
 * @param actions the actions supported by this drag
 * @param dx the x offset to @device's position where the drag nominally started
 * @param dy the y offset to @device's position where the drag nominally started
 * @return a newly created `GdkDrag`
 */
+ (OGdkDrag*)beginWithSurface:(OGdkSurface*)surface device:(OGdkDevice*)device content:(OGdkContentProvider*)content actions:(GdkDragAction)actions dx:(double)dx dy:(double)dy;

/**
 * Methods
 */

- (GdkDrag*)castedGObject;

/**
 * Informs GDK that the drop ended.
 * 
 * Passing %FALSE for @success may trigger a drag cancellation
 * animation.
 * 
 * This function is called by the drag source, and should be the
 * last call before dropping the reference to the @drag.
 * 
 * The `GdkDrag` will only take the first [method@Gdk.Drag.drop_done]
 * call as effective, if this function is called multiple times,
 * all subsequent calls will be ignored.
 *
 * @param success whether the drag was ultimatively successful
 */
- (void)dropDoneWithSuccess:(bool)success;

/**
 * Determines the bitmask of possible actions proposed by the source.
 *
 * @return the `GdkDragAction` flags
 */
- (GdkDragAction)actions;

/**
 * Returns the `GdkContentProvider` associated to the `GdkDrag` object.
 *
 * @return The `GdkContentProvider` associated to @drag.
 */
- (OGdkContentProvider*)content;

/**
 * Returns the `GdkDevice` associated to the `GdkDrag` object.
 *
 * @return The `GdkDevice` associated to @drag.
 */
- (OGdkDevice*)device;

/**
 * Gets the `GdkDisplay` that the drag object was created for.
 *
 * @return a `GdkDisplay`
 */
- (OGdkDisplay*)display;

/**
 * Returns the surface on which the drag icon should be rendered
 * during the drag operation.
 * 
 * Note that the surface may not be available until the drag operation
 * has begun. GDK will move the surface in accordance with the ongoing
 * drag operation. The surface is owned by @drag and will be destroyed
 * when the drag operation is over.
 *
 * @return the drag surface
 */
- (OGdkSurface*)dragSurface;

/**
 * Retrieves the formats supported by this `GdkDrag` object.
 *
 * @return a `GdkContentFormats`
 */
- (GdkContentFormats*)formats;

/**
 * Determines the action chosen by the drag destination.
 *
 * @return a `GdkDragAction` value
 */
- (GdkDragAction)selectedAction;

/**
 * Returns the `GdkSurface` where the drag originates.
 *
 * @return The `GdkSurface` where the drag originates
 */
- (OGdkSurface*)surface;

/**
 * Sets the position of the drag surface that will be kept
 * under the cursor hotspot.
 * 
 * Initially, the hotspot is at the top left corner of the drag surface.
 *
 * @param hotX x coordinate of the drag surface hotspot
 * @param hotY y coordinate of the drag surface hotspot
 */
- (void)setHotspotWithHotX:(int)hotX hotY:(int)hotY;

@end