/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontset.h"

@class OGPangoFont;

/**
 * `PangoFontsetSimple` is a implementation of the abstract
 * `PangoFontset` base class as an array of fonts.
 * 
 * When creating a `PangoFontsetSimple`, you have to provide
 * the array of fonts that make up the fontset.
 *
 */
@interface OGPangoFontsetSimple : OGPangoFontset
{

}


/**
 * Constructors
 */
- (instancetype)init:(PangoLanguage*)language;

/**
 * Methods
 */

- (PangoFontsetSimple*)castedGObject;

/**
 * Adds a font to the fontset.
 * 
 * The fontset takes ownership of @font.
 *
 * @param font a `PangoFont`.
 */
- (void)append:(OGPangoFont*)font;

/**
 * Returns the number of fonts in the fontset.
 *
 * @return the size of @fontset
 */
- (int)size;

@end