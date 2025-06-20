/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiFilter.h"

/**
 * `GtkEveryFilter` matches an item when each of its filters matches.
 * 
 * To add filters to a `GtkEveryFilter`, use [method@Gtk.MultiFilter.append].
 *
 */
@interface OGTKEveryFilter : OGTKMultiFilter
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
+ (instancetype)everyFilter;

/**
 * Methods
 */

- (GtkEveryFilter*)castedGObject;

@end