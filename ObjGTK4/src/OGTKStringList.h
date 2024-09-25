/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkStringList` is a list model that wraps an array of strings.
 * 
 * The objects in the model are of type [class@Gtk.StringObject] and have
 * a "string" property that can be used inside expressions.
 * 
 * `GtkStringList` is well-suited for any place where you would
 * typically use a `char*[]`, but need a list model.
 * 
 * ## GtkStringList as GtkBuildable
 * 
 * The `GtkStringList` implementation of the `GtkBuildable` interface
 * supports adding items directly using the `<items>` element and
 * specifying `<item>` elements for each item. Each `<item>` element
 * supports the regular translation attributes “translatable”,
 * “context” and “comments”.
 * 
 * Here is a UI definition fragment specifying a `GtkStringList`
 * 
 * ```xml
 * <object class="GtkStringList">
 *   <items>
 *     <item translatable="yes">Factory</item>
 *     <item translatable="yes">Home</item>
 *     <item translatable="yes">Subway</item>
 *   </items>
 * </object>
 * ```
 *
 */
@interface OGTKStringList : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(const char* const*)strings;

/**
 * Methods
 */

- (GtkStringList*)castedGObject;

/**
 * Appends @string to @self.
 * 
 * The @string will be copied. See
 * [method@Gtk.StringList.take] for a way to avoid that.
 *
 * @param string the string to insert
 */
- (void)append:(OFString*)string;

/**
 * Gets the string that is at @position in @self.
 * 
 * If @self does not contain @position items, %NULL is returned.
 * 
 * This function returns the const char *. To get the
 * object wrapping it, use g_list_model_get_item().
 *
 * @param position the position to get the string for
 * @return the string at the given position
 */
- (OFString*)string:(guint)position;

/**
 * Removes the string at @position from @self.
 * 
 * @position must be smaller than the current
 * length of the list.
 *
 * @param position the position of the string that is to be removed
 */
- (void)remove:(guint)position;

/**
 * Changes @self by removing @n_removals strings and adding @additions
 * to it.
 * 
 * This function is more efficient than [method@Gtk.StringList.append]
 * and [method@Gtk.StringList.remove], because it only emits the
 * ::items-changed signal once for the change.
 * 
 * This function copies the strings in @additions.
 * 
 * The parameters @position and @n_removals must be correct (ie:
 * @position + @n_removals must be less than or equal to the length
 * of the list at the time this function is called).
 *
 * @param position the position at which to make the change
 * @param nremovals the number of strings to remove
 * @param additions The strings to add
 */
- (void)spliceWithPosition:(guint)position nremovals:(guint)nremovals additions:(const char* const*)additions;

/**
 * Adds @string to self at the end, and takes
 * ownership of it.
 * 
 * This variant of [method@Gtk.StringList.append]
 * is convenient for formatting strings:
 * 
 * ```c
 * gtk_string_list_take (self, g_strdup_print ("%d dollars", lots));
 * ```
 *
 * @param string the string to insert
 */
- (void)take:(char*)string;

@end