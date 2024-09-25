/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * A widget with two panes, arranged either horizontally or vertically.
 * 
 * ![An example GtkPaned](panes.png)
 * 
 * The division between the two panes is adjustable by the user
 * by dragging a handle.
 * 
 * Child widgets are added to the panes of the widget with
 * [method@Gtk.Paned.set_start_child] and [method@Gtk.Paned.set_end_child].
 * The division between the two children is set by default from the size
 * requests of the children, but it can be adjusted by the user.
 * 
 * A paned widget draws a separator between the two child widgets and a
 * small handle that the user can drag to adjust the division. It does not
 * draw any relief around the children or around the separator. (The space
 * in which the separator is called the gutter.) Often, it is useful to put
 * each child inside a [class@Gtk.Frame] so that the gutter appears as a
 * ridge. No separator is drawn if one of the children is missing.
 * 
 * Each child has two options that can be set, "resize" and "shrink". If
 * "resize" is true then, when the `GtkPaned` is resized, that child will
 * expand or shrink along with the paned widget. If "shrink" is true, then
 * that child can be made smaller than its requisition by the user.
 * Setting "shrink" to false allows the application to set a minimum size.
 * If "resize" is false for both children, then this is treated as if
 * "resize" is true for both children.
 * 
 * The application can set the position of the slider as if it were set
 * by the user, by calling [method@Gtk.Paned.set_position].
 * 
 * # CSS nodes
 * 
 * ```
 * paned
 * ├── <child>
 * ├── separator[.wide]
 * ╰── <child>
 * ```
 * 
 * `GtkPaned` has a main CSS node with name paned, and a subnode for
 * the separator with name separator. The subnode gets a .wide style
 * class when the paned is supposed to be wide.
 * 
 * In horizontal orientation, the nodes are arranged based on the text
 * direction, so in left-to-right mode, :first-child will select the
 * leftmost child, while it will select the rightmost child in
 * RTL layouts.
 * 
 * ## Creating a paned widget with minimum sizes.
 * 
 * ```c
 * GtkWidget *hpaned = gtk_paned_new (GTK_ORIENTATION_HORIZONTAL);
 * GtkWidget *frame1 = gtk_frame_new (NULL);
 * GtkWidget *frame2 = gtk_frame_new (NULL);
 * 
 * gtk_widget_set_size_request (hpaned, 200, -1);
 * 
 * gtk_paned_set_start_child (GTK_PANED (hpaned), frame1);
 * gtk_paned_set_resize_start_child (GTK_PANED (hpaned), TRUE);
 * gtk_paned_set_shrink_start_child (GTK_PANED (hpaned), FALSE);
 * gtk_widget_set_size_request (frame1, 50, -1);
 * 
 * gtk_paned_set_end_child (GTK_PANED (hpaned), frame2);
 * gtk_paned_set_resize_end_child (GTK_PANED (hpaned), FALSE);
 * gtk_paned_set_shrink_end_child (GTK_PANED (hpaned), FALSE);
 * gtk_widget_set_size_request (frame2, 50, -1);
 * ```
 *
 */
@interface OGTKPaned : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkOrientation)orientation;

/**
 * Methods
 */

- (GtkPaned*)castedGObject;

/**
 * Retrieves the end child of the given `GtkPaned`.
 *
 * @return the end child widget
 */
- (OGTKWidget*)endChild;

/**
 * Obtains the position of the divider between the two panes.
 *
 * @return the position of the divider, in pixels
 */
- (int)position;

/**
 * Returns whether the [property@Gtk.Paned:end-child] can be resized.
 *
 * @return true if the end child is resizable
 */
- (bool)resizeEndChild;

/**
 * Returns whether the [property@Gtk.Paned:start-child] can be resized.
 *
 * @return true if the start child is resizable
 */
- (bool)resizeStartChild;

/**
 * Returns whether the [property@Gtk.Paned:end-child] can shrink.
 *
 * @return true if the end child is shrinkable
 */
- (bool)shrinkEndChild;

/**
 * Returns whether the [property@Gtk.Paned:start-child] can shrink.
 *
 * @return true if the start child is shrinkable
 */
- (bool)shrinkStartChild;

/**
 * Retrieves the start child of the given `GtkPaned`.
 *
 * @return the start child widget
 */
- (OGTKWidget*)startChild;

/**
 * Gets whether the separator should be wide.
 *
 * @return %TRUE if the paned should have a wide handle
 */
- (bool)wideHandle;

/**
 * Sets the end child of @paned to @child.
 * 
 * If @child is `NULL`, the existing child will be removed.
 *
 * @param child the widget to add
 */
- (void)setEndChild:(OGTKWidget*)child;

/**
 * Sets the position of the divider between the two panes.
 *
 * @param position pixel position of divider, a negative value means that the position
 *   is unset
 */
- (void)setPosition:(int)position;

/**
 * Sets whether the [property@Gtk.Paned:end-child] can be resized.
 *
 * @param resize true to let the end child be resized
 */
- (void)setResizeEndChild:(bool)resize;

/**
 * Sets whether the [property@Gtk.Paned:start-child] can be resized.
 *
 * @param resize true to let the start child be resized
 */
- (void)setResizeStartChild:(bool)resize;

/**
 * Sets whether the [property@Gtk.Paned:end-child] can shrink.
 *
 * @param resize true to let the end child be shrunk
 */
- (void)setShrinkEndChild:(bool)resize;

/**
 * Sets whether the [property@Gtk.Paned:start-child] can shrink.
 *
 * @param resize true to let the start child be shrunk
 */
- (void)setShrinkStartChild:(bool)resize;

/**
 * Sets the start child of @paned to @child.
 * 
 * If @child is `NULL`, the existing child will be removed.
 *
 * @param child the widget to add
 */
- (void)setStartChild:(OGTKWidget*)child;

/**
 * Sets whether the separator should be wide.
 *
 * @param wide the new value for the [property@Gtk.Paned:wide-handle] property
 */
- (void)setWideHandle:(bool)wide;

@end