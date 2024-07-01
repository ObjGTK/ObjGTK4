/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRenderer.h"

/**
 * Renders a toggle button in a cell
 * 
 * `GtkCellRendererToggle` renders a toggle button in a cell. The
 * button is drawn as a radio or a checkbutton, depending on the
 * `GtkCellRendererToggle:radio` property.
 * When activated, it emits the `GtkCellRendererToggle::toggled` signal.
 *
 */
@interface OGTKCellRendererToggle : OGTKCellRenderer
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkCellRendererToggle*)castedGObject;

/**
 * Returns whether the cell renderer is activatable. See
 * gtk_cell_renderer_toggle_set_activatable().
 *
 * @return %TRUE if the cell renderer is activatable.
 */
- (bool)activatable;

/**
 * Returns whether the cell renderer is active. See
 * gtk_cell_renderer_toggle_set_active().
 *
 * @return %TRUE if the cell renderer is active.
 */
- (bool)active;

/**
 * Returns whether we’re rendering radio toggles rather than checkboxes.
 *
 * @return %TRUE if we’re rendering radio toggles rather than checkboxes
 */
- (bool)radio;

/**
 * Makes the cell renderer activatable.
 *
 * @param setting the value to set.
 */
- (void)setActivatable:(bool)setting;

/**
 * Activates or deactivates a cell renderer.
 *
 * @param setting the value to set.
 */
- (void)setActive:(bool)setting;

/**
 * If @radio is %TRUE, the cell renderer renders a radio toggle
 * (i.e. a toggle in a group of mutually-exclusive toggles).
 * If %FALSE, it renders a check toggle (a standalone boolean option).
 * This can be set globally for the cell renderer, or changed just
 * before rendering each cell in the model (for `GtkTreeView`, you set
 * up a per-row setting using `GtkTreeViewColumn` to associate model
 * columns with cell renderer properties).
 *
 * @param radio %TRUE to make the toggle look like a radio button
 */
- (void)setRadio:(bool)radio;

@end