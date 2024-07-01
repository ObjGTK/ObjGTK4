/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRenderer.h"

/**
 * Renders a spinning animation in a cell
 * 
 * `GtkCellRendererSpinner` renders a spinning animation in a cell, very
 * similar to `GtkSpinner`. It can often be used as an alternative
 * to a `GtkCellRendererProgress` for displaying indefinite activity,
 * instead of actual progress.
 * 
 * To start the animation in a cell, set the `GtkCellRendererSpinner:active`
 * property to %TRUE and increment the `GtkCellRendererSpinner:pulse` property
 * at regular intervals. The usual way to set the cell renderer properties
 * for each cell is to bind them to columns in your tree model using e.g.
 * gtk_tree_view_column_add_attribute().
 *
 */
@interface OGTKCellRendererSpinner : OGTKCellRenderer
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCellRendererSpinner*)castedGObject;

@end