/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMultiFilter.h"

/**
 * `GtkAnyFilter` matches an item when at least one of its filters matches.
 * 
 * To add filters to a `GtkAnyFilter`, use [method@Gtk.MultiFilter.append].
 *
 */
@interface OGTKAnyFilter : OGTKMultiFilter
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
+ (instancetype)anyFilter;

/**
 * Methods
 */

- (GtkAnyFilter*)castedGObject;

@end