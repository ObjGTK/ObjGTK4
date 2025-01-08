/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGTKWindow;

/**
 * A `GtkAlertDialog` object collects the arguments that
 * are needed to present a message to the user.
 * 
 * The message is shown with the [method@Gtk.AlertDialog.choose]
 * function. This API follows the GIO async pattern, and the result can
 * be obtained by calling [method@Gtk.AlertDialog.choose_finish].
 * 
 * If you don't need to wait for a button to be clicked, you can use
 * [method@Gtk.AlertDialog.show].
 *
 */
@interface OGTKAlertDialog : OGObject
{

}


/**
 * Methods
 */

- (GtkAlertDialog*)castedGObject;

/**
 * This function shows the alert to the user.
 * 
 * The @callback will be called when the alert is dismissed.
 * It should call [method@Gtk.AlertDialog.choose_finish]
 * to obtain the result.
 * 
 * It is ok to pass `NULL` for the callback if the alert
 * does not have more than one button. A simpler API for
 * this case is [method@Gtk.AlertDialog.show].
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)chooseWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.AlertDialog.choose] call
 * and returns the index of the button that was clicked.
 *
 * @param result a `GAsyncResult`
 * @return the index of the button that was clicked, or -1 if
 *   the dialog was cancelled and [property@Gtk.AlertDialog:cancel-button]
 *   is not set
 */
- (int)chooseFinish:(GAsyncResult*)result;

/**
 * Returns the button labels for the alert.
 *
 * @return the button labels
 */
- (const char* const*)buttons;

/**
 * Returns the index of the cancel button.
 *
 * @return the index of the cancel button, or -1
 */
- (int)cancelButton;

/**
 * Returns the index of the default button.
 *
 * @return the index of the default button, or -1
 */
- (int)defaultButton;

/**
 * Returns the detail text that will be shown in the alert.
 *
 * @return the detail text
 */
- (OFString*)detail;

/**
 * Returns the message that will be shown in the alert.
 *
 * @return the message
 */
- (OFString*)message;

/**
 * Returns whether the alert blocks interaction
 * with the parent window while it is presented.
 *
 * @return `TRUE` if the alert is modal
 */
- (bool)modal;

/**
 * Sets the button labels for the alert.
 *
 * @param labels the new button labels
 */
- (void)setButtons:(const char* const*)labels;

/**
 * Sets the index of the cancel button.
 * 
 * See [property@Gtk.AlertDialog:cancel-button] for
 * details of how this value is used.
 *
 * @param button the new cancel button
 */
- (void)setCancelButton:(int)button;

/**
 * Sets the index of the default button.
 * 
 * See [property@Gtk.AlertDialog:default-button] for
 * details of how this value is used.
 *
 * @param button the new default button
 */
- (void)setDefaultButton:(int)button;

/**
 * Sets the detail text that will be shown in the alert.
 *
 * @param detail the new detail text
 */
- (void)setDetail:(OFString*)detail;

/**
 * Sets the message that will be shown in the alert.
 *
 * @param message the new message
 */
- (void)setMessage:(OFString*)message;

/**
 * Sets whether the alert blocks interaction
 * with the parent window while it is presented.
 *
 * @param modal the new value
 */
- (void)setModal:(bool)modal;

/**
 * Show the alert to the user.
 * 
 * This function is a simple version of [method@Gtk.AlertDialog.choose]
 * intended for dialogs with a single button.
 * If you want to cancel the dialog or if the alert has more than one button,
 * you should use that function instead and provide it with a #GCancellable or
 * callback respectively.
 *
 * @param parent the parent `GtkWindow`
 */
- (void)show:(OGTKWindow*)parent;

@end