/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLayoutManager.h"

@class OGTKWidget;

/**
 * `GtkCenterLayout` is a layout manager that manages up to three children.
 * 
 * The start widget is allocated at the start of the layout (left in
 * left-to-right locales and right in right-to-left ones), and the end
 * widget at the end.
 * 
 * The center widget is centered regarding the full width of the layout's.
 *
 */
@interface OGTKCenterLayout : OGTKLayoutManager
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCenterLayout*)castedGObject;

/**
 * Returns the baseline position of the layout.
 *
 * @return The current baseline position of @self.
 */
- (GtkBaselinePosition)baselinePosition;

/**
 * Returns the center widget of the layout.
 *
 * @return the current center widget of @self
 */
- (OGTKWidget*)centerWidget;

/**
 * Returns the end widget of the layout.
 *
 * @return the current end widget of @self
 */
- (OGTKWidget*)endWidget;

/**
 * Gets the current orienration of the layout manager.
 *
 * @return The current orientation of @self
 */
- (GtkOrientation)orientation;

/**
 * Gets whether @self shrinks the center widget after other children.
 *
 * @return whether to shrink the center widget after others
 */
- (bool)shrinkCenterLast;

/**
 * Returns the start widget of the layout.
 *
 * @return The current start widget of @self
 */
- (OGTKWidget*)startWidget;

/**
 * Sets the new baseline position of @self
 *
 * @param baselinePosition the new baseline position
 */
- (void)setBaselinePosition:(GtkBaselinePosition)baselinePosition;

/**
 * Sets the new center widget of @self.
 * 
 * To remove the existing center widget, pass %NULL.
 *
 * @param widget the new center widget
 */
- (void)setCenterWidget:(OGTKWidget*)widget;

/**
 * Sets the new end widget of @self.
 * 
 * To remove the existing center widget, pass %NULL.
 *
 * @param widget the new end widget
 */
- (void)setEndWidget:(OGTKWidget*)widget;

/**
 * Sets the orientation of @self.
 *
 * @param orientation the new orientation
 */
- (void)setOrientation:(GtkOrientation)orientation;

/**
 * Sets whether to shrink the center widget after other children.
 * 
 * By default, when there's no space to give all three children their
 * natural widths, the start and end widgets start shrinking and the
 * center child keeps natural width until they reach minimum width.
 * 
 * If set to `FALSE`, start and end widgets keep natural width and the
 * center widget starts shrinking instead.
 *
 * @param shrinkCenterLast whether to shrink the center widget after others
 */
- (void)setShrinkCenterLast:(bool)shrinkCenterLast;

/**
 * Sets the new start widget of @self.
 * 
 * To remove the existing start widget, pass %NULL.
 *
 * @param widget the new start widget
 */
- (void)setStartWidget:(OGTKWidget*)widget;

@end