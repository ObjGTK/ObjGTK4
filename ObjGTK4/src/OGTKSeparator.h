/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkSeparator` is a horizontal or vertical separator widget.
 * 
 * ![An example GtkSeparator](separator.png)
 * 
 * A `GtkSeparator` can be used to group the widgets within a window.
 * It displays a line with a shadow to make it appear sunken into the
 * interface.
 * 
 * # CSS nodes
 * 
 * `GtkSeparator` has a single CSS node with name separator. The node
 * gets one of the .horizontal or .vertical style classes.
 * 
 * # Accessibility
 * 
 * `GtkSeparator` uses the %GTK_ACCESSIBLE_ROLE_SEPARATOR role.
 *
 */
@interface OGTKSeparator : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init:(GtkOrientation)orientation;

/**
 * Methods
 */

- (GtkSeparator*)castedGObject;

@end