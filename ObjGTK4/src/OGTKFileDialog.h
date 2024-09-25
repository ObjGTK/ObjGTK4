/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGTKWindow;
@class OGTKFileFilter;

/**
 * A `GtkFileDialog` object collects the arguments that
 * are needed to present a file chooser dialog to the
 * user, such as a title for the dialog and whether it
 * should be modal.
 * 
 * The dialog is shown with [method@Gtk.FileDialog.open],
 * [method@Gtk.FileDialog.save], etc. These APIs follow the
 * GIO async pattern, and the result can be obtained by calling
 * the corresponding finish function, for example
 * [method@Gtk.FileDialog.open_finish].
 *
 */
@interface OGTKFileDialog : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkFileDialog*)castedGObject;

/**
 *
 * @return the label shown on the file chooser's accept button.
 */
- (OFString*)acceptLabel;

/**
 * Gets the filter that will be selected by default
 * in the file chooser dialog.
 *
 * @return the current filter
 */
- (OGTKFileFilter*)defaultFilter;

/**
 * Gets the filters that will be offered to the user
 * in the file chooser dialog.
 *
 * @return the filters, as
 *   a `GListModel` of `GtkFileFilters`
 */
- (GListModel*)filters;

/**
 * Gets the file that will be initially selected in
 * the file chooser dialog.
 *
 * @return the file
 */
- (GFile*)initialFile;

/**
 * Gets the folder that will be set as the
 * initial folder in the file chooser dialog.
 *
 * @return the folder
 */
- (GFile*)initialFolder;

/**
 * Gets the name for the file that should be initially set.
 *
 * @return the name
 */
- (OFString*)initialName;

/**
 * Returns whether the file chooser dialog
 * blocks interaction with the parent window
 * while it is presented.
 *
 * @return `TRUE` if the file chooser dialog is modal
 */
- (bool)modal;

/**
 * Returns the title that will be shown on the
 * file chooser dialog.
 *
 * @return the title
 */
- (OFString*)title;

/**
 * This function initiates a file selection operation by
 * presenting a file chooser dialog to the user.
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FileDialog.open_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)openWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FileDialog.open] call and
 * returns the resulting file.
 *
 * @param result a `GAsyncResult`
 * @return the file that was selected.
 *   Otherwise, `NULL` is returned and @error is set
 */
- (GFile*)openFinish:(GAsyncResult*)result;

/**
 * This function initiates a multi-file selection operation by
 * presenting a file chooser dialog to the user.
 * 
 * The file chooser will initially be opened in the directory
 * [property@Gtk.FileDialog:initial-folder].
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FileDialog.open_multiple_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)openMultipleWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FileDialog.open] call and
 * returns the resulting files in a `GListModel`.
 *
 * @param result a `GAsyncResult`
 * @return the file that was selected,
 *   as a `GListModel` of `GFiles`. Otherwise, `NULL` is returned
 *   and @error is set
 */
- (GListModel*)openMultipleFinish:(GAsyncResult*)result;

/**
 * This function initiates a file save operation by
 * presenting a file chooser dialog to the user.
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FileDialog.save_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)saveWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FileDialog.save] call and
 * returns the resulting file.
 *
 * @param result a `GAsyncResult`
 * @return the file that was selected.
 *   Otherwise, `NULL` is returned and @error is set
 */
- (GFile*)saveFinish:(GAsyncResult*)result;

/**
 * This function initiates a directory selection operation by
 * presenting a file chooser dialog to the user.
 * 
 * If you pass @initial_folder, the file chooser will initially be
 * opened in the parent directory of that folder, otherwise, it
 * will be in the directory [property@Gtk.FileDialog:initial-folder].
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FileDialog.select_folder_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)selectFolderWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FileDialog.select_folder] call and
 * returns the resulting file.
 *
 * @param result a `GAsyncResult`
 * @return the file that was selected.
 *   Otherwise, `NULL` is returned and @error is set
 */
- (GFile*)selectFolderFinish:(GAsyncResult*)result;

/**
 * This function initiates a multi-directory selection operation by
 * presenting a file chooser dialog to the user.
 * 
 * The file chooser will initially be opened in the directory
 * [property@Gtk.FileDialog:initial-folder].
 * 
 * The @callback will be called when the dialog is dismissed.
 * It should call [method@Gtk.FileDialog.select_multiple_folders_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)selectMultipleFoldersWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FileDialog.select_multiple_folders]
 * call and returns the resulting files in a `GListModel`.
 *
 * @param result a `GAsyncResult`
 * @return the file that was selected,
 *   as a `GListModel` of `GFiles`. Otherwise, `NULL` is returned
 *   and @error is set
 */
- (GListModel*)selectMultipleFoldersFinish:(GAsyncResult*)result;

/**
 * Sets the label shown on the file chooser's accept button.
 * 
 * Leaving the accept label unset or setting it as `NULL` will fall back to
 * a default label, depending on what API is used to launch the file dialog.
 *
 * @param acceptLabel the new accept label
 */
- (void)setAcceptLabel:(OFString*)acceptLabel;

/**
 * Sets the filter that will be selected by default
 * in the file chooser dialog.
 * 
 * If set to %NULL, the first item in [property@Gtk.FileDialog:filters]
 * will be used as the default filter. If that list is empty, the dialog
 * will be unfiltered.
 *
 * @param filter a `GtkFileFilter`
 */
- (void)setDefaultFilter:(OGTKFileFilter*)filter;

/**
 * Sets the filters that will be offered to the user
 * in the file chooser dialog.
 *
 * @param filters a `GListModel` of `GtkFileFilters`
 */
- (void)setFilters:(GListModel*)filters;

/**
 * Sets the file that will be initially selected in
 * the file chooser dialog.
 * 
 * This function is a shortcut for calling both
 * gtk_file_dialog_set_initial_folder() and
 * gtk_file_dialog_set_initial_name() with the directory and
 * name of @file respectively.
 *
 * @param file a `GFile`
 */
- (void)setInitialFile:(GFile*)file;

/**
 * Sets the folder that will be set as the
 * initial folder in the file chooser dialog.
 *
 * @param folder a `GFile`
 */
- (void)setInitialFolder:(GFile*)folder;

/**
 * Sets the name for the file that should be initially set.
 * For saving dialogs, this will usually be pre-entered into the name field.
 * 
 * If a file with this name already exists in the directory set via
 * [property@Gtk.FileDialog:initial-folder], the dialog should preselect it.
 *
 * @param name a UTF8 string
 */
- (void)setInitialName:(OFString*)name;

/**
 * Sets whether the file chooser dialog
 * blocks interaction with the parent window
 * while it is presented.
 *
 * @param modal the new value
 */
- (void)setModal:(bool)modal;

/**
 * Sets the title that will be shown on the
 * file chooser dialog.
 *
 * @param title the new title
 */
- (void)setTitle:(OFString*)title;

@end