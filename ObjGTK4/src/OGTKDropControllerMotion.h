/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

@class OGGdkDrop;

/**
 * `GtkDropControllerMotion` is an event controller tracking
 * the pointer during Drag-and-Drop operations.
 * 
 * It is modeled after [class@Gtk.EventControllerMotion] so if you
 * have used that, this should feel really familiar.
 * 
 * This controller is not able to accept drops, use [class@Gtk.DropTarget]
 * for that purpose.
 *
 */
@interface OGTKDropControllerMotion : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkDropControllerMotion*)castedGObject;

/**
 * Returns if a Drag-and-Drop operation is within the widget
 * @self or one of its children.
 *
 * @return %TRUE if a dragging pointer is within @self or one of its children.
 */
- (bool)containsPointer;

/**
 * Returns the `GdkDrop` of a current Drag-and-Drop operation
 * over the widget of @self.
 *
 * @return The `GdkDrop` currently
 *   happening within @self
 */
- (OGGdkDrop*)drop;

/**
 * Returns if a Drag-and-Drop operation is within the widget
 * @self, not one of its children.
 *
 * @return %TRUE if a dragging pointer is within @self but
 *   not one of its children
 */
- (bool)isPointer;

@end