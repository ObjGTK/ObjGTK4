/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkTexture.h"

/**
 * A `GdkTexture` representing a DMA buffer.
 * 
 * To create a `GdkDmabufTexture`, use the auxiliary
 * [class@Gdk.DmabufTextureBuilder] object.
 * 
 * Dma-buf textures can only be created on Linux.
 *
 */
@interface OGGdkDmabufTexture : OGGdkTexture
{

}


/**
 * Methods
 */

- (GdkDmabufTexture*)castedGObject;

@end