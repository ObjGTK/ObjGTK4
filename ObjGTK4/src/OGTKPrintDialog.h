/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGOutputStream;
@class OGTKPageSetup;
@class OGTKPrintSettings;
@class OGTKWindow;

/**
 * A `GtkPrintDialog` object collects the arguments that
 * are needed to present a print dialog to the user, such
 * as a title for the dialog and whether it should be modal.
 * 
 * The dialog is shown with the [method@Gtk.PrintDialog.setup] function.
 * The actual printing can be done with [method@Gtk.PrintDialog.print] or
 * [method@Gtk.PrintDialog.print_file]. These APIs follows the GIO async pattern,
 * and the results can be obtained by calling the corresponding finish methods.
 *
 */
@interface OGTKPrintDialog : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkPrintDialog*)castedGObject;

/**
 * Returns the label that will be shown on the
 * accept button of the print dialog.
 *
 * @return the accept label
 */
- (OFString*)acceptLabel;

/**
 * Returns whether the print dialog blocks
 * interaction with the parent window while
 * it is presented.
 *
 * @return whether the print dialog is modal
 */
- (bool)modal;

/**
 * Returns the page setup.
 *
 * @return the page setup
 */
- (OGTKPageSetup*)pageSetup;

/**
 * Returns the print settings for the print dialog.
 *
 * @return the settings
 */
- (OGTKPrintSettings*)printSettings;

/**
 * Returns the title that will be shown on the
 * print dialog.
 *
 * @return the title
 */
- (OFString*)title;

/**
 * This function prints content from a stream.
 * 
 * If you pass `NULL` as @setup, then this method will present a print dialog.
 * Otherwise, it will attempt to print directly, without user interaction.
 * 
 * The @callback will be called when the printing is done. It should call
 * [method@Gtk.PrintDialog.print_finish] to obtain the results.
 *
 * @param parent the parent `GtkWindow`
 * @param setup the `GtkPrintSetup` to use
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)printWithParent:(OGTKWindow*)parent setup:(GtkPrintSetup*)setup cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * This function prints a file.
 * 
 * If you pass `NULL` as @setup, then this method will present a print dialog.
 * Otherwise, it will attempt to print directly, without user interaction.
 * 
 * The @callback will be called when the printing is done. It should call
 * [method@Gtk.PrintDialog.print_file_finish] to obtain the results.
 *
 * @param parent the parent `GtkWindow`
 * @param setup the `GtkPrintSetup` to use
 * @param file the `GFile` to print
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)printFileWithParent:(OGTKWindow*)parent setup:(GtkPrintSetup*)setup file:(GFile*)file cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.PrintDialog.print_file] call and
 * returns the results.
 *
 * @param result a `GAsyncResult`
 * @return Whether the call was successful
 */
- (bool)printFileFinish:(GAsyncResult*)result;

/**
 * Finishes the [method@Gtk.PrintDialog.print] call and
 * returns the results.
 * 
 * If the call was successful, the content to be printed should be
 * written to the returned output stream. Otherwise, `NULL` is returned.
 * 
 * The overall results of the print operation will be returned in the
 * [method@Gio.OutputStream.close] call, so if you are interested in the
 * results, you need to explicitly close the output stream (it will be
 * closed automatically if you just unref it). Be aware that the close
 * call may not be instant as it operation will for the printer to finish
 * printing.
 *
 * @param result a `GAsyncResult`
 * @return a [class@Gio.OutputStream]
 */
- (OGOutputStream*)printFinish:(GAsyncResult*)result;

/**
 * Sets the label that will be shown on the
 * accept button of the print dialog shown for
 * [method@Gtk.PrintDialog.setup].
 *
 * @param acceptLabel the new accept label
 */
- (void)setAcceptLabel:(OFString*)acceptLabel;

/**
 * Sets whether the print dialog blocks
 * interaction with the parent window while
 * it is presented.
 *
 * @param modal the new value
 */
- (void)setModal:(bool)modal;

/**
 * Set the page setup for the print dialog.
 *
 * @param pageSetup the new page setup
 */
- (void)setPageSetup:(OGTKPageSetup*)pageSetup;

/**
 * Sets the print settings for the print dialog.
 *
 * @param printSettings the new print settings
 */
- (void)setPrintSettings:(OGTKPrintSettings*)printSettings;

/**
 * Sets the title that will be shown on the print dialog.
 *
 * @param title the new title
 */
- (void)setTitle:(OFString*)title;

/**
 * This function presents a print dialog to let the user select a printer,
 * and set up print settings and page setup.
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.PrintDialog.setup_finish]
 * to obtain the results in the form of a [struct@Gtk.PrintSetup],
 * that can then be passed to [method@Gtk.PrintDialog.print]
 * or [method@Gtk.PrintDialog.print_file].
 * 
 * One possible use for this method is to have the user select a printer,
 * then show a page setup UI in the application (e.g. to arrange images
 * on a page), then call [method@Gtk.PrintDialog.print] on @self
 * to do the printing without further user interaction.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)setupWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.PrintDialog.setup] call.
 * 
 * If the call was successful, it returns a [struct@Gtk.PrintSetup]
 * which contains the print settings and page setup information that
 * will be used to print.
 *
 * @param result a `GAsyncResult`
 * @return The `GtkPrintSetup` object that resulted from the call,
 *   or `NULL` if the call was not successful
 */
- (GtkPrintSetup*)setupFinish:(GAsyncResult*)result;

@end