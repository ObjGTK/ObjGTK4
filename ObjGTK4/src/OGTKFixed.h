/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkFixed` places its child widgets at fixed positions and with fixed sizes.
 * 
 * `GtkFixed` performs no automatic layout management.
 * 
 * For most applications, you should not use this container! It keeps
 * you from having to learn about the other GTK containers, but it
 * results in broken applications.  With `GtkFixed`, the following
 * things will result in truncated text, overlapping widgets, and
 * other display bugs:
 * 
 * - Themes, which may change widget sizes.
 * 
 * - Fonts other than the one you used to write the app will of course
 *   change the size of widgets containing text; keep in mind that
 *   users may use a larger font because of difficulty reading the
 *   default, or they may be using a different OS that provides different fonts.
 * 
 * - Translation of text into other languages changes its size. Also,
 *   display of non-English text will use a different font in many
 *   cases.
 * 
 * In addition, `GtkFixed` does not pay attention to text direction and
 * thus may produce unwanted results if your app is run under right-to-left
 * languages such as Hebrew or Arabic. That is: normally GTK will order
 * containers appropriately for the text direction, e.g. to put labels to
 * the right of the thing they label when using an RTL language, but it can’t
 * do that with `GtkFixed`. So if you need to reorder widgets depending on
 * the text direction, you would need to manually detect it and adjust child
 * positions accordingly.
 * 
 * Finally, fixed positioning makes it kind of annoying to add/remove
 * UI elements, since you have to reposition all the other elements. This
 * is a long-term maintenance problem for your application.
 * 
 * If you know none of these things are an issue for your application,
 * and prefer the simplicity of `GtkFixed`, by all means use the
 * widget. But you should be aware of the tradeoffs.
 *
 */
@interface OGTKFixed : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkFixed*)castedGObject;

/**
 * Retrieves the translation transformation of the
 * given child `GtkWidget` in the `GtkFixed`.
 * 
 * See also: [method@Gtk.Fixed.get_child_transform].
 *
 * @param widget a child of @fixed
 * @param x the horizontal position of the @widget
 * @param y the vertical position of the @widget
 */
- (void)childPositionWithWidget:(OGTKWidget*)widget x:(double*)x y:(double*)y;

/**
 * Retrieves the transformation for @widget set using
 * gtk_fixed_set_child_transform().
 *
 * @param widget a `GtkWidget`, child of @fixed
 * @return a `GskTransform`
 */
- (GskTransform*)childTransform:(OGTKWidget*)widget;

/**
 * Sets a translation transformation to the given @x and @y
 * coordinates to the child @widget of the `GtkFixed`.
 *
 * @param widget the child widget
 * @param x the horizontal position to move the widget to
 * @param y the vertical position to move the widget to
 */
- (void)moveWithWidget:(OGTKWidget*)widget x:(double)x y:(double)y;

/**
 * Adds a widget to a `GtkFixed` at the given position.
 *
 * @param widget the widget to add
 * @param x the horizontal position to place the widget at
 * @param y the vertical position to place the widget at
 */
- (void)putWithWidget:(OGTKWidget*)widget x:(double)x y:(double)y;

/**
 * Removes a child from @fixed.
 *
 * @param widget the child widget to remove
 */
- (void)remove:(OGTKWidget*)widget;

/**
 * Sets the transformation for @widget.
 * 
 * This is a convenience function that retrieves the
 * [class@Gtk.FixedLayoutChild] instance associated to
 * @widget and calls [method@Gtk.FixedLayoutChild.set_transform].
 *
 * @param widget a `GtkWidget`, child of @fixed
 * @param transform the transformation assigned to @widget
 *   to reset @widget's transform
 */
- (void)setChildTransformWithWidget:(OGTKWidget*)widget transform:(GskTransform*)transform;

@end