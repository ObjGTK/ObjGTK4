/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSorter.h"

/**
 * `GtkNumericSorter` is a `GtkSorter` that compares numbers.
 * 
 * To obtain the numbers to compare, this sorter evaluates a
 * [class@Gtk.Expression].
 *
 */
@interface OGTKNumericSorter : OGTKSorter
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkExpression*)expression;

/**
 * Methods
 */

- (GtkNumericSorter*)castedGObject;

/**
 * Gets the expression that is evaluated to obtain numbers from items.
 *
 * @return a `GtkExpression`
 */
- (GtkExpression*)expression;

/**
 * Gets whether this sorter will sort smaller numbers first.
 *
 * @return the order of the numbers
 */
- (GtkSortType)sortOrder;

/**
 * Sets the expression that is evaluated to obtain numbers from items.
 * 
 * Unless an expression is set on @self, the sorter will always
 * compare items as invalid.
 * 
 * The expression must have a return type that can be compared
 * numerically, such as %G_TYPE_INT or %G_TYPE_DOUBLE.
 *
 * @param expression a `GtkExpression`
 */
- (void)setExpression:(GtkExpression*)expression;

/**
 * Sets whether to sort smaller numbers before larger ones.
 *
 * @param sortOrder whether to sort smaller numbers first
 */
- (void)setSortOrder:(GtkSortType)sortOrder;

@end