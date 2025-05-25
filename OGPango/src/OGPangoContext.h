/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <pango/pango.h>

#import <OGObject/OGObject.h>

@class OGPangoFont;
@class OGPangoFontFamily;
@class OGPangoFontMap;
@class OGPangoFontset;

/**
 * A `PangoContext` stores global information used to control the
 * itemization process.
 * 
 * The information stored by `PangoContext` includes the fontmap used
 * to look up fonts, and default values such as the default language,
 * default gravity, or default font.
 * 
 * To obtain a `PangoContext`, use [method@Pango.FontMap.create_context].
 *
 */
@interface OGPangoContext : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Constructors
 */
+ (instancetype)context;

/**
 * Methods
 */

- (PangoContext*)castedGObject;

/**
 * Forces a change in the context, which will cause any `PangoLayout`
 * using this context to re-layout.
 * 
 * This function is only useful when implementing a new backend
 * for Pango, something applications won't do. Backends should
 * call this function if they have attached extra data to the context
 * and such data is changed.
 *
 */
- (void)changed;

/**
 * Retrieves the base direction for the context.
 * 
 * See [method@Pango.Context.set_base_dir].
 *
 * @return the base direction for the context.
 */
- (PangoDirection)baseDir;

/**
 * Retrieves the base gravity for the context.
 * 
 * See [method@Pango.Context.set_base_gravity].
 *
 * @return the base gravity for the context.
 */
- (PangoGravity)baseGravity;

/**
 * Retrieve the default font description for the context.
 *
 * @return a pointer to the context's default font
 *   description. This value must not be modified or freed.
 */
- (PangoFontDescription*)fontDescription;

/**
 * Gets the `PangoFontMap` used to look up fonts for this context.
 *
 * @return the font map for the.
 *   `PangoContext` This value is owned by Pango and should not be
 *   unreferenced.
 */
- (OGPangoFontMap*)fontMap;

/**
 * Retrieves the gravity for the context.
 * 
 * This is similar to [method@Pango.Context.get_base_gravity],
 * except for when the base gravity is %PANGO_GRAVITY_AUTO for
 * which [func@Pango.Gravity.get_for_matrix] is used to return the
 * gravity from the current context matrix.
 *
 * @return the resolved gravity for the context.
 */
- (PangoGravity)gravity;

/**
 * Retrieves the gravity hint for the context.
 * 
 * See [method@Pango.Context.set_gravity_hint] for details.
 *
 * @return the gravity hint for the context.
 */
- (PangoGravityHint)gravityHint;

/**
 * Retrieves the global language tag for the context.
 *
 * @return the global language tag.
 */
- (PangoLanguage*)language;

/**
 * Gets the transformation matrix that will be applied when
 * rendering with this context.
 * 
 * See [method@Pango.Context.set_matrix].
 *
 * @return the matrix, or %NULL if no
 *   matrix has been set (which is the same as the identity matrix).
 *   The returned matrix is owned by Pango and must not be modified
 *   or freed.
 */
- (const PangoMatrix*)matrix;

/**
 * Get overall metric information for a particular font description.
 * 
 * Since the metrics may be substantially different for different scripts,
 * a language tag can be provided to indicate that the metrics should be
 * retrieved that correspond to the script(s) used by that language.
 * 
 * The `PangoFontDescription` is interpreted in the same way as by [func@itemize],
 * and the family name may be a comma separated list of names. If characters
 * from multiple of these families would be used to render the string, then
 * the returned fonts would be a composite of the metrics for the fonts loaded
 * for the individual families.
 *
 * @param desc a `PangoFontDescription` structure. %NULL means that the
 *   font description from the context will be used.
 * @param language language tag used to determine which script to get
 *   the metrics for. %NULL means that the language tag from the context
 *   will be used. If no language tag is set on the context, metrics
 *   for the default language (as determined by [func@Pango.Language.get_default]
 *   will be returned.
 * @return a `PangoFontMetrics` object. The caller must call
 *   [method@Pango.FontMetrics.unref] when finished using the object.
 */
- (PangoFontMetrics*)metricsWithDesc:(const PangoFontDescription*)desc language:(PangoLanguage*)language;

/**
 * Returns whether font rendering with this context should
 * round glyph positions and widths.
 *
 * @return
 */
- (bool)roundGlyphPositions;

/**
 * Returns the current serial number of @context.
 * 
 * The serial number is initialized to an small number larger than zero
 * when a new context is created and is increased whenever the context
 * is changed using any of the setter functions, or the `PangoFontMap` it
 * uses to find fonts has changed. The serial may wrap, but will never
 * have the value 0. Since it can wrap, never compare it with "less than",
 * always use "not equals".
 * 
 * This can be used to automatically detect changes to a `PangoContext`,
 * and is only useful when implementing objects that need update when their
 * `PangoContext` changes, like `PangoLayout`.
 *
 * @return The current serial number of @context.
 */
- (guint)serial;

/**
 * List all families for a context.
 *
 * @param families location
 *   to store a pointer to an array of `PangoFontFamily`. This array should
 *   be freed with g_free().
 * @param nfamilies location to store the number of elements in @descs
 */
- (void)listFamilies:(PangoFontFamily***)families nfamilies:(int*)nfamilies;

/**
 * Loads the font in one of the fontmaps in the context
 * that is the closest match for @desc.
 *
 * @param desc a `PangoFontDescription` describing the font to load
 * @return the newly allocated `PangoFont`
 *   that was loaded, or %NULL if no font matched.
 */
- (OGPangoFont*)loadFontWithDesc:(const PangoFontDescription*)desc;

/**
 * Load a set of fonts in the context that can be used to render
 * a font matching @desc.
 *
 * @param desc a `PangoFontDescription` describing the fonts to load
 * @param language a `PangoLanguage` the fonts will be used for
 * @return the newly allocated
 *   `PangoFontset` loaded, or %NULL if no font matched.
 */
- (OGPangoFontset*)loadFontsetWithDesc:(const PangoFontDescription*)desc language:(PangoLanguage*)language;

/**
 * Sets the base direction for the context.
 * 
 * The base direction is used in applying the Unicode bidirectional
 * algorithm; if the @direction is %PANGO_DIRECTION_LTR or
 * %PANGO_DIRECTION_RTL, then the value will be used as the paragraph
 * direction in the Unicode bidirectional algorithm. A value of
 * %PANGO_DIRECTION_WEAK_LTR or %PANGO_DIRECTION_WEAK_RTL is used only
 * for paragraphs that do not contain any strong characters themselves.
 *
 * @param direction the new base direction
 */
- (void)setBaseDirWithDirection:(PangoDirection)direction;

/**
 * Sets the base gravity for the context.
 * 
 * The base gravity is used in laying vertical text out.
 *
 * @param gravity the new base gravity
 */
- (void)setBaseGravity:(PangoGravity)gravity;

/**
 * Set the default font description for the context
 *
 * @param desc the new pango font description
 */
- (void)setFontDescription:(const PangoFontDescription*)desc;

/**
 * Sets the font map to be searched when fonts are looked-up
 * in this context.
 * 
 * This is only for internal use by Pango backends, a `PangoContext`
 * obtained via one of the recommended methods should already have a
 * suitable font map.
 *
 * @param fontMap the `PangoFontMap` to set.
 */
- (void)setFontMap:(OGPangoFontMap*)fontMap;

/**
 * Sets the gravity hint for the context.
 * 
 * The gravity hint is used in laying vertical text out, and
 * is only relevant if gravity of the context as returned by
 * [method@Pango.Context.get_gravity] is set to %PANGO_GRAVITY_EAST
 * or %PANGO_GRAVITY_WEST.
 *
 * @param hint the new gravity hint
 */
- (void)setGravityHint:(PangoGravityHint)hint;

/**
 * Sets the global language tag for the context.
 * 
 * The default language for the locale of the running process
 * can be found using [func@Pango.Language.get_default].
 *
 * @param language the new language tag.
 */
- (void)setLanguage:(PangoLanguage*)language;

/**
 * Sets the transformation matrix that will be applied when rendering
 * with this context.
 * 
 * Note that reported metrics are in the user space coordinates before
 * the application of the matrix, not device-space coordinates after the
 * application of the matrix. So, they don't scale with the matrix, though
 * they may change slightly for different matrices, depending on how the
 * text is fit to the pixel grid.
 *
 * @param matrix a `PangoMatrix`, or %NULL to unset any existing
 * matrix. (No matrix set is the same as setting the identity matrix.)
 */
- (void)setMatrix:(const PangoMatrix*)matrix;

/**
 * Sets whether font rendering with this context should
 * round glyph positions and widths to integral positions,
 * in device units.
 * 
 * This is useful when the renderer can't handle subpixel
 * positioning of glyphs.
 * 
 * The default value is to round glyph positions, to remain
 * compatible with previous Pango behavior.
 *
 * @param roundPositions whether to round glyph positions
 */
- (void)setRoundGlyphPositionsWithRoundPositions:(bool)roundPositions;

@end