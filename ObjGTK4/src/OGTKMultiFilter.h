/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

/**
 * `GtkMultiFilter` is the base class for filters that combine multiple filters.
 *
 */
@interface OGTKMultiFilter : OGTKFilter
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Methods
 */

- (GtkMultiFilter*)castedGObject;

/**
 * Adds a @filter to @self to use for matching.
 *
 * @param filter A new filter to use
 */
- (void)appendWithFilter:(OGTKFilter*)filter;

/**
 * Removes the filter at the given @position from the list of filters used
 * by @self.
 * 
 * If @position is larger than the number of filters, nothing happens and
 * the function returns.
 *
 * @param position position of filter to remove
 */
- (void)removeWithPosition:(guint)position;

@end