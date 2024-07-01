/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGskRenderer.h"

/**
 * A GSK renderer that is using cairo.
 * 
 * Since it is using cairo, this renderer cannot support
 * 3D transformations.
 *
 */
@interface OGGskCairoRenderer : OGGskRenderer
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GskCairoRenderer*)castedGObject;

@end