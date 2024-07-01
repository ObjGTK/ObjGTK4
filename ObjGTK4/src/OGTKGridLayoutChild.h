/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutChild.h"

/**
 * `GtkLayoutChild` subclass for children in a `GtkGridLayout`.
 *
 */
@interface OGTKGridLayoutChild : OGTKLayoutChild
{

}


/**
 * Methods
 */

- (GtkGridLayoutChild*)castedGObject;

/**
 * Retrieves the column number to which @child attaches its left side.
 *
 * @return the column number
 */
- (int)column;

/**
 * Retrieves the number of columns that @child spans to.
 *
 * @return the number of columns
 */
- (int)columnSpan;

/**
 * Retrieves the row number to which @child attaches its top side.
 *
 * @return the row number
 */
- (int)row;

/**
 * Retrieves the number of rows that @child spans to.
 *
 * @return the number of row
 */
- (int)rowSpan;

/**
 * Sets the column number to attach the left side of @child.
 *
 * @param column the attach point for @child
 */
- (void)setColumn:(int)column;

/**
 * Sets the number of columns @child spans to.
 *
 * @param span the span of @child
 */
- (void)setColumnSpan:(int)span;

/**
 * Sets the row to place @child in.
 *
 * @param row the row for @child
 */
- (void)setRow:(int)row;

/**
 * Sets the number of rows @child spans to.
 *
 * @param span the span of @child
 */
- (void)setRowSpan:(int)span;

@end