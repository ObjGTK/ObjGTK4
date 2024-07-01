/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRenderer.h"

/**
 * Renders a pixbuf in a cell
 * 
 * A `GtkCellRendererPixbuf` can be used to render an image in a cell. It allows
 * to render either a given `GdkPixbuf` (set via the
 * `GtkCellRendererPixbuf:pixbuf` property) or a named icon (set via the
 * `GtkCellRendererPixbuf:icon-name` property).
 * 
 * To support the tree view, `GtkCellRendererPixbuf` also supports rendering two
 * alternative pixbufs, when the `GtkCellRenderer:is-expander` property is %TRUE.
 * If the `GtkCellRenderer:is-expanded property` is %TRUE and the
 * `GtkCellRendererPixbuf:pixbuf-expander-open` property is set to a pixbuf, it
 * renders that pixbuf, if the `GtkCellRenderer:is-expanded` property is %FALSE
 * and the `GtkCellRendererPixbuf:pixbuf-expander-closed` property is set to a
 * pixbuf, it renders that one.
 *
 */
@interface OGTKCellRendererPixbuf : OGTKCellRenderer
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCellRendererPixbuf*)castedGObject;

@end