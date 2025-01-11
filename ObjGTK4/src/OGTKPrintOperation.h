/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKPageSetup;
@class OGTKPrintSettings;
@class OGTKWindow;

/**
 * `GtkPrintOperation` is the high-level, portable printing API.
 * 
 * It looks a bit different than other GTK dialogs such as the
 * `GtkFileChooser`, since some platforms don’t expose enough
 * infrastructure to implement a good print dialog. On such
 * platforms, `GtkPrintOperation` uses the native print dialog.
 * On platforms which do not provide a native print dialog, GTK
 * uses its own, see [class@Gtk.PrintUnixDialog].
 * 
 * The typical way to use the high-level printing API is to create
 * a `GtkPrintOperation` object with [ctor@Gtk.PrintOperation.new]
 * when the user selects to print. Then you set some properties on it,
 * e.g. the page size, any [class@Gtk.PrintSettings] from previous print
 * operations, the number of pages, the current page, etc.
 * 
 * Then you start the print operation by calling [method@Gtk.PrintOperation.run].
 * It will then show a dialog, let the user select a printer and options.
 * When the user finished the dialog, various signals will be emitted on
 * the `GtkPrintOperation`, the main one being
 * [signal@Gtk.PrintOperation::draw-page], which you are supposed to handle
 * and render the page on the provided [class@Gtk.PrintContext] using Cairo.
 * 
 * # The high-level printing API
 * 
 * ```c
 * static GtkPrintSettings *settings = NULL;
 * 
 * static void
 * do_print (void)
 * {
 *   GtkPrintOperation *print;
 *   GtkPrintOperationResult res;
 * 
 *   print = gtk_print_operation_new ();
 * 
 *   if (settings != NULL)
 *     gtk_print_operation_set_print_settings (print, settings);
 * 
 *   g_signal_connect (print, "begin_print", G_CALLBACK (begin_print), NULL);
 *   g_signal_connect (print, "draw_page", G_CALLBACK (draw_page), NULL);
 * 
 *   res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
 *                                  GTK_WINDOW (main_window), NULL);
 * 
 *   if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
 *     {
 *       if (settings != NULL)
 *         g_object_unref (settings);
 *       settings = g_object_ref (gtk_print_operation_get_print_settings (print));
 *     }
 * 
 *   g_object_unref (print);
 * }
 * ```
 * 
 * By default `GtkPrintOperation` uses an external application to do
 * print preview. To implement a custom print preview, an application
 * must connect to the preview signal. The functions
 * [method@Gtk.PrintOperationPreview.render_page],
 * [method@Gtk.PrintOperationPreview.end_preview] and
 * [method@Gtk.PrintOperationPreview.is_selected]
 * are useful when implementing a print preview.
 *
 */
@interface OGTKPrintOperation : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)printOperation;

/**
 * Methods
 */

- (GtkPrintOperation*)castedGObject;

/**
 * Cancels a running print operation.
 * 
 * This function may be called from a [signal@Gtk.PrintOperation::begin-print],
 * [signal@Gtk.PrintOperation::paginate] or [signal@Gtk.PrintOperation::draw-page]
 * signal handler to stop the currently running print operation.
 *
 */
- (void)cancel;

/**
 * Signal that drawing of particular page is complete.
 * 
 * It is called after completion of page drawing (e.g. drawing
 * in another thread). If [method@Gtk.PrintOperation.set_defer_drawing]
 * was called before, then this function has to be called by application.
 * Otherwise it is called by GTK itself.
 *
 */
- (void)drawPageFinish;

/**
 * Returns the default page setup.
 *
 * @return the default page setup
 */
- (OGTKPageSetup*)defaultPageSetup;

/**
 * Gets whether page setup selection combos are embedded
 *
 * @return whether page setup selection combos are embedded
 */
- (bool)embedPageSetup;

/**
 * Call this when the result of a print operation is
 * %GTK_PRINT_OPERATION_RESULT_ERROR.
 * 
 * It can be called either after [method@Gtk.PrintOperation.run]
 * returns, or in the [signal@Gtk.PrintOperation::done] signal
 * handler.
 * 
 * The returned `GError` will contain more details on what went wrong.
 *
 */
- (void)error;

/**
 * Gets whether there is a selection.
 *
 * @return whether there is a selection
 */
- (bool)hasSelection;

/**
 * Returns the number of pages that will be printed.
 * 
 * Note that this value is set during print preparation phase
 * (%GTK_PRINT_STATUS_PREPARING), so this function should never be
 * called before the data generation phase (%GTK_PRINT_STATUS_GENERATING_DATA).
 * You can connect to the [signal@Gtk.PrintOperation::status-changed]
 * signal and call gtk_print_operation_get_n_pages_to_print() when
 * print status is %GTK_PRINT_STATUS_GENERATING_DATA.
 * 
 * This is typically used to track the progress of print operation.
 *
 * @return the number of pages that will be printed
 */
- (int)npagesToPrint;

/**
 * Returns the current print settings.
 * 
 * Note that the return value is %NULL until either
 * [method@Gtk.PrintOperation.set_print_settings] or
 * [method@Gtk.PrintOperation.run] have been called.
 *
 * @return the current print settings of @op.
 */
- (OGTKPrintSettings*)printSettings;

/**
 * Returns the status of the print operation.
 * 
 * Also see [method@Gtk.PrintOperation.get_status_string].
 *
 * @return the status of the print operation
 */
- (GtkPrintStatus)status;

/**
 * Returns a string representation of the status of the
 * print operation.
 * 
 * The string is translated and suitable for displaying
 * the print status e.g. in a `GtkStatusbar`.
 * 
 * Use [method@Gtk.PrintOperation.get_status] to obtain
 * a status value that is suitable for programmatic use.
 *
 * @return a string representation of the status
 *    of the print operation
 */
- (OFString*)statusString;

/**
 * Gets whether the application supports print of selection
 *
 * @return whether the application supports print of selection
 */
- (bool)supportSelection;

/**
 * A convenience function to find out if the print operation
 * is finished.
 * 
 * a print operation is finished if its status is either
 * %GTK_PRINT_STATUS_FINISHED or %GTK_PRINT_STATUS_FINISHED_ABORTED.
 * 
 * Note: when you enable print status tracking the print operation
 * can be in a non-finished state even after done has been called, as
 * the operation status then tracks the print job status on the printer.
 *
 * @return %TRUE, if the print operation is finished.
 */
- (bool)isFinished;

/**
 * Runs the print operation.
 * 
 * Normally that this function does not return until the rendering
 * of all pages is complete. You can connect to the
 * [signal@Gtk.PrintOperation::status-changed] signal on @op to obtain
 * some information about the progress of the print operation.
 * 
 * Furthermore, it may use a recursive mainloop to show the print dialog.
 * 
 * If you set the [Gtk.PrintOperation:allow-async] property, the operation
 * will run asynchronously if this is supported on the platform. The
 * [signal@Gtk.PrintOperation::done] signal will be emitted with the result
 * of the operation when the it is done (i.e. when the dialog is canceled,
 * or when the print succeeds or fails).
 * 
 * ```c
 * if (settings != NULL)
 *   gtk_print_operation_set_print_settings (print, settings);
 * 
 * if (page_setup != NULL)
 *   gtk_print_operation_set_default_page_setup (print, page_setup);
 * 
 * g_signal_connect (print, "begin-print",
 *                   G_CALLBACK (begin_print), &data);
 * g_signal_connect (print, "draw-page",
 *                   G_CALLBACK (draw_page), &data);
 * 
 * res = gtk_print_operation_run (print,
 *                                GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
 *                                parent,
 *                                &error);
 * 
 * if (res == GTK_PRINT_OPERATION_RESULT_ERROR)
 *  {
 *    error_dialog = gtk_message_dialog_new (GTK_WINDOW (parent),
 *   			                     GTK_DIALOG_DESTROY_WITH_PARENT,
 * 					     GTK_MESSAGE_ERROR,
 * 					     GTK_BUTTONS_CLOSE,
 * 					     "Error printing file:\n%s",
 * 					     error->message);
 *    g_signal_connect (error_dialog, "response",
 *                      G_CALLBACK (gtk_window_destroy), NULL);
 *    gtk_window_present (GTK_WINDOW (error_dialog));
 *    g_error_free (error);
 *  }
 * else if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
 *  {
 *    if (settings != NULL)
 * g_object_unref (settings);
 *    settings = g_object_ref (gtk_print_operation_get_print_settings (print));
 *  }
 * ```
 * 
 * Note that gtk_print_operation_run() can only be called once on a
 * given `GtkPrintOperation`.
 *
 * @param action the action to start
 * @param parent Transient parent of the dialog
 * @return the result of the print operation. A return value of
 *   %GTK_PRINT_OPERATION_RESULT_APPLY indicates that the printing was
 *   completed successfully. In this case, it is a good idea to obtain
 *   the used print settings with
 *   [method@Gtk.PrintOperation.get_print_settings]
 *   and store them for reuse with the next print operation. A value of
 *   %GTK_PRINT_OPERATION_RESULT_IN_PROGRESS means the operation is running
 *   asynchronously, and will emit the [signal@Gtk.PrintOperation::done]
 *   signal when done.
 */
- (GtkPrintOperationResult)runWithAction:(GtkPrintOperationAction)action parent:(OGTKWindow*)parent;

/**
 * Sets whether gtk_print_operation_run() may return
 * before the print operation is completed.
 * 
 * Note that some platforms may not allow asynchronous
 * operation.
 *
 * @param allowAsync %TRUE to allow asynchronous operation
 */
- (void)setAllowAsync:(bool)allowAsync;

/**
 * Sets the current page.
 * 
 * If this is called before [method@Gtk.PrintOperation.run],
 * the user will be able to select to print only the current page.
 * 
 * Note that this only makes sense for pre-paginated documents.
 *
 * @param currentPage the current page, 0-based
 */
- (void)setCurrentPage:(int)currentPage;

/**
 * Sets the label for the tab holding custom widgets.
 *
 * @param label the label to use, or %NULL to use the default label
 */
- (void)setCustomTabLabel:(OFString*)label;

/**
 * Makes @default_page_setup the default page setup for @op.
 * 
 * This page setup will be used by [method@Gtk.PrintOperation.run],
 * but it can be overridden on a per-page basis by connecting
 * to the [signal@Gtk.PrintOperation::request-page-setup] signal.
 *
 * @param defaultPageSetup a `GtkPageSetup`
 */
- (void)setDefaultPageSetup:(OGTKPageSetup*)defaultPageSetup;

/**
 * Sets up the `GtkPrintOperation` to wait for calling of
 * [method@Gtk.PrintOperation.draw_page_finish from application.
 * 
 * This can be used for drawing page in another thread.
 * 
 * This function must be called in the callback of the
 * [signal@Gtk.PrintOperation::draw-page] signal.
 *
 */
- (void)setDeferDrawing;

/**
 * Embed page size combo box and orientation combo box into page setup page.
 * 
 * Selected page setup is stored as default page setup in `GtkPrintOperation`.
 *
 * @param embed %TRUE to embed page setup selection in the `GtkPrintUnixDialog`
 */
- (void)setEmbedPageSetup:(bool)embed;

/**
 * Sets up the `GtkPrintOperation` to generate a file instead
 * of showing the print dialog.
 * 
 * The intended use of this function is for implementing
 * “Export to PDF” actions. Currently, PDF is the only supported
 * format.
 * 
 * “Print to PDF” support is independent of this and is done
 * by letting the user pick the “Print to PDF” item from the list
 * of printers in the print dialog.
 *
 * @param filename the filename for the exported file
 */
- (void)setExportFilename:(OFString*)filename;

/**
 * Sets whether there is a selection to print.
 * 
 * Application has to set number of pages to which the selection
 * will draw by [method@Gtk.PrintOperation.set_n_pages] in a handler
 * for the [signal@Gtk.PrintOperation::begin-print] signal.
 *
 * @param hasSelection %TRUE indicates that a selection exists
 */
- (void)setHasSelection:(bool)hasSelection;

/**
 * Sets the name of the print job.
 * 
 * The name is used to identify the job (e.g. in monitoring
 * applications like eggcups).
 * 
 * If you don’t set a job name, GTK picks a default one by
 * numbering successive print jobs.
 *
 * @param jobName a string that identifies the print job
 */
- (void)setJobName:(OFString*)jobName;

/**
 * Sets the number of pages in the document.
 * 
 * This must be set to a positive number before the rendering
 * starts. It may be set in a [signal@Gtk.PrintOperation::begin-print]
 * signal handler.
 * 
 * Note that the page numbers passed to the
 * [signal@Gtk.PrintOperation::request-page-setup]
 * and [signal@Gtk.PrintOperation::draw-page] signals are 0-based, i.e.
 * if the user chooses to print all pages, the last ::draw-page signal
 * will be for page @n_pages - 1.
 *
 * @param npages the number of pages
 */
- (void)setNpages:(int)npages;

/**
 * Sets the print settings for @op.
 * 
 * This is typically used to re-establish print settings
 * from a previous print operation, see [method@Gtk.PrintOperation.run].
 *
 * @param printSettings `GtkPrintSettings`
 */
- (void)setPrintSettings:(OGTKPrintSettings*)printSettings;

/**
 * If @show_progress is %TRUE, the print operation will show
 * a progress dialog during the print operation.
 *
 * @param showProgress %TRUE to show a progress dialog
 */
- (void)setShowProgress:(bool)showProgress;

/**
 * Sets whether selection is supported by `GtkPrintOperation`.
 *
 * @param supportSelection %TRUE to support selection
 */
- (void)setSupportSelection:(bool)supportSelection;

/**
 * If track_status is %TRUE, the print operation will try to continue
 * report on the status of the print job in the printer queues and printer.
 * 
 * This can allow your application to show things like “out of paper”
 * issues, and when the print job actually reaches the printer.
 * 
 * This function is often implemented using some form of polling,
 * so it should not be enabled unless needed.
 *
 * @param trackStatus %TRUE to track status after printing
 */
- (void)setTrackPrintStatus:(bool)trackStatus;

/**
 * Sets up the transformation for the cairo context obtained from
 * `GtkPrintContext` in such a way that distances are measured in
 * units of @unit.
 *
 * @param unit the unit to use
 */
- (void)setUnit:(GtkUnit)unit;

/**
 * If @full_page is %TRUE, the transformation for the cairo context
 * obtained from `GtkPrintContext` puts the origin at the top left
 * corner of the page.
 * 
 * This may not be the top left corner of the sheet, depending on page
 * orientation and the number of pages per sheet). Otherwise, the origin
 * is at the top left corner of the imageable area (i.e. inside the margins).
 *
 * @param fullPage %TRUE to set up the `GtkPrintContext` for the full page
 */
- (void)setUseFullPage:(bool)fullPage;

@end