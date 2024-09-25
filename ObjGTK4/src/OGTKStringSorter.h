/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

/**
 * `GtkStringSorter` is a `GtkSorter` that compares strings.
 * 
 * It does the comparison in a linguistically correct way using the
 * current locale by normalizing Unicode strings and possibly case-folding
 * them before performing the comparison.
 * 
 * To obtain the strings to compare, this sorter evaluates a
 * [class@Gtk.Expression].
 *
 */
@interface OGTKStringSorter : OGTKSorter
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkExpression*)expression;

/**
 * Methods
 */

- (GtkStringSorter*)castedGObject;

/**
 * Gets which collation method the sorter uses.
 *
 * @return The collation method
 */
- (GtkCollation)collation;

/**
 * Gets the expression that is evaluated to obtain strings from items.
 *
 * @return a `GtkExpression`
 */
- (GtkExpression*)expression;

/**
 * Gets whether the sorter ignores case differences.
 *
 * @return %TRUE if @self is ignoring case differences
 */
- (bool)ignoreCase;

/**
 * Sets the collation method to use for sorting.
 *
 * @param collation the collation method
 */
- (void)setCollation:(GtkCollation)collation;

/**
 * Sets the expression that is evaluated to obtain strings from items.
 * 
 * The expression must have the type %G_TYPE_STRING.
 *
 * @param expression a `GtkExpression`
 */
- (void)setExpression:(GtkExpression*)expression;

/**
 * Sets whether the sorter will ignore case differences.
 *
 * @param ignoreCase %TRUE to ignore case differences
 */
- (void)setIgnoreCase:(bool)ignoreCase;

@end