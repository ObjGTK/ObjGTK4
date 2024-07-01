/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKTextBuffer;

/**
 * A `GtkTextMark` is a position in a `GtkTextbuffer` that is preserved
 * across modifications.
 * 
 * You may wish to begin by reading the
 * [text widget conceptual overview](section-text-widget.html),
 * which gives an overview of all the objects and data types
 * related to the text widget and how they work together.
 * 
 * A `GtkTextMark` is like a bookmark in a text buffer; it preserves
 * a position in the text. You can convert the mark to an iterator using
 * [method@Gtk.TextBuffer.get_iter_at_mark]. Unlike iterators, marks remain
 * valid across buffer mutations, because their behavior is defined when
 * text is inserted or deleted. When text containing a mark is deleted,
 * the mark remains in the position originally occupied by the deleted
 * text. When text is inserted at a mark, a mark with “left gravity” will
 * be moved to the beginning of the newly-inserted text, and a mark with
 * “right gravity” will be moved to the end.
 * 
 * Note that “left” and “right” here refer to logical direction (left
 * is the toward the start of the buffer); in some languages such as
 * Hebrew the logically-leftmost text is not actually on the left when
 * displayed.
 * 
 * Marks are reference counted, but the reference count only controls
 * the validity of the memory; marks can be deleted from the buffer at
 * any time with [method@Gtk.TextBuffer.delete_mark]. Once deleted from
 * the buffer, a mark is essentially useless.
 * 
 * Marks optionally have names; these can be convenient to avoid passing
 * the `GtkTextMark` object around.
 * 
 * Marks are typically created using the [method@Gtk.TextBuffer.create_mark]
 * function.
 *
 */
@interface OGTKTextMark : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithName:(OFString*)name leftGravity:(bool)leftGravity;

/**
 * Methods
 */

- (GtkTextMark*)castedGObject;

/**
 * Gets the buffer this mark is located inside.
 * 
 * Returns %NULL if the mark is deleted.
 *
 * @return the mark’s `GtkTextBuffer`
 */
- (OGTKTextBuffer*)buffer;

/**
 * Returns %TRUE if the mark has been removed from its buffer.
 * 
 * See [method@Gtk.TextBuffer.add_mark] for a way to add it
 * to a buffer again.
 *
 * @return whether the mark is deleted
 */
- (bool)deleted;

/**
 * Determines whether the mark has left gravity.
 *
 * @return %TRUE if the mark has left gravity, %FALSE otherwise
 */
- (bool)leftGravity;

/**
 * Returns the mark name.
 * 
 * Returns %NULL for anonymous marks.
 *
 * @return mark name
 */
- (OFString*)name;

/**
 * Returns %TRUE if the mark is visible.
 * 
 * A cursor is displayed for visible marks.
 *
 * @return %TRUE if visible
 */
- (bool)visible;

/**
 *
 * @param setting
 */
- (void)setVisible:(bool)setting;

@end