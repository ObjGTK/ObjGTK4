/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKLayoutChild;
@class OGTKWidget;

/**
 * Layout managers are delegate classes that handle the preferred size
 * and the allocation of a widget.
 * 
 * You typically subclass `GtkLayoutManager` if you want to implement a
 * layout policy for the children of a widget, or if you want to determine
 * the size of a widget depending on its contents.
 * 
 * Each `GtkWidget` can only have a `GtkLayoutManager` instance associated
 * to it at any given time; it is possible, though, to replace the layout
 * manager instance using [method@Gtk.Widget.set_layout_manager].
 * 
 * ## Layout properties
 * 
 * A layout manager can expose properties for controlling the layout of
 * each child, by creating an object type derived from [class@Gtk.LayoutChild]
 * and installing the properties on it as normal `GObject` properties.
 * 
 * Each `GtkLayoutChild` instance storing the layout properties for a
 * specific child is created through the [method@Gtk.LayoutManager.get_layout_child]
 * method; a `GtkLayoutManager` controls the creation of its `GtkLayoutChild`
 * instances by overriding the GtkLayoutManagerClass.create_layout_child()
 * virtual function. The typical implementation should look like:
 * 
 * ```c
 * static GtkLayoutChild *
 * create_layout_child (GtkLayoutManager *manager,
 *                      GtkWidget        *container,
 *                      GtkWidget        *child)
 * {
 *   return g_object_new (your_layout_child_get_type (),
 *                        "layout-manager", manager,
 *                        "child-widget", child,
 *                        NULL);
 * }
 * ```
 * 
 * The [property@Gtk.LayoutChild:layout-manager] and
 * [property@Gtk.LayoutChild:child-widget] properties
 * on the newly created `GtkLayoutChild` instance are mandatory. The
 * `GtkLayoutManager` will cache the newly created `GtkLayoutChild` instance
 * until the widget is removed from its parent, or the parent removes the
 * layout manager.
 * 
 * Each `GtkLayoutManager` instance creating a `GtkLayoutChild` should use
 * [method@Gtk.LayoutManager.get_layout_child] every time it needs to query
 * the layout properties; each `GtkLayoutChild` instance should call
 * [method@Gtk.LayoutManager.layout_changed] every time a property is
 * updated, in order to queue a new size measuring and allocation.
 *
 */
@interface OGTKLayoutManager : OGObject
{

}


/**
 * Methods
 */

- (GtkLayoutManager*)castedGObject;

/**
 * Assigns the given @width, @height, and @baseline to
 * a @widget, and computes the position and sizes of the children of
 * the @widget using the layout management policy of @manager.
 *
 * @param widget the `GtkWidget` using @manager
 * @param width the new width of the @widget
 * @param height the new height of the @widget
 * @param baseline the baseline position of the @widget, or -1
 */
- (void)allocateWithWidget:(OGTKWidget*)widget width:(int)width height:(int)height baseline:(int)baseline;

/**
 * Retrieves a `GtkLayoutChild` instance for the `GtkLayoutManager`,
 * creating one if necessary.
 * 
 * The @child widget must be a child of the widget using @manager.
 * 
 * The `GtkLayoutChild` instance is owned by the `GtkLayoutManager`,
 * and is guaranteed to exist as long as @child is a child of the
 * `GtkWidget` using the given `GtkLayoutManager`.
 *
 * @param child a `GtkWidget`
 * @return a `GtkLayoutChild`
 */
- (OGTKLayoutChild*)layoutChild:(OGTKWidget*)child;

/**
 * Retrieves the request mode of @manager.
 *
 * @return a `GtkSizeRequestMode`
 */
- (GtkSizeRequestMode)requestMode;

/**
 * Retrieves the `GtkWidget` using the given `GtkLayoutManager`.
 *
 * @return a `GtkWidget`
 */
- (OGTKWidget*)widget;

/**
 * Queues a resize on the `GtkWidget` using @manager, if any.
 * 
 * This function should be called by subclasses of `GtkLayoutManager`
 * in response to changes to their layout management policies.
 *
 */
- (void)layoutChanged;

/**
 * Measures the size of the @widget using @manager, for the
 * given @orientation and size.
 * 
 * See the [class@Gtk.Widget] documentation on layout management for
 * more details.
 *
 * @param widget the `GtkWidget` using @manager
 * @param orientation the orientation to measure
 * @param forSize Size for the opposite of @orientation; for instance, if
 *   the @orientation is %GTK_ORIENTATION_HORIZONTAL, this is the height
 *   of the widget; if the @orientation is %GTK_ORIENTATION_VERTICAL, this
 *   is the width of the widget. This allows to measure the height for the
 *   given width, and the width for the given height. Use -1 if the size
 *   is not known
 * @param minimum the minimum size for the given size and
 *   orientation
 * @param natural the natural, or preferred size for the
 *   given size and orientation
 * @param minimumBaseline the baseline position for the
 *   minimum size
 * @param naturalBaseline the baseline position for the
 *   natural size
 */
- (void)measureWithWidget:(OGTKWidget*)widget orientation:(GtkOrientation)orientation forSize:(int)forSize minimum:(int*)minimum natural:(int*)natural minimumBaseline:(int*)minimumBaseline naturalBaseline:(int*)naturalBaseline;

@end