/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGInputStream;

/**
 * A `GdkContentDeserializer` is used to deserialize content received via
 * inter-application data transfers.
 * 
 * The `GdkContentDeserializer` transforms serialized content that is
 * identified by a mime type into an object identified by a GType.
 * 
 * GTK provides serializers and deserializers for common data types
 * such as text, colors, images or file lists. To register your own
 * deserialization functions, use [func@content_register_deserializer].
 * 
 * Also see [class@Gdk.ContentSerializer].
 *
 */
@interface OGGdkContentDeserializer : OGObject
{

}


/**
 * Methods
 */

- (GdkContentDeserializer*)castedGObject;

/**
 * Gets the cancellable for the current operation.
 * 
 * This is the `GCancellable` that was passed to [func@Gdk.content_deserialize_async].
 *
 * @return the cancellable for the current operation
 */
- (OGCancellable*)cancellable;

/**
 * Gets the `GType` to create an instance of.
 *
 * @return the `GType` for the current operation
 */
- (GType)gtype;

/**
 * Gets the input stream for the current operation.
 * 
 * This is the stream that was passed to [func@Gdk.content_deserialize_async].
 *
 * @return the input stream for the current operation
 */
- (OGInputStream*)inputStream;

/**
 * Gets the mime type to deserialize from.
 *
 * @return the mime type for the current operation
 */
- (OFString*)mimeType;

/**
 * Gets the I/O priority for the current operation.
 * 
 * This is the priority that was passed to [func@Gdk.content_deserialize_async].
 *
 * @return the I/O priority for the current operation
 */
- (int)priority;

/**
 * Gets the data that was associated with the current operation.
 * 
 * See [method@Gdk.ContentDeserializer.set_task_data].
 *
 * @return the task data for @deserializer
 */
- (gpointer)taskData;

/**
 * Gets the user data that was passed when the deserializer was registered.
 *
 * @return the user data for this deserializer
 */
- (gpointer)userData;

/**
 * Gets the `GValue` to store the deserialized object in.
 *
 * @return the `GValue` for the current operation
 */
- (GValue*)value;

/**
 * Indicate that the deserialization has ended with an error.
 * 
 * This function consumes @error.
 *
 * @param error a `GError`
 */
- (void)returnError:(GError*)error;

/**
 * Indicate that the deserialization has been successfully completed.
 *
 */
- (void)returnSuccess;

/**
 * Associate data with the current deserialization operation.
 *
 * @param data data to associate with this operation
 * @param notify destroy notify for @data
 */
- (void)setTaskDataWithData:(gpointer)data notify:(GDestroyNotify)notify;

@end