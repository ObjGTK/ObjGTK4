/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGestureSingle.h"

@class OGGdkDrag;
@class OGGdkContentProvider;

/**
 * `GtkDragSource` is an event controller to initiate Drag-And-Drop operations.
 * 
 * `GtkDragSource` can be set up with the necessary
 * ingredients for a DND operation ahead of time. This includes
 * the source for the data that is being transferred, in the form
 * of a [class@Gdk.ContentProvider], the desired action, and the icon to
 * use during the drag operation. After setting it up, the drag
 * source must be added to a widget as an event controller, using
 * [method@Gtk.Widget.add_controller].
 * 
 * ```c
 * static void
 * my_widget_init (MyWidget *self)
 * {
 *   GtkDragSource *drag_source = gtk_drag_source_new ();
 * 
 *   g_signal_connect (drag_source, "prepare", G_CALLBACK (on_drag_prepare), self);
 *   g_signal_connect (drag_source, "drag-begin", G_CALLBACK (on_drag_begin), self);
 * 
 *   gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (drag_source));
 * }
 * ```
 * 
 * Setting up the content provider and icon ahead of time only makes
 * sense when the data does not change. More commonly, you will want
 * to set them up just in time. To do so, `GtkDragSource` has
 * [signal@Gtk.DragSource::prepare] and [signal@Gtk.DragSource::drag-begin]
 * signals.
 * 
 * The ::prepare signal is emitted before a drag is started, and
 * can be used to set the content provider and actions that the
 * drag should be started with.
 * 
 * ```c
 * static GdkContentProvider *
 * on_drag_prepare (GtkDragSource *source,
 *                  double         x,
 *                  double         y,
 *                  MyWidget      *self)
 * {
 *   // This widget supports two types of content: GFile objects
 *   // and GdkPixbuf objects; GTK will handle the serialization
 *   // of these types automatically
 *   GFile *file = my_widget_get_file (self);
 *   GdkPixbuf *pixbuf = my_widget_get_pixbuf (self);
 * 
 *   return gdk_content_provider_new_union ((GdkContentProvider *[2]) {
 *       gdk_content_provider_new_typed (G_TYPE_FILE, file),
 *       gdk_content_provider_new_typed (GDK_TYPE_PIXBUF, pixbuf),
 *     }, 2);
 * }
 * ```
 * 
 * The ::drag-begin signal is emitted after the `GdkDrag` object has
 * been created, and can be used to set up the drag icon.
 * 
 * ```c
 * static void
 * on_drag_begin (GtkDragSource *source,
 *                GdkDrag       *drag,
 *                MyWidget      *self)
 * {
 *   // Set the widget as the drag icon
 *   GdkPaintable *paintable = gtk_widget_paintable_new (GTK_WIDGET (self));
 *   gtk_drag_source_set_icon (source, paintable, 0, 0);
 *   g_object_unref (paintable);
 * }
 * ```
 * 
 * During the DND operation, `GtkDragSource` emits signals that
 * can be used to obtain updates about the status of the operation,
 * but it is not normally necessary to connect to any signals,
 * except for one case: when the supported actions include
 * %GDK_ACTION_MOVE, you need to listen for the
 * [signal@Gtk.DragSource::drag-end] signal and delete the
 * data after it has been transferred.
 *
 */
@interface OGTKDragSource : OGTKGestureSingle
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (GtkDragSource*)castedGObject;

/**
 * Cancels a currently ongoing drag operation.
 *
 */
- (void)dragCancel;

/**
 * Gets the actions that are currently set on the `GtkDragSource`.
 *
 * @return the actions set on @source
 */
- (GdkDragAction)actions;

/**
 * Gets the current content provider of a `GtkDragSource`.
 *
 * @return the `GdkContentProvider` of @source
 */
- (OGGdkContentProvider*)content;

/**
 * Returns the underlying `GdkDrag` object for an ongoing drag.
 *
 * @return the `GdkDrag` of the current
 *   drag operation
 */
- (OGGdkDrag*)drag;

/**
 * Sets the actions on the `GtkDragSource`.
 * 
 * During a DND operation, the actions are offered to potential
 * drop targets. If @actions include %GDK_ACTION_MOVE, you need
 * to listen to the [signal@Gtk.DragSource::drag-end] signal and
 * handle @delete_data being %TRUE.
 * 
 * This function can be called before a drag is started,
 * or in a handler for the [signal@Gtk.DragSource::prepare] signal.
 *
 * @param actions the actions to offer
 */
- (void)setActions:(GdkDragAction)actions;

/**
 * Sets a content provider on a `GtkDragSource`.
 * 
 * When the data is requested in the cause of a DND operation,
 * it will be obtained from the content provider.
 * 
 * This function can be called before a drag is started,
 * or in a handler for the [signal@Gtk.DragSource::prepare] signal.
 * 
 * You may consider setting the content provider back to
 * %NULL in a [signal@Gtk.DragSource::drag-end] signal handler.
 *
 * @param content a `GdkContentProvider`
 */
- (void)setContent:(OGGdkContentProvider*)content;

/**
 * Sets a paintable to use as icon during DND operations.
 * 
 * The hotspot coordinates determine the point on the icon
 * that gets aligned with the hotspot of the cursor.
 * 
 * If @paintable is %NULL, a default icon is used.
 * 
 * This function can be called before a drag is started, or in
 * a [signal@Gtk.DragSource::prepare] or
 * [signal@Gtk.DragSource::drag-begin] signal handler.
 *
 * @param paintable the `GdkPaintable` to use as icon
 * @param hotX the hotspot X coordinate on the icon
 * @param hotY the hotspot Y coordinate on the icon
 */
- (void)setIconWithPaintable:(GdkPaintable*)paintable hotX:(int)hotX hotY:(int)hotY;

@end