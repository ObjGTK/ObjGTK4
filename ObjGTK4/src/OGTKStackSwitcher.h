/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKStack;

/**
 * The `GtkStackSwitcher` shows a row of buttons to switch between `GtkStack`
 * pages.
 * 
 * ![An example GtkStackSwitcher](stackswitcher.png)
 * 
 * It acts as a controller for the associated `GtkStack`.
 * 
 * All the content for the buttons comes from the properties of the stacks
 * [class@Gtk.StackPage] objects; the button visibility in a `GtkStackSwitcher`
 * widget is controlled by the visibility of the child in the `GtkStack`.
 * 
 * It is possible to associate multiple `GtkStackSwitcher` widgets
 * with the same `GtkStack` widget.
 * 
 * # CSS nodes
 * 
 * `GtkStackSwitcher` has a single CSS node named stackswitcher and
 * style class .stack-switcher.
 * 
 * When circumstances require it, `GtkStackSwitcher` adds the
 * .needs-attention style class to the widgets representing the
 * stack pages.
 * 
 * # Accessibility
 * 
 * `GtkStackSwitcher` uses the %GTK_ACCESSIBLE_ROLE_TAB_LIST role
 * and uses the %GTK_ACCESSIBLE_ROLE_TAB for its buttons.
 * 
 * # Orientable
 * 
 * Since GTK 4.4, `GtkStackSwitcher` implements `GtkOrientable` allowing
 * the stack switcher to be made vertical with
 * `gtk_orientable_set_orientation()`.
 *
 */
@interface OGTKStackSwitcher : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkStackSwitcher*)castedGObject;

/**
 * Retrieves the stack.
 *
 * @return the stack
 */
- (OGTKStack*)stack;

/**
 * Sets the stack to control.
 *
 * @param stack a `GtkStack`
 */
- (void)setStack:(OGTKStack*)stack;

@end