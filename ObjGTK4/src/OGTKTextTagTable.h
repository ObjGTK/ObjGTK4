/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKTextTag;

/**
 * The collection of tags in a `GtkTextBuffer`
 * 
 * You may wish to begin by reading the
 * [text widget conceptual overview](section-text-widget.html),
 * which gives an overview of all the objects and data types
 * related to the text widget and how they work together.
 * 
 * # GtkTextTagTables as GtkBuildable
 * 
 * The `GtkTextTagTable` implementation of the `GtkBuildable` interface
 * supports adding tags by specifying “tag” as the “type” attribute
 * of a `<child>` element.
 * 
 * An example of a UI definition fragment specifying tags:
 * ```xml
 * <object class="GtkTextTagTable">
 *  <child type="tag">
 *    <object class="GtkTextTag"/>
 *  </child>
 * </object>
 * ```
 *
 */
@interface OGTKTextTagTable : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkTextTagTable*)castedGObject;

/**
 * Add a tag to the table.
 * 
 * The tag is assigned the highest priority in the table.
 * 
 * @tag must not be in a tag table already, and may not have
 * the same name as an already-added tag.
 *
 * @param tag a `GtkTextTag`
 * @return %TRUE on success.
 */
- (bool)add:(OGTKTextTag*)tag;

/**
 * Calls @func on each tag in @table, with user data @data.
 * 
 * Note that the table may not be modified while iterating
 * over it (you can’t add/remove tags).
 *
 * @param func a function to call on each tag
 * @param data user data
 */
- (void)foreachWithFunc:(GtkTextTagTableForeach)func data:(gpointer)data;

/**
 * Returns the size of the table (number of tags)
 *
 * @return number of tags in @table
 */
- (int)size;

/**
 * Look up a named tag.
 *
 * @param name name of a tag
 * @return The tag
 */
- (OGTKTextTag*)lookup:(OFString*)name;

/**
 * Remove a tag from the table.
 * 
 * If a `GtkTextBuffer` has @table as its tag table, the tag is
 * removed from the buffer. The table’s reference to the tag is
 * removed, so the tag will end up destroyed if you don’t have
 * a reference to it.
 *
 * @param tag a `GtkTextTag`
 */
- (void)remove:(OGTKTextTag*)tag;

@end