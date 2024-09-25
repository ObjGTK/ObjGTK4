/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

@class OGTKAdjustment;

/**
 * `GtkViewport` implements scrollability for widgets that lack their
 * own scrolling capabilities.
 * 
 * Use `GtkViewport` to scroll child widgets such as `GtkGrid`,
 * `GtkBox`, and so on.
 * 
 * The `GtkViewport` will start scrolling content only if allocated
 * less than the child widget’s minimum size in a given orientation.
 * 
 * # CSS nodes
 * 
 * `GtkViewport` has a single CSS node with name `viewport`.
 * 
 * # Accessibility
 * 
 * Until GTK 4.10, `GtkViewport` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Starting from GTK 4.12, `GtkViewport` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 *
 */
@interface OGTKViewport : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)initWithHadjustment:(OGTKAdjustment*)hadjustment vadjustment:(OGTKAdjustment*)vadjustment;

/**
 * Methods
 */

- (GtkViewport*)castedGObject;

/**
 * Gets the child widget of @viewport.
 *
 * @return the child widget of @viewport
 */
- (OGTKWidget*)child;

/**
 * Gets whether the viewport is scrolling to keep the focused
 * child in view.
 *
 * @return %TRUE if the viewport keeps the focus child scrolled to view
 */
- (bool)scrollToFocus;

/**
 * Scrolls a descendant of the viewport into view.
 * 
 * The viewport and the descendant must be visible and mapped for
 * this function to work, otherwise no scrolling will be performed.
 *
 * @param descendant a descendant widget of the viewport
 * @param scroll details of how to perform
 *   the scroll operation or NULL to scroll into view
 */
- (void)scrollToWithDescendant:(OGTKWidget*)descendant scroll:(GtkScrollInfo*)scroll;

/**
 * Sets the child widget of @viewport.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets whether the viewport should automatically scroll
 * to keep the focused child in view.
 *
 * @param scrollToFocus whether to keep the focus widget scrolled to view
 */
- (void)setScrollToFocus:(bool)scrollToFocus;

@end