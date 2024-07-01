/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDialog.h"

@class OGTKWidget;

/**
 * `GtkMessageDialog` presents a dialog with some message text.
 * 
 * ![An example GtkMessageDialog](messagedialog.png)
 * 
 * It’s simply a convenience widget; you could construct the equivalent of
 * `GtkMessageDialog` from `GtkDialog` without too much effort, but
 * `GtkMessageDialog` saves typing.
 * 
 * The easiest way to do a modal message dialog is to use the %GTK_DIALOG_MODAL
 * flag, which will call [method@Gtk.Window.set_modal] internally. The dialog will
 * prevent interaction with the parent window until it's hidden or destroyed.
 * You can use the [signal@Gtk.Dialog::response] signal to know when the user
 * dismissed the dialog.
 * 
 * An example for using a modal dialog:
 * ```c
 * GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT | GTK_DIALOG_MODAL;
 * dialog = gtk_message_dialog_new (parent_window,
 *                                  flags,
 *                                  GTK_MESSAGE_ERROR,
 *                                  GTK_BUTTONS_CLOSE,
 *                                  "Error reading “%s”: %s",
 *                                  filename,
 *                                  g_strerror (errno));
 * // Destroy the dialog when the user responds to it
 * // (e.g. clicks a button)
 * 
 * g_signal_connect (dialog, "response",
 *                   G_CALLBACK (gtk_window_destroy),
 *                   NULL);
 * ```
 * 
 * You might do a non-modal `GtkMessageDialog` simply by omitting the
 * %GTK_DIALOG_MODAL flag:
 * 
 * ```c
 * GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
 * dialog = gtk_message_dialog_new (parent_window,
 *                                  flags,
 *                                  GTK_MESSAGE_ERROR,
 *                                  GTK_BUTTONS_CLOSE,
 *                                  "Error reading “%s”: %s",
 *                                  filename,
 *                                  g_strerror (errno));
 * 
 * // Destroy the dialog when the user responds to it
 * // (e.g. clicks a button)
 * g_signal_connect (dialog, "response",
 *                   G_CALLBACK (gtk_window_destroy),
 *                   NULL);
 * ```
 * 
 * # GtkMessageDialog as GtkBuildable
 * 
 * The `GtkMessageDialog` implementation of the `GtkBuildable` interface exposes
 * the message area as an internal child with the name “message_area”.
 *
 */
@interface OGTKMessageDialog : OGTKDialog
{

}


/**
 * Methods
 */

- (GtkMessageDialog*)castedGObject;

/**
 * Returns the message area of the dialog.
 * 
 * This is the box where the dialog’s primary and secondary labels
 * are packed. You can add your own extra content to that box and it
 * will appear below those labels. See [method@Gtk.Dialog.get_content_area]
 * for the corresponding function in the parent [class@Gtk.Dialog].
 *
 * @return A `GtkBox` corresponding to the
 *   “message area” in the @message_dialog
 */
- (OGTKWidget*)messageArea;

/**
 * Sets the text of the message dialog.
 *
 * @param str string with Pango markup
 */
- (void)setMarkup:(OFString*)str;

@end