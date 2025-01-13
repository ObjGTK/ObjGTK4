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
 * A `GtkFileLauncher` object collects the arguments that are needed to open a
 * file with an application.
 * 
 * Depending on system configuration, user preferences and available APIs, this
 * may or may not show an app chooser dialog or launch the default application
 * right away.
 * 
 * The operation is started with the [method@Gtk.FileLauncher.launch] function.
 * This API follows the GIO async pattern, and the result can be obtained by
 * calling [method@Gtk.FileLauncher.launch_finish].
 * 
 * To launch uris that don't represent files, use [class@Gtk.UriLauncher].
 *
 */
@interface OGTKFileLauncher : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)fileLauncherWithFile:(GFile*)file;

/**
 * Methods
 */

- (GtkFileLauncher*)castedGObject;

/**
 * Returns whether to ask the user to choose an app for opening the file.
 *
 * @return `TRUE` if always asking for app
 */
- (bool)alwaysAsk;

/**
 * Gets the file that will be opened.
 *
 * @return the file
 */
- (GFile*)file;

/**
 * Returns whether to make the file writable for the handler.
 *
 * @return `TRUE` if the file will be made writable
 */
- (bool)writable;

/**
 * Launch an application to open the file.
 * 
 * This may present an app chooser dialog to the user.
 * 
 * The @callback will be called when the operation is completed.
 * It should call [method@Gtk.FileLauncher.launch_finish] to obtain
 * the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)launchWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FileLauncher.launch] call and
 * returns the result.
 *
 * @param result a `GAsyncResult`
 * @return `TRUE` if an application was launched,
 *     or `FALSE` and @error is set
 */
- (bool)launchFinishWithResult:(GAsyncResult*)result;

/**
 * Launch a file manager to show the file in its parent directory.
 * 
 * This is only supported native files. It will fail if @file
 * is e.g. a http:// uri.
 * 
 * The @callback will be called when the operation is completed.
 * It should call [method@Gtk.FileLauncher.open_containing_folder_finish]
 * to obtain the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)openContainingFolderWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.FileLauncher.open_containing_folder]
 * call and returns the result.
 *
 * @param result a `GAsyncResult`
 * @return `TRUE` if an application was launched,
 *     or `FALSE` and @error is set
 */
- (bool)openContainingFolderFinishWithResult:(GAsyncResult*)result;

/**
 * Sets whether to awlays ask the user to choose an app for opening the file.
 * If `FALSE`, the file might be opened with a default app or the previous choice.
 *
 * @param alwaysAsk a `gboolean`
 */
- (void)setAlwaysAsk:(bool)alwaysAsk;

/**
 * Sets the file that will be opened.
 *
 * @param file a `GFile`
 */
- (void)setFile:(GFile*)file;

/**
 * Sets whether to make the file writable for the handler.
 *
 * @param writable a `gboolean`
 */
- (void)setWritable:(bool)writable;

@end