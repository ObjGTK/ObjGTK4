/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

@class OGGdkDrop;

/**
 * `GtkDropTarget` is an event controller to receive Drag-and-Drop operations.
 * 
 * The most basic way to use a `GtkDropTarget` to receive drops on a
 * widget is to create it via [ctor@Gtk.DropTarget.new], passing in the
 * `GType` of the data you want to receive and connect to the
 * [signal@Gtk.DropTarget::drop] signal to receive the data:
 * 
 * ```c
 * static gboolean
 * on_drop (GtkDropTarget *target,
 *          const GValue  *value,
 *          double         x,
 *          double         y,
 *          gpointer       data)
 * {
 *   MyWidget *self = data;
 * 
 *   // Call the appropriate setter depending on the type of data
 *   // that we received
 *   if (G_VALUE_HOLDS (value, G_TYPE_FILE))
 *     my_widget_set_file (self, g_value_get_object (value));
 *   else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))
 *     my_widget_set_pixbuf (self, g_value_get_object (value));
 *   else
 *     return FALSE;
 * 
 *   return TRUE;
 * }
 * 
 * static void
 * my_widget_init (MyWidget *self)
 * {
 *   GtkDropTarget *target =
 *     gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);
 * 
 *   // This widget accepts two types of drop types: GFile objects
 *   // and GdkPixbuf objects
 *   gtk_drop_target_set_gtypes (target, (GType [2]) {
 *     G_TYPE_FILE,
 *     GDK_TYPE_PIXBUF,
 *   }, 2);
 * 
 *   g_signal_connect (target, "drop", G_CALLBACK (on_drop), self);
 *   gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));
 * }
 * ```
 * 
 * `GtkDropTarget` supports more options, such as:
 * 
 *  * rejecting potential drops via the [signal@Gtk.DropTarget::accept] signal
 *    and the [method@Gtk.DropTarget.reject] function to let other drop
 *    targets handle the drop
 *  * tracking an ongoing drag operation before the drop via the
 *    [signal@Gtk.DropTarget::enter], [signal@Gtk.DropTarget::motion] and
 *    [signal@Gtk.DropTarget::leave] signals
 *  * configuring how to receive data by setting the
 *    [property@Gtk.DropTarget:preload] property and listening for its
 *    availability via the [property@Gtk.DropTarget:value] property
 * 
 * However, `GtkDropTarget` is ultimately modeled in a synchronous way
 * and only supports data transferred via `GType`. If you want full control
 * over an ongoing drop, the [class@Gtk.DropTargetAsync] object gives you
 * this ability.
 * 
 * While a pointer is dragged over the drop target's widget and the drop
 * has not been rejected, that widget will receive the
 * %GTK_STATE_FLAG_DROP_ACTIVE state, which can be used to style the widget.
 * 
 * If you are not interested in receiving the drop, but just want to update
 * UI state during a Drag-and-Drop operation (e.g. switching tabs), you can
 * use [class@Gtk.DropControllerMotion].
 *
 */
@interface OGTKDropTarget : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)initWithType:(GType)type actions:(GdkDragAction)actions;

/**
 * Methods
 */

- (GtkDropTarget*)castedGObject;

/**
 * Gets the actions that this drop target supports.
 *
 * @return the actions that this drop target supports
 */
- (GdkDragAction)actions;

/**
 * Gets the currently handled drop operation.
 * 
 * If no drop operation is going on, %NULL is returned.
 *
 * @return The current drop
 */
- (OGGdkDrop*)currentDrop;

/**
 * Gets the currently handled drop operation.
 * 
 * If no drop operation is going on, %NULL is returned.
 *
 * @return The current drop
 */
- (OGGdkDrop*)drop;

/**
 * Gets the data formats that this drop target accepts.
 * 
 * If the result is %NULL, all formats are expected to be supported.
 *
 * @return the supported data formats
 */
- (GdkContentFormats*)formats;

/**
 * Gets the list of supported `GType`s that can be dropped on the target.
 * 
 * If no types have been set, `NULL` will be returned.
 *
 * @param ntypes the number of `GType`s contained in the
 *   return value
 * @return the `G_TYPE_INVALID`-terminated array of types included in
 *   formats
 */
- (const GType*)gtypes:(gsize*)ntypes;

/**
 * Gets whether data should be preloaded on hover.
 *
 * @return %TRUE if drop data should be preloaded
 */
- (bool)preload;

/**
 * Gets the current drop data, as a `GValue`.
 *
 * @return The current drop data
 */
- (const GValue*)value;

/**
 * Rejects the ongoing drop operation.
 * 
 * If no drop operation is ongoing, i.e when [property@Gtk.DropTarget:current-drop]
 * is %NULL, this function does nothing.
 * 
 * This function should be used when delaying the decision
 * on whether to accept a drag or not until after reading
 * the data.
 *
 */
- (void)reject;

/**
 * Sets the actions that this drop target supports.
 *
 * @param actions the supported actions
 */
- (void)setActions:(GdkDragAction)actions;

/**
 * Sets the supported `GType`s for this drop target.
 *
 * @param types all supported `GType`s
 *   that can be dropped on the target
 * @param ntypes number of @types
 */
- (void)setGtypesWithTypes:(GType*)types ntypes:(gsize)ntypes;

/**
 * Sets whether data should be preloaded on hover.
 *
 * @param preload %TRUE to preload drop data
 */
- (void)setPreload:(bool)preload;

@end