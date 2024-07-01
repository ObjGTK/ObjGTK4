/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkActionBar` is designed to present contextual actions.
 * 
 * ![An example GtkActionBar](action-bar.png)
 * 
 * It is expected to be displayed below the content and expand
 * horizontally to fill the area.
 * 
 * It allows placing children at the start or the end. In addition, it
 * contains an internal centered box which is centered with respect to
 * the full width of the box, even if the children at either side take
 * up different amounts of space.
 * 
 * # GtkActionBar as GtkBuildable
 * 
 * The `GtkActionBar` implementation of the `GtkBuildable` interface supports
 * adding children at the start or end sides by specifying “start” or “end” as
 * the “type” attribute of a `<child>` element, or setting the center widget
 * by specifying “center” value.
 * 
 * # CSS nodes
 * 
 * ```
 * actionbar
 * ╰── revealer
 *     ╰── box
 *         ├── box.start
 *         │   ╰── [start children]
 *         ├── [center widget]
 *         ╰── box.end
 *             ╰── [end children]
 * ```
 * 
 * A `GtkActionBar`'s CSS node is called `actionbar`. It contains a `revealer`
 * subnode, which contains a `box` subnode, which contains two `box` subnodes at
 * the start and end of the action bar, with `start` and `end style classes
 * respectively, as well as a center node that represents the center child.
 * 
 * Each of the boxes contains children packed for that side.
 *
 */
@interface OGTKActionBar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkActionBar*)castedGObject;

/**
 * Retrieves the center bar widget of the bar.
 *
 * @return the center `GtkWidget`
 */
- (OGTKWidget*)centerWidget;

/**
 * Gets whether the contents of the action bar are revealed.
 *
 * @return the current value of the [property@Gtk.ActionBar:revealed]
 *   property
 */
- (bool)revealed;

/**
 * Adds @child to @action_bar, packed with reference to the
 * end of the @action_bar.
 *
 * @param child the `GtkWidget` to be added to @action_bar
 */
- (void)packEnd:(OGTKWidget*)child;

/**
 * Adds @child to @action_bar, packed with reference to the
 * start of the @action_bar.
 *
 * @param child the `GtkWidget` to be added to @action_bar
 */
- (void)packStart:(OGTKWidget*)child;

/**
 * Removes a child from @action_bar.
 *
 * @param child the `GtkWidget` to be removed
 */
- (void)remove:(OGTKWidget*)child;

/**
 * Sets the center widget for the `GtkActionBar`.
 *
 * @param centerWidget a widget to use for the center
 */
- (void)setCenterWidget:(OGTKWidget*)centerWidget;

/**
 * Reveals or conceals the content of the action bar.
 * 
 * Note: this does not show or hide @action_bar in the
 * [property@Gtk.Widget:visible] sense, so revealing has
 * no effect if the action bar is hidden.
 *
 * @param revealed The new value of the property
 */
- (void)setRevealed:(bool)revealed;

@end