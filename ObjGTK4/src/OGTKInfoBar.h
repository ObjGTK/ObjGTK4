/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWidget.h"

/**
 * `GtkInfoBar` can be used to show messages to the user without a dialog.
 * 
 * ![An example GtkInfoBar](info-bar.png)
 * 
 * It is often temporarily shown at the top or bottom of a document.
 * In contrast to [class@Gtk.Dialog], which has an action area at the
 * bottom, `GtkInfoBar` has an action area at the side.
 * 
 * The API of `GtkInfoBar` is very similar to `GtkDialog`, allowing you
 * to add buttons to the action area with [method@Gtk.InfoBar.add_button]
 * or [ctor@Gtk.InfoBar.new_with_buttons]. The sensitivity of action widgets
 * can be controlled with [method@Gtk.InfoBar.set_response_sensitive].
 * 
 * To add widgets to the main content area of a `GtkInfoBar`, use
 * [method@Gtk.InfoBar.add_child].
 * 
 * Similar to [class@Gtk.MessageDialog], the contents of a `GtkInfoBar`
 * can by classified as error message, warning, informational message, etc,
 * by using [method@Gtk.InfoBar.set_message_type]. GTK may use the message
 * type to determine how the message is displayed.
 * 
 * A simple example for using a `GtkInfoBar`:
 * ```c
 * GtkWidget *message_label;
 * GtkWidget *widget;
 * GtkWidget *grid;
 * GtkInfoBar *bar;
 * 
 * // set up info bar
 * widget = gtk_info_bar_new ();
 * bar = GTK_INFO_BAR (widget);
 * grid = gtk_grid_new ();
 * 
 * message_label = gtk_label_new ("");
 * gtk_info_bar_add_child (bar, message_label);
 * gtk_info_bar_add_button (bar,
 *                          _("_OK"),
 *                          GTK_RESPONSE_OK);
 * g_signal_connect (bar,
 *                   "response",
 *                   G_CALLBACK (gtk_widget_hide),
 *                   NULL);
 * gtk_grid_attach (GTK_GRID (grid),
 *                  widget,
 *                  0, 2, 1, 1);
 * 
 * // ...
 * 
 * // show an error message
 * gtk_label_set_text (GTK_LABEL (message_label), "An error occurred!");
 * gtk_info_bar_set_message_type (bar, GTK_MESSAGE_ERROR);
 * gtk_widget_show (bar);
 * ```
 * 
 * # GtkInfoBar as GtkBuildable
 * 
 * `GtkInfoBar` supports a custom `<action-widgets>` element, which can contain
 * multiple `<action-widget>` elements. The “response” attribute specifies a
 * numeric response, and the content of the element is the id of widget
 * (which should be a child of the dialogs @action_area).
 * 
 * `GtkInfoBar` supports adding action widgets by specifying “action” as
 * the “type” attribute of a `<child>` element. The widget will be added
 * either to the action area. The response id has to be associated
 * with the action widget using the `<action-widgets>` element.
 * 
 * # CSS nodes
 * 
 * `GtkInfoBar` has a single CSS node with name infobar. The node may get
 * one of the style classes .info, .warning, .error or .question, depending
 * on the message type.
 * If the info bar shows a close button, that button will have the .close
 * style class applied.
 *
 */
@interface OGTKInfoBar : OGTKWidget
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkInfoBar*)castedGObject;

/**
 * Add an activatable widget to the action area of a `GtkInfoBar`.
 * 
 * This also connects a signal handler that will emit the
 * [signal@Gtk.InfoBar::response] signal on the message area
 * when the widget is activated. The widget is appended to the
 * end of the message areas action area.
 *
 * @param child an activatable widget
 * @param responseId response ID for @child
 */
- (void)addActionWidgetWithChild:(OGTKWidget*)child responseId:(int)responseId;

/**
 * Adds a button with the given text.
 * 
 * Clicking the button will emit the [signal@Gtk.InfoBar::response]
 * signal with the given response_id. The button is appended to the
 * end of the info bar's action area. The button widget is returned,
 * but usually you don't need it.
 *
 * @param buttonText text of button
 * @param responseId response ID for the button
 * @return the `GtkButton` widget
 * that was added
 */
- (OGTKWidget*)addButtonWithButtonText:(OFString*)buttonText responseId:(int)responseId;

/**
 * Adds a widget to the content area of the info bar.
 *
 * @param widget the child to be added
 */
- (void)addChild:(OGTKWidget*)widget;

/**
 * Returns the message type of the message area.
 *
 * @return the message type of the message area.
 */
- (GtkMessageType)messageType;

/**
 * Returns whether the info bar is currently revealed.
 *
 * @return the current value of the [property@Gtk.InfoBar:revealed] property
 */
- (bool)revealed;

/**
 * Returns whether the widget will display a standard close button.
 *
 * @return %TRUE if the widget displays standard close button
 */
- (bool)showCloseButton;

/**
 * Removes a widget from the action area of @info_bar.
 * 
 * The widget must have been put there by a call to
 * [method@Gtk.InfoBar.add_action_widget] or [method@Gtk.InfoBar.add_button].
 *
 * @param widget an action widget to remove
 */
- (void)removeActionWidget:(OGTKWidget*)widget;

/**
 * Removes a widget from the content area of the info bar.
 *
 * @param widget a child that has been added to the content area
 */
- (void)removeChild:(OGTKWidget*)widget;

/**
 * Emits the “response” signal with the given @response_id.
 *
 * @param responseId a response ID
 */
- (void)response:(int)responseId;

/**
 * Sets the last widget in the info bar’s action area with
 * the given response_id as the default widget for the dialog.
 * 
 * Pressing “Enter” normally activates the default widget.
 * 
 * Note that this function currently requires @info_bar to
 * be added to a widget hierarchy.
 *
 * @param responseId a response ID
 */
- (void)setDefaultResponse:(int)responseId;

/**
 * Sets the message type of the message area.
 * 
 * GTK uses this type to determine how the message is displayed.
 *
 * @param messageType a `GtkMessageType`
 */
- (void)setMessageType:(GtkMessageType)messageType;

/**
 * Sets the sensitivity of action widgets for @response_id.
 * 
 * Calls `gtk_widget_set_sensitive (widget, setting)` for each
 * widget in the info bars’s action area with the given @response_id.
 * A convenient way to sensitize/desensitize buttons.
 *
 * @param responseId a response ID
 * @param setting TRUE for sensitive
 */
- (void)setResponseSensitiveWithResponseId:(int)responseId setting:(bool)setting;

/**
 * Sets whether the `GtkInfoBar` is revealed.
 * 
 * Changing this will make @info_bar reveal or conceal
 * itself via a sliding transition.
 * 
 * Note: this does not show or hide @info_bar in the
 * [property@Gtk.Widget:visible] sense, so revealing has no effect
 * if [property@Gtk.Widget:visible] is %FALSE.
 *
 * @param revealed The new value of the property
 */
- (void)setRevealed:(bool)revealed;

/**
 * If true, a standard close button is shown.
 * 
 * When clicked it emits the response %GTK_RESPONSE_CLOSE.
 *
 * @param setting %TRUE to include a close button
 */
- (void)setShowCloseButton:(bool)setting;

@end