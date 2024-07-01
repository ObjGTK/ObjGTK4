/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGGdkDrag;

/**
 * `GtkDragIcon` is a `GtkRoot` implementation for drag icons.
 * 
 * A drag icon moves with the pointer during a Drag-and-Drop operation
 * and is destroyed when the drag ends.
 * 
 * To set up a drag icon and associate it with an ongoing drag operation,
 * use [func@Gtk.DragIcon.get_for_drag] to get the icon for a drag. You can
 * then use it like any other widget and use [method@Gtk.DragIcon.set_child]
 * to set whatever widget should be used for the drag icon.
 * 
 * Keep in mind that drag icons do not allow user input.
 *
 */
@interface OGTKDragIcon : OGTKWidget
{

}

/**
 * Functions
 */

/**
 * Creates a widget that can be used as a drag icon for the given
 * @value.
 * 
 * Supported types include strings, `GdkRGBA` and `GtkTextBuffer`.
 * If GTK does not know how to create a widget for a given value,
 * it will return %NULL.
 * 
 * This method is used to set the default drag icon on drag-and-drop
 * operations started by `GtkDragSource`, so you don't need to set
 * a drag icon using this function there.
 *
 * @param value a `GValue`
 * @return A new `GtkWidget`
 *   for displaying @value as a drag icon.
 */
+ (OGTKWidget*)createWidgetForValue:(const GValue*)value;

/**
 * Gets the `GtkDragIcon` in use with @drag.
 * 
 * If no drag icon exists yet, a new one will be created
 * and shown.
 *
 * @param drag a `GdkDrag`
 * @return the `GtkDragIcon`
 */
+ (OGTKWidget*)forDrag:(OGGdkDrag*)drag;

/**
 * Creates a `GtkDragIcon` that shows @paintable, and associates
 * it with the drag operation.
 * 
 * The hotspot position on the paintable is aligned with the
 * hotspot of the cursor.
 *
 * @param drag a `GdkDrag`
 * @param paintable a `GdkPaintable` to display
 * @param hotX X coordinate of the hotspot
 * @param hotY Y coordinate of the hotspot
 */
+ (void)setFromPaintableWithDrag:(OGGdkDrag*)drag paintable:(GdkPaintable*)paintable hotX:(int)hotX hotY:(int)hotY;

/**
 * Methods
 */

- (GtkDragIcon*)castedGObject;

/**
 * Gets the widget currently used as drag icon.
 *
 * @return The drag icon
 */
- (OGTKWidget*)child;

/**
 * Sets the widget to display as the drag icon.
 *
 * @param child a `GtkWidget`
 */
- (void)setChild:(OGTKWidget*)child;

@end