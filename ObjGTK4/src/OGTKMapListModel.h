/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import <OGObject/OGObject.h>

/**
 * A `GtkMapListModel` maps the items in a list model to different items.
 * 
 * `GtkMapListModel` uses a [callback@Gtk.MapListModelMapFunc].
 * 
 * Example: Create a list of `GtkEventControllers`
 * ```c
 * static gpointer
 * map_to_controllers (gpointer widget,
 *                     gpointer data)
 * {
 *   gpointer result = gtk_widget_observe_controllers (widget);
 *   g_object_unref (widget);
 *   return result;
 * }
 * 
 * widgets = gtk_widget_observe_children (widget);
 * 
 * controllers = gtk_map_list_model_new (widgets,
 *                                       map_to_controllers,
 *                                       NULL, NULL);
 * 
 * model = gtk_flatten_list_model_new (GTK_TYPE_EVENT_CONTROLLER,
 *                                     controllers);
 * ```
 * 
 * `GtkMapListModel` will attempt to discard the mapped objects as soon as
 * they are no longer needed and recreate them if necessary.
 * 
 * `GtkMapListModel` passes through sections from the underlying model.
 *
 */
@interface OGTKMapListModel : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithModel:(GListModel*)model mapFunc:(GtkMapListModelMapFunc)mapFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy;

/**
 * Methods
 */

- (GtkMapListModel*)castedGObject;

/**
 * Gets the model that is currently being mapped or %NULL if none.
 *
 * @return The model that gets mapped
 */
- (GListModel*)model;

/**
 * Checks if a map function is currently set on @self.
 *
 * @return %TRUE if a map function is set
 */
- (bool)hasMap;

/**
 * Sets the function used to map items.
 * 
 * The function will be called whenever an item needs to be mapped
 * and must return the item to use for the given input item.
 * 
 * Note that `GtkMapListModel` may call this function multiple times
 * on the same item, because it may delete items it doesn't need anymore.
 * 
 * GTK makes no effort to ensure that @map_func conforms to the item type
 * of @self. It assumes that the caller knows what they are doing and the map
 * function returns items of the appropriate type.
 *
 * @param mapFunc map function
 * @param userData user data passed to @map_func
 * @param userDestroy destroy notifier for @user_data
 */
- (void)setMapFuncWithMapFunc:(GtkMapListModelMapFunc)mapFunc userData:(gpointer)userData userDestroy:(GDestroyNotify)userDestroy;

/**
 * Sets the model to be mapped.
 * 
 * GTK makes no effort to ensure that @model conforms to the item type
 * expected by the map function. It assumes that the caller knows what
 * they are doing and have set up an appropriate map function.
 *
 * @param model The model to be mapped
 */
- (void)setModel:(GListModel*)model;

@end