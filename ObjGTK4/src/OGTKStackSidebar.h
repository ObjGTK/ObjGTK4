/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKStack;

/**
 * A `GtkStackSidebar` uses a sidebar to switch between `GtkStack` pages.
 * 
 * In order to use a `GtkStackSidebar`, you simply use a `GtkStack` to
 * organize your UI flow, and add the sidebar to your sidebar area. You
 * can use [method@Gtk.StackSidebar.set_stack] to connect the `GtkStackSidebar`
 * to the `GtkStack`.
 * 
 * # CSS nodes
 * 
 * `GtkStackSidebar` has a single CSS node with name stacksidebar and
 * style class .sidebar.
 * 
 * When circumstances require it, `GtkStackSidebar` adds the
 * .needs-attention style class to the widgets representing the stack
 * pages.
 *
 */
@interface OGTKStackSidebar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkStackSidebar*)castedGObject;

/**
 * Retrieves the stack.
 *
 * @return the associated `GtkStack` or
 *   %NULL if none has been set explicitly
 */
- (OGTKStack*)stack;

/**
 * Set the `GtkStack` associated with this `GtkStackSidebar`.
 * 
 * The sidebar widget will automatically update according to
 * the order and items within the given `GtkStack`.
 *
 * @param stack a `GtkStack`
 */
- (void)setStack:(OGTKStack*)stack;

@end