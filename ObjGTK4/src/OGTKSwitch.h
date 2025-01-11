/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkSwitch` is a "light switch" that has two states: on or off.
 * 
 * ![An example GtkSwitch](switch.png)
 * 
 * The user can control which state should be active by clicking the
 * empty area, or by dragging the handle.
 * 
 * `GtkSwitch` can also handle situations where the underlying state
 * changes with a delay. In this case, the slider position indicates
 * the user's recent change (as indicated by the [property@Gtk.Switch:active]
 * property), and the color indicates whether the underlying state (represented
 * by the [property@Gtk.Switch:state] property) has been updated yet.
 * 
 * ![GtkSwitch with delayed state change](switch-state.png)
 * 
 * See [signal@Gtk.Switch::state-set] for details.
 * 
 * # CSS nodes
 * 
 * ```
 * switch
 * ├── image
 * ├── image
 * ╰── slider
 * ```
 * 
 * `GtkSwitch` has four css nodes, the main node with the name switch and
 * subnodes for the slider and the on and off images. Neither of them is
 * using any style classes.
 * 
 * # Accessibility
 * 
 * `GtkSwitch` uses the %GTK_ACCESSIBLE_ROLE_SWITCH role.
 *
 */
@interface OGTKSwitch : OGTKWidget
{

}


/**
 * Constructors
 */
+ (instancetype)switch;

/**
 * Methods
 */

- (GtkSwitch*)castedGObject;

/**
 * Gets whether the `GtkSwitch` is in its “on” or “off” state.
 *
 * @return %TRUE if the `GtkSwitch` is active, and %FALSE otherwise
 */
- (bool)active;

/**
 * Gets the underlying state of the `GtkSwitch`.
 *
 * @return the underlying state
 */
- (bool)state;

/**
 * Changes the state of @self to the desired one.
 *
 * @param isActive %TRUE if @self should be active, and %FALSE otherwise
 */
- (void)setActive:(bool)isActive;

/**
 * Sets the underlying state of the `GtkSwitch`.
 * 
 * This function is typically called from a [signal@Gtk.Switch::state-set]
 * signal handler in order to set up delayed state changes.
 * 
 * See [signal@Gtk.Switch::state-set] for details.
 *
 * @param state the new state
 */
- (void)setState:(bool)state;

@end