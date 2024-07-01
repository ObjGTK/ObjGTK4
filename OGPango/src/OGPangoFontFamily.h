/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <pango/pango.h>

#import <OGObject/OGObject.h>

@class OGPangoFontFace;

/**
 * A `PangoFontFamily` is used to represent a family of related
 * font faces.
 * 
 * The font faces in a family share a common design, but differ in
 * slant, weight, width or other aspects.
 *
 */
@interface OGPangoFontFamily : OGObject
{

}


/**
 * Methods
 */

- (PangoFontFamily*)castedGObject;

/**
 * Gets the `PangoFontFace` of @family with the given name.
 *
 * @param name the name of a face. If the name is %NULL,
 *   the family's default face (fontconfig calls it "Regular")
 *   will be returned.
 * @return the `PangoFontFace`,
 *   or %NULL if no face with the given name exists.
 */
- (OGPangoFontFace*)face:(OFString*)name;

/**
 * Gets the name of the family.
 * 
 * The name is unique among all fonts for the font backend and can
 * be used in a `PangoFontDescription` to specify that a face from
 * this family is desired.
 *
 * @return the name of the family. This string is owned
 *   by the family object and must not be modified or freed.
 */
- (OFString*)name;

/**
 * A monospace font is a font designed for text display where the the
 * characters form a regular grid.
 * 
 * For Western languages this would
 * mean that the advance width of all characters are the same, but
 * this categorization also includes Asian fonts which include
 * double-width characters: characters that occupy two grid cells.
 * g_unichar_iswide() returns a result that indicates whether a
 * character is typically double-width in a monospace font.
 * 
 * The best way to find out the grid-cell size is to call
 * [method@Pango.FontMetrics.get_approximate_digit_width], since the
 * results of [method@Pango.FontMetrics.get_approximate_char_width] may
 * be affected by double-width characters.
 *
 * @return %TRUE if the family is monospace.
 */
- (bool)isMonospace;

/**
 * A variable font is a font which has axes that can be modified to
 * produce different faces.
 * 
 * Such axes are also known as _variations_; see
 * [method@Pango.FontDescription.set_variations] for more information.
 *
 * @return %TRUE if the family is variable
 */
- (bool)isVariable;

/**
 * Lists the different font faces that make up @family.
 * 
 * The faces in a family share a common design, but differ in slant, weight,
 * width and other aspects.
 * 
 * Note that the returned faces are not in any particular order, and
 * multiple faces may have the same name or characteristics.
 * 
 * `PangoFontFamily` also implemented the [iface@Gio.ListModel] interface
 * for enumerating faces.
 *
 * @param faces location to store an array of pointers to `PangoFontFace` objects,
 *   or %NULL. This array should be freed with g_free() when it is no
 *   longer needed.
 * @param nfaces location to store number of elements in @faces.
 */
- (void)listFacesWithFaces:(PangoFontFace***)faces nfaces:(int*)nfaces;

@end