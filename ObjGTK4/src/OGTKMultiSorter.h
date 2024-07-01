/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

/**
 * `GtkMultiSorter` combines multiple sorters by trying them
 * in turn.
 * 
 * If the first sorter compares two items as equal,
 * the second is tried next, and so on.
 *
 */
@interface OGTKMultiSorter : OGTKSorter
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkMultiSorter*)castedGObject;

/**
 * Add @sorter to @self to use for sorting at the end.
 * 
 * @self will consult all existing sorters before it will
 * sort with the given @sorter.
 *
 * @param sorter a sorter to add
 */
- (void)append:(OGTKSorter*)sorter;

/**
 * Removes the sorter at the given @position from the list of sorter
 * used by @self.
 * 
 * If @position is larger than the number of sorters, nothing happens.
 *
 * @param position position of sorter to remove
 */
- (void)remove:(guint)position;

@end