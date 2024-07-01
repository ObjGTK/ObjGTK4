/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererText.h"

@class OGTKCellRenderer;

/**
 * Renders a keyboard accelerator in a cell
 * 
 * `GtkCellRendererAccel` displays a keyboard accelerator (i.e. a key
 * combination like `Control + a`). If the cell renderer is editable,
 * the accelerator can be changed by simply typing the new combination.
 *
 */
@interface OGTKCellRendererAccel : OGTKCellRendererText
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCellRendererAccel*)castedGObject;

@end