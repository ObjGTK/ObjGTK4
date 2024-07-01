/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkCenterBox` arranges three children in a row, keeping the middle child
 * centered as well as possible.
 * 
 * ![An example GtkCenterBox](centerbox.png)
 * 
 * To add children to `GtkCenterBox`, use [method@Gtk.CenterBox.set_start_widget],
 * [method@Gtk.CenterBox.set_center_widget] and
 * [method@Gtk.CenterBox.set_end_widget].
 * 
 * The sizing and positioning of children can be influenced with the
 * align and expand properties of the children.
 * 
 * # GtkCenterBox as GtkBuildable
 * 
 * The `GtkCenterBox` implementation of the `GtkBuildable` interface
 * supports placing children in the 3 positions by specifying “start”, “center”
 * or “end” as the “type” attribute of a <child> element.
 * 
 * # CSS nodes
 * 
 * `GtkCenterBox` uses a single CSS node with the name “box”,
 * 
 * The first child of the `GtkCenterBox` will be allocated depending on the
 * text direction, i.e. in left-to-right layouts it will be allocated on the
 * left and in right-to-left layouts on the right.
 * 
 * In vertical orientation, the nodes of the children are arranged from top to
 * bottom.
 * 
 * # Accessibility
 * 
 * `GtkCenterBox` uses the %GTK_ACCESSIBLE_ROLE_GROUP role.
 *
 */
@interface OGTKCenterBox : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCenterBox*)castedGObject;

/**
 * Gets the value set by gtk_center_box_set_baseline_position().
 *
 * @return the baseline position
 */
- (GtkBaselinePosition)baselinePosition;

/**
 * Gets the center widget, or %NULL if there is none.
 *
 * @return the center widget.
 */
- (OGTKWidget*)centerWidget;

/**
 * Gets the end widget, or %NULL if there is none.
 *
 * @return the end widget.
 */
- (OGTKWidget*)endWidget;

/**
 * Gets the start widget, or %NULL if there is none.
 *
 * @return the start widget.
 */
- (OGTKWidget*)startWidget;

/**
 * Sets the baseline position of a center box.
 * 
 * This affects only horizontal boxes with at least one baseline
 * aligned child. If there is more vertical space available than
 * requested, and the baseline is not allocated by the parent then
 * @position is used to allocate the baseline wrt. the extra space
 * available.
 *
 * @param position a `GtkBaselinePosition`
 */
- (void)setBaselinePosition:(GtkBaselinePosition)position;

/**
 * Sets the center widget.
 * 
 * To remove the existing center widget, pas %NULL.
 *
 * @param child the new center widget
 */
- (void)setCenterWidget:(OGTKWidget*)child;

/**
 * Sets the end widget.
 * 
 * To remove the existing end widget, pass %NULL.
 *
 * @param child the new end widget
 */
- (void)setEndWidget:(OGTKWidget*)child;

/**
 * Sets the start widget.
 * 
 * To remove the existing start widget, pass %NULL.
 *
 * @param child the new start widget
 */
- (void)setStartWidget:(OGTKWidget*)child;

@end