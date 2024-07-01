/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWidget;

/**
 * A `GtkTextChildAnchor` is a spot in a `GtkTextBuffer` where child widgets can
 * be “anchored”.
 * 
 * The anchor can have multiple widgets anchored, to allow for multiple views.
 *
 */
@interface OGTKTextChildAnchor : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithReplacement:(OFString*)character;

/**
 * Methods
 */

- (GtkTextChildAnchor*)castedGObject;

/**
 * Determines whether a child anchor has been deleted from
 * the buffer.
 * 
 * Keep in mind that the child anchor will be unreferenced
 * when removed from the buffer, so you need to hold your own
 * reference (with g_object_ref()) if you plan to use this
 * function — otherwise all deleted child anchors will also
 * be finalized.
 *
 * @return %TRUE if the child anchor has been deleted from its buffer
 */
- (bool)deleted;

/**
 * Gets a list of all widgets anchored at this child anchor.
 * 
 * The order in which the widgets are returned is not defined.
 *
 * @param outLen return location for the length of the array
 * @return an
 *   array of widgets anchored at @anchor
 */
- (GtkWidget**)widgets:(guint*)outLen;

@end