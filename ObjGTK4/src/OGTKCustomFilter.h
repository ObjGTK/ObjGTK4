/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

/**
 * `GtkCustomFilter` determines whether to include items with a callback.
 *
 */
@interface OGTKCustomFilter : OGTKFilter
{

}


/**
 * Constructors
 */
- (instancetype)initWithMatchFunc:(GtkCustomFilterFunc)matchFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy;

/**
 * Methods
 */

- (GtkCustomFilter*)castedGObject;

/**
 * Sets the function used for filtering items.
 * 
 * If @match_func is %NULL, the filter matches all items.
 * 
 * If the filter func changes its filtering behavior,
 * gtk_filter_changed() needs to be called.
 * 
 * If a previous function was set, its @user_destroy will be
 * called now.
 *
 * @param matchFunc function to filter items
 * @param userData user data to pass to @match_func
 * @param userDestroy destroy notify for @user_data
 */
- (void)setFilterFuncWithMatchFunc:(GtkCustomFilterFunc)matchFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy;

@end