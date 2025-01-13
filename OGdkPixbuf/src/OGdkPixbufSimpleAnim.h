/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbufAnimation.h"

@class OGdkPixbuf;

/**
 * An opaque struct representing a simple animation.
 *
 */
@interface OGdkPixbufSimpleAnim : OGdkPixbufAnimation
{

}


/**
 * Constructors
 */
+ (instancetype)pixbufSimpleAnimWithWidth:(gint)width height:(gint)height rate:(gfloat)rate;

/**
 * Methods
 */

- (GdkPixbufSimpleAnim*)castedGObject;

/**
 * Adds a new frame to @animation. The @pixbuf must
 * have the dimensions specified when the animation
 * was constructed.
 *
 * @param pixbuf the pixbuf to add
 */
- (void)addFrameWithPixbuf:(OGdkPixbuf*)pixbuf;

/**
 * Gets whether @animation should loop indefinitely when it reaches the end.
 *
 * @return %TRUE if the animation loops forever, %FALSE otherwise
 */
- (bool)loop;

/**
 * Sets whether @animation should loop indefinitely when it reaches the end.
 *
 * @param loop whether to loop the animation
 */
- (void)setLoop:(bool)loop;

@end