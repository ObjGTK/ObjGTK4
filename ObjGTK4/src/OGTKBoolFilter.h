/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFilter.h"

/**
 * `GtkBoolFilter` evaluates a boolean `GtkExpression`
 * to determine whether to include items.
 *
 */
@interface OGTKBoolFilter : OGTKFilter
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkExpression*)expression;

/**
 * Methods
 */

- (GtkBoolFilter*)castedGObject;

/**
 * Gets the expression that the filter uses to evaluate if
 * an item should be filtered.
 *
 * @return a `GtkExpression`
 */
- (GtkExpression*)expression;

/**
 * Returns whether the filter inverts the expression.
 *
 * @return %TRUE if the filter inverts
 */
- (bool)invert;

/**
 * Sets the expression that the filter uses to check if items
 * should be filtered.
 * 
 * The expression must have a value type of %G_TYPE_BOOLEAN.
 *
 * @param expression a `GtkExpression`
 */
- (void)setExpression:(GtkExpression*)expression;

/**
 * Sets whether the filter should invert the expression.
 *
 * @param invert %TRUE to invert
 */
- (void)setInvert:(bool)invert;

@end