/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEventController.h"

@class OGGdkDrop;

/**
 * `GtkDropTargetAsync` is an event controller to receive Drag-and-Drop
 * operations, asynchronously.
 * 
 * It is the more complete but also more complex method of handling drop
 * operations compared to [class@Gtk.DropTarget], and you should only use
 * it if `GtkDropTarget` doesn't provide all the features you need.
 * 
 * To use a `GtkDropTargetAsync` to receive drops on a widget, you create
 * a `GtkDropTargetAsync` object, configure which data formats and actions
 * you support, connect to its signals, and then attach it to the widget
 * with [method@Gtk.Widget.add_controller].
 * 
 * During a drag operation, the first signal that a `GtkDropTargetAsync`
 * emits is [signal@Gtk.DropTargetAsync::accept], which is meant to determine
 * whether the target is a possible drop site for the ongoing drop. The
 * default handler for the ::accept signal accepts the drop if it finds
 * a compatible data format and an action that is supported on both sides.
 * 
 * If it is, and the widget becomes a target, you will receive a
 * [signal@Gtk.DropTargetAsync::drag-enter] signal, followed by
 * [signal@Gtk.DropTargetAsync::drag-motion] signals as the pointer moves,
 * optionally a [signal@Gtk.DropTargetAsync::drop] signal when a drop happens,
 * and finally a [signal@Gtk.DropTargetAsync::drag-leave] signal when the
 * pointer moves off the widget.
 * 
 * The ::drag-enter and ::drag-motion handler return a `GdkDragAction`
 * to update the status of the ongoing operation. The ::drop handler
 * should decide if it ultimately accepts the drop and if it does, it
 * should initiate the data transfer and finish the operation by calling
 * [method@Gdk.Drop.finish].
 * 
 * Between the ::drag-enter and ::drag-leave signals the widget is a
 * current drop target, and will receive the %GTK_STATE_FLAG_DROP_ACTIVE
 * state, which can be used by themes to style the widget as a drop target.
 *
 */
@interface OGTKDropTargetAsync : OGTKEventController
{

}


/**
 * Constructors
 */
- (instancetype)initWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions;

/**
 * Methods
 */

- (GtkDropTargetAsync*)castedGObject;

/**
 * Gets the actions that this drop target supports.
 *
 * @return the actions that this drop target supports
 */
- (GdkDragAction)actions;

/**
 * Gets the data formats that this drop target accepts.
 * 
 * If the result is %NULL, all formats are expected to be supported.
 *
 * @return the supported data formats
 */
- (GdkContentFormats*)formats;

/**
 * Sets the @drop as not accepted on this drag site.
 * 
 * This function should be used when delaying the decision
 * on whether to accept a drag or not until after reading
 * the data.
 *
 * @param drop the `GdkDrop` of an ongoing drag operation
 */
- (void)rejectDrop:(OGGdkDrop*)drop;

/**
 * Sets the actions that this drop target supports.
 *
 * @param actions the supported actions
 */
- (void)setActions:(GdkDragAction)actions;

/**
 * Sets the data formats that this drop target will accept.
 *
 * @param formats the supported data formats or %NULL for any format
 */
- (void)setFormats:(GdkContentFormats*)formats;

@end