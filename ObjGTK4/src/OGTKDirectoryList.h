/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkDirectoryList` is a list model that wraps g_file_enumerate_children_async().
 * 
 * It presents a `GListModel` and fills it asynchronously with the `GFileInfo`s
 * returned from that function.
 * 
 * Enumeration will start automatically when the
 * [property@Gtk.DirectoryList:file] property is set.
 * 
 * While the `GtkDirectoryList` is being filled, the
 * [property@Gtk.DirectoryList:loading] property will be set to %TRUE. You can
 * listen to that property if you want to show information like a `GtkSpinner`
 * or a "Loading..." text.
 * 
 * If loading fails at any point, the [property@Gtk.DirectoryList:error]
 * property will be set to give more indication about the failure.
 * 
 * The `GFileInfo`s returned from a `GtkDirectoryList` have the "standard::file"
 * attribute set to the `GFile` they refer to. This way you can get at the file
 * that is referred to in the same way you would via g_file_enumerator_get_child().
 * This means you do not need access to the `GtkDirectoryList`, but can access
 * the `GFile` directly from the `GFileInfo` when operating with a `GtkListView`
 * or similar.
 *
 */
@interface OGTKDirectoryList : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithAttributes:(OFString*)attributes file:(GFile*)file;

/**
 * Methods
 */

- (GtkDirectoryList*)castedGObject;

/**
 * Gets the attributes queried on the children.
 *
 * @return The queried attributes
 */
- (OFString*)attributes;

/**
 * Gets the loading error, if any.
 * 
 * If an error occurs during the loading process, the loading process
 * will finish and this property allows querying the error that happened.
 * This error will persist until a file is loaded again.
 * 
 * An error being set does not mean that no files were loaded, and all
 * successfully queried files will remain in the list.
 *
 * @return The loading error or %NULL if
 *   loading finished successfully
 */
- (const GError*)error;

/**
 * Gets the file whose children are currently enumerated.
 *
 * @return The file whose children are enumerated
 */
- (GFile*)file;

/**
 * Gets the IO priority set via gtk_directory_list_set_io_priority().
 *
 * @return The IO priority.
 */
- (int)ioPriority;

/**
 * Returns whether the directory list is monitoring
 * the directory for changes.
 *
 * @return %TRUE if the directory is monitored
 */
- (bool)monitored;

/**
 * Returns %TRUE if the children enumeration is currently in
 * progress.
 * 
 * Files will be added to @self from time to time while loading is
 * going on. The order in which are added is undefined and may change
 * in between runs.
 *
 * @return %TRUE if @self is loading
 */
- (bool)isLoading;

/**
 * Sets the @attributes to be enumerated and starts the enumeration.
 * 
 * If @attributes is %NULL, the list of file infos will still be created, it will just
 * not contain any extra attributes.
 *
 * @param attributes the attributes to enumerate
 */
- (void)setAttributes:(OFString*)attributes;

/**
 * Sets the @file to be enumerated and starts the enumeration.
 * 
 * If @file is %NULL, the result will be an empty list.
 *
 * @param file the `GFile` to be enumerated
 */
- (void)setFile:(GFile*)file;

/**
 * Sets the IO priority to use while loading directories.
 * 
 * Setting the priority while @self is loading will reprioritize the
 * ongoing load as soon as possible.
 * 
 * The default IO priority is %G_PRIORITY_DEFAULT, which is higher than
 * the GTK redraw priority. If you are loading a lot of directories in
 * parallel, lowering it to something like %G_PRIORITY_DEFAULT_IDLE
 * may increase responsiveness.
 *
 * @param ioPriority IO priority to use
 */
- (void)setIoPriority:(int)ioPriority;

/**
 * Sets whether the directory list will monitor the directory
 * for changes.
 * 
 * If monitoring is enabled, the ::items-changed signal will
 * be emitted when the directory contents change.
 * 
 * 
 * When monitoring is turned on after the initial creation
 * of the directory list, the directory is reloaded to avoid
 * missing files that appeared between the initial loading
 * and when monitoring was turned on.
 *
 * @param monitored %TRUE to monitor the directory for changes
 */
- (void)setMonitored:(bool)monitored;

@end