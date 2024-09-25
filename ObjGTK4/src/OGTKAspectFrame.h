/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkAspectFrame` preserves the aspect ratio of its child.
 * 
 * The frame can respect the aspect ratio of the child widget,
 * or use its own aspect ratio.
 * 
 * # CSS nodes
 * 
 * `GtkAspectFrame` uses a CSS node with name `frame`.
 * 
 * # Accessibility
 * 
 * Until GTK 4.10, `GtkAspectFrame` used the `GTK_ACCESSIBLE_ROLE_GROUP` role.
 * 
 * Starting from GTK 4.12, `GtkAspectFrame` uses the `GTK_ACCESSIBLE_ROLE_GENERIC` role.
 *
 */
@interface OGTKAspectFrame : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)initWithXalign:(float)xalign yalign:(float)yalign ratio:(float)ratio obeyChild:(bool)obeyChild;

/**
 * Methods
 */

- (GtkAspectFrame*)castedGObject;

/**
 * Gets the child widget of @self.
 *
 * @return the child widget of @self
 */
- (OGTKWidget*)child;

/**
 * Returns whether the child's size request should override
 * the set aspect ratio of the `GtkAspectFrame`.
 *
 * @return whether to obey the child's size request
 */
- (bool)obeyChild;

/**
 * Returns the desired aspect ratio of the child.
 *
 * @return the desired aspect ratio
 */
- (float)ratio;

/**
 * Returns the horizontal alignment of the child within the
 * allocation of the `GtkAspectFrame`.
 *
 * @return the horizontal alignment
 */
- (float)xalign;

/**
 * Returns the vertical alignment of the child within the
 * allocation of the `GtkAspectFrame`.
 *
 * @return the vertical alignment
 */
- (float)yalign;

/**
 * Sets the child widget of @self.
 *
 * @param child the child widget
 */
- (void)setChild:(OGTKWidget*)child;

/**
 * Sets whether the aspect ratio of the child's size
 * request should override the set aspect ratio of
 * the `GtkAspectFrame`.
 *
 * @param obeyChild If %TRUE, @ratio is ignored, and the aspect
 *    ratio is taken from the requisition of the child.
 */
- (void)setObeyChild:(bool)obeyChild;

/**
 * Sets the desired aspect ratio of the child.
 *
 * @param ratio aspect ratio of the child
 */
- (void)setRatio:(float)ratio;

/**
 * Sets the horizontal alignment of the child within the allocation
 * of the `GtkAspectFrame`.
 *
 * @param xalign horizontal alignment, from 0.0 (left aligned) to 1.0 (right aligned)
 */
- (void)setXalign:(float)xalign;

/**
 * Sets the vertical alignment of the child within the allocation
 * of the `GtkAspectFrame`.
 *
 * @param yalign horizontal alignment, from 0.0 (top aligned) to 1.0 (bottom aligned)
 */
- (void)setYalign:(float)yalign;

@end