/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * `GtkRecentManager` manages and looks up recently used files.
 * 
 * Each recently used file is identified by its URI, and has meta-data
 * associated to it, like the names and command lines of the applications
 * that have registered it, the number of time each application has
 * registered the same file, the mime type of the file and whether
 * the file should be displayed only by the applications that have
 * registered it.
 * 
 * The recently used files list is per user.
 * 
 * `GtkRecentManager` acts like a database of all the recently
 * used files. You can create new `GtkRecentManager` objects, but
 * it is more efficient to use the default manager created by GTK.
 * 
 * Adding a new recently used file is as simple as:
 * 
 * ```c
 * GtkRecentManager *manager;
 * 
 * manager = gtk_recent_manager_get_default ();
 * gtk_recent_manager_add_item (manager, file_uri);
 * ```
 * 
 * The `GtkRecentManager` will try to gather all the needed information
 * from the file itself through GIO.
 * 
 * Looking up the meta-data associated with a recently used file
 * given its URI requires calling [method@Gtk.RecentManager.lookup_item]:
 * 
 * ```c
 * GtkRecentManager *manager;
 * GtkRecentInfo *info;
 * GError *error = NULL;
 * 
 * manager = gtk_recent_manager_get_default ();
 * info = gtk_recent_manager_lookup_item (manager, file_uri, &error);
 * if (error)
 *   {
 *     g_warning ("Could not find the file: %s", error->message);
 *     g_error_free (error);
 *   }
 * else
 *  {
 *    // Use the info object
 *    gtk_recent_info_unref (info);
 *  }
 * ```
 * 
 * In order to retrieve the list of recently used files, you can use
 * [method@Gtk.RecentManager.get_items], which returns a list of
 * [struct@Gtk.RecentInfo].
 * 
 * Note that the maximum age of the recently used files list is
 * controllable through the [property@Gtk.Settings:gtk-recent-files-max-age]
 * property.
 *
 */
@interface OGTKRecentManager : OGObject
{

}

/**
 * Functions
 */

/**
 * Gets a unique instance of `GtkRecentManager` that you can share
 * in your application without caring about memory management.
 *
 * @return A unique `GtkRecentManager`. Do not ref or
 *   unref it.
 */
+ (OGTKRecentManager*)default;

/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkRecentManager*)castedGObject;

/**
 * Adds a new resource, pointed by @uri, into the recently used
 * resources list, using the metadata specified inside the
 * `GtkRecentData` passed in @recent_data.
 * 
 * The passed URI will be used to identify this resource inside the
 * list.
 * 
 * In order to register the new recently used resource, metadata about
 * the resource must be passed as well as the URI; the metadata is
 * stored in a `GtkRecentData`, which must contain the MIME
 * type of the resource pointed by the URI; the name of the application
 * that is registering the item, and a command line to be used when
 * launching the item.
 * 
 * Optionally, a `GtkRecentData` might contain a UTF-8 string
 * to be used when viewing the item instead of the last component of
 * the URI; a short description of the item; whether the item should
 * be considered private - that is, should be displayed only by the
 * applications that have registered it.
 *
 * @param uri a valid URI
 * @param recentData metadata of the resource
 * @return %TRUE if the new item was successfully added to the
 *   recently used resources list, %FALSE otherwise
 */
- (bool)addFullWithUri:(OFString*)uri recentData:(const GtkRecentData*)recentData;

/**
 * Adds a new resource, pointed by @uri, into the recently used
 * resources list.
 * 
 * This function automatically retrieves some of the needed
 * metadata and setting other metadata to common default values;
 * it then feeds the data to [method@Gtk.RecentManager.add_full].
 * 
 * See [method@Gtk.RecentManager.add_full] if you want to explicitly
 * define the metadata for the resource pointed by @uri.
 *
 * @param uri a valid URI
 * @return %TRUE if the new item was successfully added
 *   to the recently used resources list
 */
- (bool)addItem:(OFString*)uri;

/**
 * Gets the list of recently used resources.
 *
 * @return a list of
 *   newly allocated `GtkRecentInfo objects`. Use
 *   [method@Gtk.RecentInfo.unref] on each item inside the list, and then
 *   free the list itself using g_list_free().
 */
- (GList*)items;

/**
 * Checks whether there is a recently used resource registered
 * with @uri inside the recent manager.
 *
 * @param uri a URI
 * @return %TRUE if the resource was found, %FALSE otherwise
 */
- (bool)hasItem:(OFString*)uri;

/**
 * Searches for a URI inside the recently used resources list, and
 * returns a `GtkRecentInfo` containing information about the resource
 * like its MIME type, or its display name.
 *
 * @param uri a URI
 * @return a `GtkRecentInfo` containing information
 *   about the resource pointed by @uri, or %NULL if the URI was
 *   not registered in the recently used resources list. Free with
 *   [method@Gtk.RecentInfo.unref].
 */
- (GtkRecentInfo*)lookupItem:(OFString*)uri;

/**
 * Changes the location of a recently used resource from @uri to @new_uri.
 * 
 * Please note that this function will not affect the resource pointed
 * by the URIs, but only the URI used in the recently used resources list.
 *
 * @param uri the URI of a recently used resource
 * @param newUri the new URI of the recently used resource, or
 *    %NULL to remove the item pointed by @uri in the list
 * @return %TRUE on success
 */
- (bool)moveItemWithUri:(OFString*)uri newUri:(OFString*)newUri;

/**
 * Purges every item from the recently used resources list.
 *
 * @return the number of items that have been removed from the
 *   recently used resources list
 */
- (int)purgeItems;

/**
 * Removes a resource pointed by @uri from the recently used resources
 * list handled by a recent manager.
 *
 * @param uri the URI of the item you wish to remove
 * @return %TRUE if the item pointed by @uri has been successfully
 *   removed by the recently used resources list, and %FALSE otherwise
 */
- (bool)removeItem:(OFString*)uri;

@end