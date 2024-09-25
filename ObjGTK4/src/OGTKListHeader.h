/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * `GtkListHeader` is used by list widgets to represent the headers they
 * display.
 * 
 * `GtkListHeader` objects are managed just like [class@Gtk.ListItem]
 * objects via their factory, but provide a different set of properties suitable
 * for managing the header instead of individual items.
 *
 */
@interface OGTKListHeader : OGObject
{

}


/**
 * Methods
 */

- (GtkListHeader*)castedGObject;

/**
 * Gets the child previously set via gtk_list_header_set_child() or
 * %NULL if none was set.
 *
 * @return The child
 */
- (OGTKWidget*)child;

/**
 * Gets the end position in the model of the section that @self is
 * currently the header for.
 * 
 * If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
 *
 * @return The end position of the section
 */
- (guint)end;

/**
 * Gets the model item at the start of the section.
 * This is the item that occupies the list model at position
 * [property@Gtk.ListHeader:start].
 * 
 * If @self is unbound, this function returns %NULL.
 *
 * @return The item displayed
 */
- (gpointer)item;

/**
 * Gets the the number of items in the section.
 * 
 * If @self is unbound, 0 is returned.
 *
 * @return The number of items in the section
 */
- (guint)nitems;

/**
 * Gets the start position in the model of the section that @self is
 * currently the header for.
 * 
 * If @self is unbound, %GTK_INVALID_LIST_POSITION is returned.
 *
 * @return The start position of the section
 */
- (guint)start;

/**
 * Sets the child to be used for this listitem.
 * 
 * This function is typically called by applications when
 * setting up a header so that the widget can be reused when
 * binding it multiple times.
 *
 * @param child The list item's child or %NULL to unset
 */
- (void)setChild:(OGTKWidget*)child;

@end