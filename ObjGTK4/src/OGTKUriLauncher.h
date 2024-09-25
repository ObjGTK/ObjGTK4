/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

@class OGTKWindow;
@class OGCancellable;

/**
 * A `GtkUriLauncher` object collects the arguments that are needed to open a uri
 * with an application.
 * 
 * Depending on system configuration, user preferences and available APIs, this
 * may or may not show an app chooser dialog or launch the default application
 * right away.
 * 
 * The operation is started with the [method@Gtk.UriLauncher.launch] function.
 * This API follows the GIO async pattern, and the result can be obtained by
 * calling [method@Gtk.UriLauncher.launch_finish].
 * 
 * To launch a file, use [class@Gtk.FileLauncher].
 *
 */
@interface OGTKUriLauncher : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(OFString*)uri;

/**
 * Methods
 */

- (GtkUriLauncher*)castedGObject;

/**
 * Gets the uri that will be opened.
 *
 * @return the uri
 */
- (OFString*)uri;

/**
 * Launch an application to open the uri.
 * 
 * This may present an app chooser dialog to the user.
 * 
 * The @callback will be called when the operation is completed.
 * It should call [method@Gtk.UriLauncher.launch_finish] to obtain
 * the result.
 *
 * @param parent the parent `GtkWindow`
 * @param cancellable a `GCancellable` to cancel the operation
 * @param callback a callback to call when the operation is complete
 * @param userData data to pass to @callback
 */
- (void)launchWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the [method@Gtk.UriLauncher.launch] call and
 * returns the result.
 *
 * @param result a `GAsyncResult`
 * @return `TRUE` if an application was launched,
 *     or `FALSE` and @error is set
 */
- (bool)launchFinish:(GAsyncResult*)result;

/**
 * Sets the uri that will be opened.
 *
 * @param uri the uri
 */
- (void)setUri:(OFString*)uri;

@end