/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * `GtkWidgetPaintable` is a `GdkPaintable` that displays the contents
 * of a widget.
 * 
 * `GtkWidgetPaintable` will also take care of the widget not being in a
 * state where it can be drawn (like when it isn't shown) and just draw
 * nothing or where it does not have a size (like when it is hidden) and
 * report no size in that case.
 * 
 * Of course, `GtkWidgetPaintable` allows you to monitor widgets for size
 * changes by emitting the [signal@Gdk.Paintable::invalidate-size] signal
 * whenever the size of the widget changes as well as for visual changes by
 * emitting the [signal@Gdk.Paintable::invalidate-contents] signal whenever
 * the widget changes.
 * 
 * You can use a `GtkWidgetPaintable` everywhere a `GdkPaintable` is allowed,
 * including using it on a `GtkPicture` (or one of its parents) that it was
 * set on itself via gtk_picture_set_paintable(). The paintable will take care
 * of recursion when this happens. If you do this however, ensure that the
 * [property@Gtk.Picture:can-shrink] property is set to %TRUE or you might
 * end up with an infinitely growing widget.
 *
 */
@interface OGTKWidgetPaintable : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGTKWidget*)widget;

/**
 * Methods
 */

- (GtkWidgetPaintable*)castedGObject;

/**
 * Returns the widget that is observed or %NULL if none.
 *
 * @return the observed widget.
 */
- (OGTKWidget*)widget;

/**
 * Sets the widget that should be observed.
 *
 * @param widget the widget to observe
 */
- (void)setWidget:(OGTKWidget*)widget;

@end