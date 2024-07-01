/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutChild.h"

/**
 * `GtkLayoutChild` subclass for children in a `GtkOverlayLayout`.
 *
 */
@interface OGTKOverlayLayoutChild : OGTKLayoutChild
{

}


/**
 * Methods
 */

- (GtkOverlayLayoutChild*)castedGObject;

/**
 * Retrieves whether the child is clipped.
 *
 * @return whether the child is clipped
 */
- (bool)clipOverlay;

/**
 * Retrieves whether the child is measured.
 *
 * @return whether the child is measured
 */
- (bool)measure;

/**
 * Sets whether to clip this child.
 *
 * @param clipOverlay whether to clip this child
 */
- (void)setClipOverlay:(bool)clipOverlay;

/**
 * Sets whether to measure this child.
 *
 * @param measure whether to measure this child
 */
- (void)setMeasure:(bool)measure;

@end