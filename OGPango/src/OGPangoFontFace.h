/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <pango/pango.h>

#import <OGObject/OGObject.h>

@class OGPangoFontFamily;

/**
 * A `PangoFontFace` is used to represent a group of fonts with
 * the same family, slant, weight, and width, but varying sizes.
 *
 */
@interface OGPangoFontFace : OGObject
{

}


/**
 * Methods
 */

- (PangoFontFace*)castedGObject;

/**
 * Returns a font description that matches the face.
 * 
 * The resulting font description will have the family, style,
 * variant, weight and stretch of the face, but its size field
 * will be unset.
 *
 * @return a newly-created `PangoFontDescription` structure
 *   holding the description of the face. Use [method@Pango.FontDescription.free]
 *   to free the result.
 */
- (PangoFontDescription*)describe;

/**
 * Gets a name representing the style of this face.
 * 
 * Note that a font family may contain multiple faces
 * with the same name (e.g. a variable and a non-variable
 * face for the same style).
 *
 * @return the face name for the face. This string is
 *   owned by the face object and must not be modified or freed.
 */
- (OFString*)faceName;

/**
 * Gets the `PangoFontFamily` that @face belongs to.
 *
 * @return the `PangoFontFamily`
 */
- (OGPangoFontFamily*)family;

/**
 * Returns whether a `PangoFontFace` is synthesized.
 * 
 * This will be the case if the underlying font rendering engine
 * creates this face from another face, by shearing, emboldening,
 * lightening or modifying it in some other way.
 *
 * @return whether @face is synthesized
 */
- (bool)isSynthesized;

/**
 * List the available sizes for a font.
 * 
 * This is only applicable to bitmap fonts. For scalable fonts, stores
 * %NULL at the location pointed to by @sizes and 0 at the location pointed
 * to by @n_sizes. The sizes returned are in Pango units and are sorted
 * in ascending order.
 *
 * @param sizes location to store a pointer to an array of int. This array
 *   should be freed with g_free().
 * @param nsizes location to store the number of elements in @sizes
 */
- (void)listSizesWithSizes:(int**)sizes nsizes:(int*)nsizes;

@end