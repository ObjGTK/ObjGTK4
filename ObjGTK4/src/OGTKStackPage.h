/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * `GtkStackPage` is an auxiliary class used by `GtkStack`.
 *
 */
@interface OGTKStackPage : OGObject
{

}


/**
 * Methods
 */

- (GtkStackPage*)castedGObject;

/**
 * Returns the stack child to which @self belongs.
 *
 * @return the child to which @self belongs
 */
- (OGTKWidget*)child;

/**
 * Returns the icon name of the page.
 *
 * @return The value of the [property@Gtk.StackPage:icon-name] property
 */
- (OFString*)iconName;

/**
 * Returns the name of the page.
 *
 * @return The value of the [property@Gtk.StackPage:name] property
 */
- (OFString*)name;

/**
 * Returns whether the page is marked as “needs attention”.
 *
 * @return The value of the [property@Gtk.StackPage:needs-attention]
 *   property.
 */
- (bool)needsAttention;

/**
 * Gets the page title.
 *
 * @return The value of the [property@Gtk.StackPage:title] property
 */
- (OFString*)title;

/**
 * Gets whether underlines in the page title indicate mnemonics.
 *
 * @return The value of the [property@Gtk.StackPage:use-underline] property
 */
- (bool)useUnderline;

/**
 * Returns whether @page is visible in its `GtkStack`.
 * 
 * This is independent from the [property@Gtk.Widget:visible]
 * property of its widget.
 *
 * @return %TRUE if @page is visible
 */
- (bool)visible;

/**
 * Sets the icon name of the page.
 *
 * @param setting the new value to set
 */
- (void)setIconName:(OFString*)setting;

/**
 * Sets the name of the page.
 *
 * @param setting the new value to set
 */
- (void)setName:(OFString*)setting;

/**
 * Sets whether the page is marked as “needs attention”.
 *
 * @param setting the new value to set
 */
- (void)setNeedsAttention:(bool)setting;

/**
 * Sets the page title.
 *
 * @param setting the new value to set
 */
- (void)setTitle:(OFString*)setting;

/**
 * Sets whether underlines in the page title indicate mnemonics.
 *
 * @param setting the new value to set
 */
- (void)setUseUnderline:(bool)setting;

/**
 * Sets whether @page is visible in its `GtkStack`.
 *
 * @param visible The new property value
 */
- (void)setVisible:(bool)visible;

@end