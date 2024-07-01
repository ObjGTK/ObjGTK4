/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutChild.h"

/**
 * `GtkLayoutChild` subclass for children in a `GtkFixedLayout`.
 *
 */
@interface OGTKFixedLayoutChild : OGTKLayoutChild
{

}


/**
 * Methods
 */

- (GtkFixedLayoutChild*)castedGObject;

/**
 * Retrieves the transformation of the child.
 *
 * @return a `GskTransform`
 */
- (GskTransform*)transform;

/**
 * Sets the transformation of the child of a `GtkFixedLayout`.
 *
 * @param transform a `GskTransform`
 */
- (void)setTransform:(GskTransform*)transform;

@end