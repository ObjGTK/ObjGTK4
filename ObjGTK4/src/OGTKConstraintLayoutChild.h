/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutChild.h"

/**
 * `GtkLayoutChild` subclass for children in a `GtkConstraintLayout`.
 *
 */
@interface OGTKConstraintLayoutChild : OGTKLayoutChild
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

- (GtkConstraintLayoutChild*)castedGObject;

@end