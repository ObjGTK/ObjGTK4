/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkTexture.h"

/**
 * A `GdkTexture` representing image data in memory.
 *
 */
@interface OGdkMemoryTexture : OGdkTexture
{

}


/**
 * Constructors
 */
+ (instancetype)memoryTextureWithWidth:(int)width height:(int)height format:(GdkMemoryFormat)format bytes:(GBytes*)bytes stride:(gsize)stride;

/**
 * Methods
 */

- (GdkMemoryTexture*)castedGObject;

@end