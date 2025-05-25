/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGInputStream;
@class OGdkDevice;
@class OGdkDisplay;
@class OGdkDrag;
@class OGdkSurface;

/**
 * The `GdkDrop` object represents the target of an ongoing DND operation.
 * 
 * Possible drop sites get informed about the status of the ongoing drag
 * operation with events of type %GDK_DRAG_ENTER, %GDK_DRAG_LEAVE,
 * %GDK_DRAG_MOTION and %GDK_DROP_START. The `GdkDrop` object can be obtained
 * from these [class@Gdk.Event] types using [method@Gdk.DNDEvent.get_drop].
 * 
 * The actual data transfer is initiated from the target side via an async
 * read, using one of the `GdkDrop` methods for this purpose:
 * [method@Gdk.Drop.read_async] or [method@Gdk.Drop.read_value_async].
 * 
 * GTK provides a higher level abstraction based on top of these functions,
 * and so they are not normally needed in GTK applications. See the
 * "Drag and Drop" section of the GTK documentation for more information.
 *
 */
@interface OGdkDrop : OGObject
{

}

/**
 * Functions and class methods
 */
+ (void)load;

+ (GTypeClass*)gObjectClass;

/**
 * Methods
 */

- (GdkDrop*)castedGObject;

/**
 * Ends the drag operation after a drop.
 * 
 * The @action must be a single action selected from the actions
 * available via [method@Gdk.Drop.get_actions].
 *
 * @param action the action performed by the destination or 0 if the drop failed
 */
- (void)finishWithAction:(GdkDragAction)action;

/**
 * Returns the possible actions for this `GdkDrop`.
 * 
 * If this value contains multiple actions - i.e.
 * [func@Gdk.DragAction.is_unique] returns %FALSE for the result -
 * [method@Gdk.Drop.finish] must choose the action to use when
 * accepting the drop. This will only happen if you passed
 * %GDK_ACTION_ASK as one of the possible actions in
 * [method@Gdk.Drop.status]. %GDK_ACTION_ASK itself will not
 * be included in the actions returned by this function.
 * 
 * This value may change over the lifetime of the [class@Gdk.Drop]
 * both as a response to source side actions as well as to calls to
 * [method@Gdk.Drop.status] or [method@Gdk.Drop.finish]. The source
 * side will not change this value anymore once a drop has started.
 *
 * @return The possible `GdkDragActions`
 */
- (GdkDragAction)actions;

/**
 * Returns the `GdkDevice` performing the drop.
 *
 * @return The `GdkDevice` performing the drop.
 */
- (OGdkDevice*)device;

/**
 * Gets the `GdkDisplay` that @self was created for.
 *
 * @return a `GdkDisplay`
 */
- (OGdkDisplay*)display;

/**
 * If this is an in-app drag-and-drop operation, returns the `GdkDrag`
 * that corresponds to this drop.
 * 
 * If it is not, %NULL is returned.
 *
 * @return the corresponding `GdkDrag`
 */
- (OGdkDrag*)drag;

/**
 * Returns the `GdkContentFormats` that the drop offers the data
 * to be read in.
 *
 * @return The possible `GdkContentFormats`
 */
- (GdkContentFormats*)formats;

/**
 * Returns the `GdkSurface` performing the drop.
 *
 * @return The `GdkSurface` performing the drop.
 */
- (OGdkSurface*)surface;

/**
 * Asynchronously read the dropped data from a `GdkDrop`
 * in a format that complies with one of the mime types.
 *
 * @param mimeTypes pointer to an array of mime types
 * @param ioPriority the I/O priority for the read operation
 * @param cancellable optional `GCancellable` object
 * @param callback a `GAsyncReadyCallback` to call when
 *   the request is satisfied
 * @param userData the data to pass to @callback
 */
- (void)readAsyncWithMimeTypes:(const char**)mimeTypes ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an async drop read operation.
 * 
 * Note that you must not use blocking read calls on the returned stream
 * in the GTK thread, since some platforms might require communication with
 * GTK to complete the data transfer. You can use async APIs such as
 * g_input_stream_read_bytes_async().
 * 
 * See [method@Gdk.Drop.read_async].
 *
 * @param result a `GAsyncResult`
 * @param outMimeType return location for the used mime type
 * @return the `GInputStream`
 */
- (OGInputStream*)readFinishWithResult:(GAsyncResult*)result outMimeType:(const char**)outMimeType;

/**
 * Asynchronously request the drag operation's contents converted
 * to the given @type.
 * 
 * When the operation is finished @callback will be called. You must
 * then call [method@Gdk.Drop.read_value_finish] to get the resulting
 * `GValue`.
 * 
 * For local drag-and-drop operations that are available in the given
 * `GType`, the value will be copied directly. Otherwise, GDK will
 * try to use [func@Gdk.content_deserialize_async] to convert the data.
 *
 * @param type a `GType` to read
 * @param ioPriority the I/O priority of the request.
 * @param cancellable optional `GCancellable` object, %NULL to ignore.
 * @param callback callback to call when the request is satisfied
 * @param userData the data to pass to callback function
 */
- (void)readValueAsyncWithType:(GType)type ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an async drop read.
 * 
 * See [method@Gdk.Drop.read_value_async].
 *
 * @param result a `GAsyncResult`
 * @return a `GValue` containing the result.
 */
- (const GValue*)readValueFinishWithResult:(GAsyncResult*)result;

/**
 * Selects all actions that are potentially supported by the destination.
 * 
 * When calling this function, do not restrict the passed in actions to
 * the ones provided by [method@Gdk.Drop.get_actions]. Those actions may
 * change in the future, even depending on the actions you provide here.
 * 
 * The @preferred action is a hint to the drag-and-drop mechanism about which
 * action to use when multiple actions are possible.
 * 
 * This function should be called by drag destinations in response to
 * %GDK_DRAG_ENTER or %GDK_DRAG_MOTION events. If the destination does
 * not yet know the exact actions it supports, it should set any possible
 * actions first and then later call this function again.
 *
 * @param actions Supported actions of the destination, or 0 to indicate
 *    that a drop will not be accepted
 * @param preferred A unique action that's a member of @actions indicating the
 *    preferred action
 */
- (void)statusWithActions:(GdkDragAction)actions preferred:(GdkDragAction)preferred;

@end