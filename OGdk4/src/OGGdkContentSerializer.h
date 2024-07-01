/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGOutputStream;
@class OGCancellable;

/**
 * A `GdkContentSerializer` is used to serialize content for
 * inter-application data transfers.
 * 
 * The `GdkContentSerializer` transforms an object that is identified
 * by a GType into a serialized form (i.e. a byte stream) that is
 * identified by a mime type.
 * 
 * GTK provides serializers and deserializers for common data types
 * such as text, colors, images or file lists. To register your own
 * serialization functions, use [func@Gdk.content_register_serializer].
 * 
 * Also see [class@Gdk.ContentDeserializer].
 *
 */
@interface OGGdkContentSerializer : OGObject
{

}


/**
 * Methods
 */

- (GdkContentSerializer*)castedGObject;

/**
 * Gets the cancellable for the current operation.
 * 
 * This is the `GCancellable` that was passed to [func@content_serialize_async].
 *
 * @return the cancellable for the current operation
 */
- (OGCancellable*)cancellable;

/**
 * Gets the `GType` to of the object to serialize.
 *
 * @return the `GType` for the current operation
 */
- (GType)gtype;

/**
 * Gets the mime type to serialize to.
 *
 * @return the mime type for the current operation
 */
- (OFString*)mimeType;

/**
 * Gets the output stream for the current operation.
 * 
 * This is the stream that was passed to [func@content_serialize_async].
 *
 * @return the output stream for the current operation
 */
- (OGOutputStream*)outputStream;

/**
 * Gets the I/O priority for the current operation.
 * 
 * This is the priority that was passed to [func@content_serialize_async].
 *
 * @return the I/O priority for the current operation
 */
- (int)priority;

/**
 * Gets the data that was associated with the current operation.
 * 
 * See [method@Gdk.ContentSerializer.set_task_data].
 *
 * @return the task data for @serializer
 */
- (gpointer)taskData;

/**
 * Gets the user data that was passed when the serializer was registered.
 *
 * @return the user data for this serializer
 */
- (gpointer)userData;

/**
 * Gets the `GValue` to read the object to serialize from.
 *
 * @return the `GValue` for the current operation
 */
- (const GValue*)value;

/**
 * Indicate that the serialization has ended with an error.
 * 
 * This function consumes @error.
 *
 * @param error a `GError`
 */
- (void)returnError:(GError*)error;

/**
 * Indicate that the serialization has been successfully completed.
 *
 */
- (void)returnSuccess;

/**
 * Associate data with the current serialization operation.
 *
 * @param data data to associate with this operation
 * @param notify destroy notify for @data
 */
- (void)setTaskDataWithData:(gpointer)data notify:(GDestroyNotify)notify;

@end