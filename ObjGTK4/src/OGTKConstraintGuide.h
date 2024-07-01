/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A `GtkConstraintGuide` is an invisible layout element in a
 * `GtkConstraintLayout`.
 * 
 * The `GtkConstraintLayout` treats guides like widgets. They
 * can be used as the source or target of a `GtkConstraint`.
 * 
 * Guides have a minimum, maximum and natural size. Depending
 * on the constraints that are applied, they can act like a
 * guideline that widgets can be aligned to, or like *flexible
 * space*.
 * 
 * Unlike a `GtkWidget`, a `GtkConstraintGuide` will not be drawn.
 *
 */
@interface OGTKConstraintGuide : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkConstraintGuide*)castedGObject;

/**
 * Gets the maximum size of @guide.
 *
 * @param width return location for the maximum width
 * @param height return location for the maximum height
 */
- (void)maxSizeWithWidth:(int*)width height:(int*)height;

/**
 * Gets the minimum size of @guide.
 *
 * @param width return location for the minimum width
 * @param height return location for the minimum height
 */
- (void)minSizeWithWidth:(int*)width height:(int*)height;

/**
 * Retrieves the name set using gtk_constraint_guide_set_name().
 *
 * @return the name of the guide
 */
- (OFString*)name;

/**
 * Gets the natural size of @guide.
 *
 * @param width return location for the natural width
 * @param height return location for the natural height
 */
- (void)natSizeWithWidth:(int*)width height:(int*)height;

/**
 * Retrieves the strength set using gtk_constraint_guide_set_strength().
 *
 * @return the strength of the constraint on the natural size
 */
- (GtkConstraintStrength)strength;

/**
 * Sets the maximum size of @guide.
 * 
 * If @guide is attached to a `GtkConstraintLayout`,
 * the constraints will be updated to reflect the new size.
 *
 * @param width the new maximum width, or -1 to not change it
 * @param height the new maximum height, or -1 to not change it
 */
- (void)setMaxSizeWithWidth:(int)width height:(int)height;

/**
 * Sets the minimum size of @guide.
 * 
 * If @guide is attached to a `GtkConstraintLayout`,
 * the constraints will be updated to reflect the new size.
 *
 * @param width the new minimum width, or -1 to not change it
 * @param height the new minimum height, or -1 to not change it
 */
- (void)setMinSizeWithWidth:(int)width height:(int)height;

/**
 * Sets a name for the given `GtkConstraintGuide`.
 * 
 * The name is useful for debugging purposes.
 *
 * @param name a name for the @guide
 */
- (void)setName:(OFString*)name;

/**
 * Sets the natural size of @guide.
 * 
 * If @guide is attached to a `GtkConstraintLayout`,
 * the constraints will be updated to reflect the new size.
 *
 * @param width the new natural width, or -1 to not change it
 * @param height the new natural height, or -1 to not change it
 */
- (void)setNatSizeWithWidth:(int)width height:(int)height;

/**
 * Sets the strength of the constraint on the natural size of the
 * given `GtkConstraintGuide`.
 *
 * @param strength the strength of the constraint
 */
- (void)setStrength:(GtkConstraintStrength)strength;

@end