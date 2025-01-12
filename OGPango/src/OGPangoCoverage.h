/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <pango/pango.h>

#import <OGObject/OGObject.h>

/**
 * A `PangoCoverage` structure is a map from Unicode characters
 * to [enum@Pango.CoverageLevel] values.
 * 
 * It is often necessary in Pango to determine if a particular
 * font can represent a particular character, and also how well
 * it can represent that character. The `PangoCoverage` is a data
 * structure that is used to represent that information. It is an
 * opaque structure with no public fields.
 *
 */
@interface OGPangoCoverage : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Convert data generated from [method@Pango.Coverage.to_bytes]
 * back to a `PangoCoverage`.
 *
 * @param bytes binary data
 *   representing a `PangoCoverage`
 * @param nbytes the size of @bytes in bytes
 * @return a newly allocated `PangoCoverage`
 */
+ (OGPangoCoverage*)fromBytesWithBytes:(guchar*)bytes nbytes:(int)nbytes;

/**
 * Constructors
 */
+ (instancetype)coverage;

/**
 * Methods
 */

- (PangoCoverage*)castedGObject;

/**
 * Copy an existing `PangoCoverage`.
 *
 * @return the newly allocated `PangoCoverage`,
 *   with a reference count of one, which should be freed with
 *   [method@Pango.Coverage.unref].
 */
- (OGPangoCoverage*)copy;

/**
 * Determine whether a particular index is covered by @coverage.
 *
 * @param index the index to check
 * @return the coverage level of @coverage for character @index_.
 */
- (PangoCoverageLevel)get:(int)index;

/**
 * Set the coverage for each index in @coverage to be the max (better)
 * value of the current coverage for the index and the coverage for
 * the corresponding index in @other.
 *
 * @param other another `PangoCoverage`
 */
- (void)max:(OGPangoCoverage*)other;

/**
 * Modify a particular index within @coverage
 *
 * @param index the index to modify
 * @param level the new level for @index_
 */
- (void)setWithIndex:(int)index level:(PangoCoverageLevel)level;

/**
 * Convert a `PangoCoverage` structure into a flat binary format.
 *
 * @param bytes location to store result (must be freed with g_free())
 * @param nbytes location to store size of result
 */
- (void)toBytesWithBytes:(guchar**)bytes nbytes:(int*)nbytes;

@end