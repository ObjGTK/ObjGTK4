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
 * Returns the start widget fo the layout.
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
 * Sets the new start widget of @self.
 * 
 * To remove the existing start widget, pass %NULL.
 *
 * @param widget the new start widget
 */
- (void)setStartWidget:(OGTKWidget*)widget;

@end