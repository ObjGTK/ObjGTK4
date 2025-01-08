/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindow.h"

@class OGTKWidget;

/**
 * Dialogs are a convenient way to prompt the user for a small amount
 * of input.
 * 
 * ![An example GtkDialog](dialog.png)
 * 
 * Typical uses are to display a message, ask a question, or anything else
 * that does not require extensive effort on the user’s part.
 * 
 * The main area of a `GtkDialog` is called the "content area", and is yours
 * to populate with widgets such a `GtkLabel` or `GtkEntry`, to present
 * your information, questions, or tasks to the user.
 * 
 * In addition, dialogs allow you to add "action widgets". Most commonly,
 * action widgets are buttons. Depending on the platform, action widgets may
 * be presented in the header bar at the top of the window, or at the bottom
 * of the window. To add action widgets, create your `GtkDialog` using
 * [ctor@Gtk.Dialog.new_with_buttons], or use
 * [method@Gtk.Dialog.add_button], [method@Gtk.Dialog.add_buttons],
 * or [method@Gtk.Dialog.add_action_widget].
 * 
 * `GtkDialogs` uses some heuristics to decide whether to add a close
 * button to the window decorations. If any of the action buttons use
 * the response ID %GTK_RESPONSE_CLOSE or %GTK_RESPONSE_CANCEL, the
 * close button is omitted.
 * 
 * Clicking a button that was added as an action widget will emit the
 * [signal@Gtk.Dialog::response] signal with a response ID that you specified.
 * GTK will never assign a meaning to positive response IDs; these are
 * entirely user-defined. But for convenience, you can use the response
 * IDs in the [enum@Gtk.ResponseType] enumeration (these all have values
 * less than zero). If a dialog receives a delete event, the
 * [signal@Gtk.Dialog::response] signal will be emitted with the
 * %GTK_RESPONSE_DELETE_EVENT response ID.
 * 
 * Dialogs are created with a call to [ctor@Gtk.Dialog.new] or
 * [ctor@Gtk.Dialog.new_with_buttons]. The latter is recommended; it allows
 * you to set the dialog title, some convenient flags, and add buttons.
 * 
 * A “modal” dialog (that is, one which freezes the rest of the application
 * from user input), can be created by calling [method@Gtk.Window.set_modal]
 * on the dialog. When using [ctor@Gtk.Dialog.new_with_buttons], you can also
 * pass the %GTK_DIALOG_MODAL flag to make a dialog modal.
 * 
 * For the simple dialog in the following example, a [class@Gtk.MessageDialog]
 * would save some effort. But you’d need to create the dialog contents manually
 * if you had more than a simple message in the dialog.
 * 
 * An example for simple `GtkDialog` usage:
 * 
 * ```c
 * // Function to open a dialog box with a message
 * void
 * quick_message (GtkWindow *parent, char *message)
 * {
 *  GtkWidget *dialog, *label, *content_area;
 *  GtkDialogFlags flags;
 * 
 *  // Create the widgets
 *  flags = GTK_DIALOG_DESTROY_WITH_PARENT;
 *  dialog = gtk_dialog_new_with_buttons ("Message",
 *                                        parent,
 *                                        flags,
 *                                        _("_OK"),
 *                                        GTK_RESPONSE_NONE,
 *                                        NULL);
 *  content_area = gtk_dialog_get_content_area (GTK_DIALOG (dialog));
 *  label = gtk_label_new (message);
 * 
 *  // Ensure that the dialog box is destroyed when the user responds
 * 
 *  g_signal_connect_swapped (dialog,
 *                            "response",
 *                            G_CALLBACK (gtk_window_destroy),
 *                            dialog);
 * 
 *  // Add the label, and show everything we’ve added
 * 
 *  gtk_box_append (GTK_BOX (content_area), label);
 *  gtk_widget_show (dialog);
 * }
 * ```
 * 
 * # GtkDialog as GtkBuildable
 * 
 * The `GtkDialog` implementation of the `GtkBuildable` interface exposes the
 * @content_area as an internal child with the name “content_area”.
 * 
 * `GtkDialog` supports a custom `<action-widgets>` element, which can contain
 * multiple `<action-widget>` elements. The “response” attribute specifies a
 * numeric response, and the content of the element is the id of widget
 * (which should be a child of the dialogs @action_area). To mark a response
 * as default, set the “default” attribute of the `<action-widget>` element
 * to true.
 * 
 * `GtkDialog` supports adding action widgets by specifying “action” as
 * the “type” attribute of a `<child>` element. The widget will be added
 * either to the action area or the headerbar of the dialog, depending
 * on the “use-header-bar” property. The response id has to be associated
 * with the action widget using the `<action-widgets>` element.
 * 
 * An example of a `GtkDialog` UI definition fragment:
 * 
 * ```xml
 * <object class="GtkDialog" id="dialog1">
 *   <child type="action">
 *     <object class="GtkButton" id="button_cancel"/>
 *   </child>
 *   <child type="action">
 *     <object class="GtkButton" id="button_ok">
 *     </object>
 *   </child>
 *   <action-widgets>
 *     <action-widget response="cancel">button_cancel</action-widget>
 *     <action-widget response="ok" default="true">button_ok</action-widget>
 *   </action-widgets>
 * </object>
 * ```
 * 
 * # Accessibility
 * 
 * `GtkDialog` uses the %GTK_ACCESSIBLE_ROLE_DIALOG role.
 *
 */
@interface OGTKDialog : OGTKWindow
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkDialog*)castedGObject;

/**
 * Adds an activatable widget to the action area of a `GtkDialog`.
 * 
 * GTK connects a signal handler that will emit the
 * [signal@Gtk.Dialog::response] signal on the dialog when the widget
 * is activated. The widget is appended to the end of the dialog’s action
 * area.
 * 
 * If you want to add a non-activatable widget, simply pack it into
 * the @action_area field of the `GtkDialog` struct.
 *
 * @param child an activatable widget
 * @param responseId response ID for @child
 */
- (void)addActionWidgetWithChild:(OGTKWidget*)child responseId:(int)responseId;

/**
 * Adds a button with the given text.
 * 
 * GTK arranges things so that clicking the button will emit the
 * [signal@Gtk.Dialog::response] signal with the given @response_id.
 * The button is appended to the end of the dialog’s action area.
 * The button widget is returned, but usually you don’t need it.
 *
 * @param buttonText text of button
 * @param responseId response ID for the button
 * @return the `GtkButton` widget that was added
 */
- (OGTKWidget*)addButtonWithButtonText:(OFString*)buttonText responseId:(int)responseId;

/**
 * Returns the content area of @dialog.
 *
 * @return the content area `GtkBox`.
 */
- (OGTKWidget*)contentArea;

/**
 * Returns the header bar of @dialog.
 * 
 * Note that the headerbar is only used by the dialog if the
 * [property@Gtk.Dialog:use-header-bar] property is %TRUE.
 *
 * @return the header bar
 */
- (OGTKWidget*)headerBar;

/**
 * Gets the response id of a widget in the action area
 * of a dialog.
 *
 * @param widget a widget in the action area of @dialog
 * @return the response id of @widget, or %GTK_RESPONSE_NONE
 *  if @widget doesn’t have a response id set.
 */
- (int)responseForWidget:(OGTKWidget*)widget;

/**
 * Gets the widget button that uses the given response ID in the action area
 * of a dialog.
 *
 * @param responseId the response ID used by the @dialog widget
 * @return the @widget button that uses the given
 *   @response_id
 */
- (OGTKWidget*)widgetForResponse:(int)responseId;

/**
 * Emits the ::response signal with the given response ID.
 * 
 * Used to indicate that the user has responded to the dialog in some way.
 *
 * @param responseId response ID
 */
- (void)response:(int)responseId;

/**
 * Sets the default widget for the dialog based on the response ID.
 * 
 * Pressing “Enter” normally activates the default widget.
 *
 * @param responseId a response ID
 */
- (void)setDefaultResponse:(int)responseId;

/**
 * A convenient way to sensitize/desensitize dialog buttons.
 * 
 * Calls `gtk_widget_set_sensitive (widget, @setting)`
 * for each widget in the dialog’s action area with the given @response_id.
 *
 * @param responseId a response ID
 * @param setting %TRUE for sensitive
 */
- (void)setResponseSensitiveWithResponseId:(int)responseId setting:(bool)setting;

@end