/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkTexture.h"

@class OGGdkGLContext;

/**
 * A GdkTexture representing a GL texture object.
 *
 */
@interface OGGdkGLTexture : OGGdkTexture
{

}


/**
 * Constructors
 */
- (instancetype)initWithContext:(OGGdkGLContext*)context id:(guint)id width:(int)width height:(int)height destroy:(GDestroyNotify)destroy data:(gpointer)data;

/**
 * Methods
 */

- (GdkGLTexture*)castedGObject;

/**
 * Releases the GL resources held by a `GdkGLTexture`.
 * 
 * The texture contents are still available via the
 * [method@Gdk.Texture.download] function, after this
 * function has been called.
 *
 */
- (void)release;

@end