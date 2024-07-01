/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <pango/pango.h>

#import <OGObject/OGObject.h>

@class OGPangoFont;

/**
 * A `PangoFontset` represents a set of `PangoFont` to use when rendering text.
 * 
 * A `PangoFontset` is the result of resolving a `PangoFontDescription`
 * against a particular `PangoContext`. It has operations for finding the
 * component font for a particular Unicode character, and for finding a
 * composite set of metrics for the entire fontset.
 *
 */
@interface OGPangoFontset : OGObject
{

}


/**
 * Methods
 */

- (PangoFontset*)castedGObject;

/**
 * Iterates through all the fonts in a fontset, calling @func for
 * each one.
 * 
 * If @func returns %TRUE, that stops the iteration.
 *
 * @param func Callback function
 * @param data data to pass to the callback function
 */
- (void)foreachWithFunc:(PangoFontsetForeachFunc)func data:(gpointer)data;

/**
 * Returns the font in the fontset that contains the best
 * glyph for a Unicode character.
 *
 * @param wc a Unicode character
 * @return a `PangoFont`
 */
- (OGPangoFont*)font:(guint)wc;

/**
 * Get overall metric information for the fonts in the fontset.
 *
 * @return a `PangoFontMetrics` object
 */
- (PangoFontMetrics*)metrics;

@end