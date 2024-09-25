/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKButton.h"

@class OGTKWidget;

/**
 * A `GtkToggleButton` is a button which remains “pressed-in” when
 * clicked.
 * 
 * Clicking again will cause the toggle button to return to its normal state.
 * 
 * A toggle button is created by calling either [ctor@Gtk.ToggleButton.new] or
 * [ctor@Gtk.ToggleButton.new_with_label]. If using the former, it is advisable
 * to pack a widget, (such as a `GtkLabel` and/or a `GtkImage`), into the toggle
 * button’s container. (See [class@Gtk.Button] for more information).
 * 
 * The state of a `GtkToggleButton` can be set specifically using
 * [method@Gtk.ToggleButton.set_active], and retrieved using
 * [method@Gtk.ToggleButton.get_active].
 * 
 * To simply switch the state of a toggle button, use
 * [method@Gtk.ToggleButton.toggled].
 * 
 * ## Grouping
 * 
 * Toggle buttons can be grouped together, to form mutually exclusive
 * groups - only one of the buttons can be toggled at a time, and toggling
 * another one will switch the currently toggled one off.
 * 
 * To add a `GtkToggleButton` to a group, use [method@Gtk.ToggleButton.set_group].
 * 
 * ## CSS nodes
 * 
 * `GtkToggleButton` has a single CSS node with name button. To differentiate
 * it from a plain `GtkButton`, it gets the `.toggle` style class.
 * 
 * ## Accessibility
 * 
 * `GtkToggleButton` uses the %GTK_ACCESSIBLE_ROLE_TOGGLE_BUTTON role.
 * 
 * ## Creating two `GtkToggleButton` widgets.
 * 
 * ```c
 * static void
 * output_state (GtkToggleButton *source,
 *               gpointer         user_data)
 * {
 *   g_print ("Toggle button "%s" is active: %s",
 *            gtk_button_get_label (GTK_BUTTON (source)),
 *            gtk_toggle_button_get_active (source) ? "Yes" : "No");
 * }
 * 
 * static void
 * make_toggles (void)
 * {
 *   GtkWidget *window, *toggle1, *toggle2;
 *   GtkWidget *box;
 *   const char *text;
 * 
 *   window = gtk_window_new ();
 *   box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 12);
 * 
 *   text = "Hi, I’m toggle button one";
 *   toggle1 = gtk_toggle_button_new_with_label (text);
 * 
 *   g_signal_connect (toggle1, "toggled",
 *                     G_CALLBACK (output_state),
 *                     NULL);
 *   gtk_box_append (GTK_BOX (box), toggle1);
 * 
 *   text = "Hi, I’m toggle button two";
 *   toggle2 = gtk_toggle_button_new_with_label (text);
 *   g_signal_connect (toggle2, "toggled",
 *                     G_CALLBACK (output_state),
 *                     NULL);
 *   gtk_box_append (GTK_BOX (box), toggle2);
 * 
 *   gtk_window_set_child (GTK_WINDOW (window), box);
 *   gtk_window_present (GTK_WINDOW (window));
 * }
 * ```
 *
 */
@interface OGTKToggleButton : OGTKButton
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initWithLabel:(OFString*)label;
- (instancetype)initWithMnemonic:(OFString*)label;

/**
 * Methods
 */

- (GtkToggleButton*)castedGObject;

/**
 * Queries a `GtkToggleButton` and returns its current state.
 * 
 * Returns %TRUE if the toggle button is pressed in and %FALSE
 * if it is raised.
 *
 * @return whether the button is pressed
 */
- (bool)active;

/**
 * Sets the status of the toggle button.
 * 
 * Set to %TRUE if you want the `GtkToggleButton` to be “pressed in”,
 * and %FALSE to raise it.
 * 
 * If the status of the button changes, this action causes the
 * [signal@Gtk.ToggleButton::toggled] signal to be emitted.
 *
 * @param isActive %TRUE or %FALSE.
 */
- (void)setActive:(bool)isActive;

/**
 * Adds @self to the group of @group.
 * 
 * In a group of multiple toggle buttons, only one button can be active
 * at a time.
 * 
 * Setting up groups in a cycle leads to undefined behavior.
 * 
 * Note that the same effect can be achieved via the [iface@Gtk.Actionable]
 * API, by using the same action with parameter type and state type 's'
 * for all buttons in the group, and giving each button its own target
 * value.
 *
 * @param group another `GtkToggleButton` to
 *   form a group with
 */
- (void)setGroup:(OGTKToggleButton*)group;

/**
 * Emits the ::toggled signal on the `GtkToggleButton`.
 *
 */
- (void)toggled;

@end