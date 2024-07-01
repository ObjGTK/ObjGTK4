/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

/**
 * `GtkCustomSorter` is a `GtkSorter` implementation that sorts via a callback
 * function.
 *
 */
@interface OGTKCustomSorter : OGTKSorter
{

}


/**
 * Constructors
 */
- (instancetype)initWithSortFunc:(GCompareDataFunc)sortFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy;

/**
 * Methods
 */

- (GtkCustomSorter*)castedGObject;

/**
 * Sets (or unsets) the function used for sorting items.
 * 
 * If @sort_func is %NULL, all items are considered equal.
 * 
 * If the sort func changes its sorting behavior,
 * gtk_sorter_changed() needs to be called.
 * 
 * If a previous function was set, its @user_destroy will be
 * called now.
 *
 * @param sortFunc function to sort items
 * @param userData user data to pass to @match_func
 * @param userDestroy destroy notify for @user_data
 */
- (void)setSortFuncWithSortFunc:(GCompareDataFunc)sortFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy;

@end