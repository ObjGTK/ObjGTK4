/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkOverlay` is a container which contains a single main child, on top
 * of which it can place “overlay” widgets.
 * 
 * ![An example GtkOverlay](overlay.png)
 * 
 * The position of each overlay widget is determined by its
 * [property@Gtk.Widget:halign] and [property@Gtk.Widget:valign]
 * properties. E.g. a widget with both alignments set to %GTK_ALIGN_START
 * will be placed at the top left corner of the `GtkOverlay` container,
 * whereas an overlay with halign set to %GTK_ALIGN_CENTER and valign set
 * to %GTK_ALIGN_END will be placed a the bottom edge of the `GtkOverlay`,
 * horizontally centered. The position can be adjusted by setting the margin
 * properties of the child to non-zero values.
 * 
 * More complicated placement of overlays is possible by connecting
 * to the [signal@Gtk.Overlay::get-child-position] signal.
 * 
 * An overlay’s minimum and natural sizes are those of its main child.
 * The sizes of overlay children are not considered when measuring these
 * preferred sizes.
 * 
 * # GtkOverlay as GtkBuildable
 * 
 * The `GtkOverlay` implementation of the `GtkBuildable` interface
 * supports placing a child as an overlay by specifying “overlay” as
 * the “type” attribute of a `<child>` element.
 * 
 * # CSS nodes
 * 
 * `GtkOverlay` has a single CSS node with the name “overlay”. Overlay children
 * whose alignments cause them to be positioned at an edge get the style classes
 * “.left”, “.right”, “.top”, and/or “.bottom” according to their position.
 *
 */
@interface OGTKOverlay : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkOverlay*)castedGObject;

/**
 * Adds @widget to @overlay.
 * 
 * The widget will be stacked on top of the main widget
 * added with [method@Gtk.Overlay.set_child].
 * 
 * The position at which @widget is placed is determined
 * from its [property@Gtk.Widget:halign] and
 * [property@Gtk.Widget:valign] properties.
 *
 * @param widget a `GtkWidget` to be added to the container
 */
- (void)addOverlay:(OGTKWidget*)widget;

/**
 * Gets the child widget of @overlay.
 *
 * @return the child widget of @overlay
 */
- (OGTKWidget*)child;

/**
 * Gets whether @widget should be clipped within the parent.
 *
 * @param widget an overlay child of `GtkOverlay`
 * @return whether the widget is clipped within the parent.
 */
- (bool)clipOverlay:(OGTKWidget*)widget;

/**
 * Gets whether @widget's size is included in the measurement of
 * @overlay.
 *
 * @param widget an overlay child of `GtkOverlay`
 * @return whether the widget is measured
 */
- (bool)measureOverlay:(OGTKWidget*)widget;

/**
 * Removes an overlay that was added with gtk_overlay_add_overlay().
 *
 * @param widget a `GtkWidget` to be removed
 */
- (void)removeOverlay:(OGTKWidget*)widget;

/**
 * Sets the child widget of @overlay.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets whether @widget should be clipped within the parent.
 *
 * @param widget an overlay child of `GtkOverlay`
 * @param clipOverlay whether the child should be clipped
 */
- (void)setClipOverlayWithWidget:(OGTKWidget*)widget clipOverlay:(bool)clipOverlay;

/**
 * Sets whether @widget is included in the measured size of @overlay.
 * 
 * The overlay will request the size of the largest child that has
 * this property set to %TRUE. Children who are not included may
 * be drawn outside of @overlay's allocation if they are too large.
 *
 * @param widget an overlay child of `GtkOverlay`
 * @param measure whether the child should be measured
 */
- (void)setMeasureOverlayWithWidget:(OGTKWidget*)widget measure:(bool)measure;

@end