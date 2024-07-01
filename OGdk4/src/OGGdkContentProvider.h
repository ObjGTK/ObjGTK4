/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGOutputStream;

/**
 * A `GdkContentProvider` is used to provide content for the clipboard or
 * for drag-and-drop operations in a number of formats.
 * 
 * To create a `GdkContentProvider`, use [ctor@Gdk.ContentProvider.new_for_value]
 * or [ctor@Gdk.ContentProvider.new_for_bytes].
 * 
 * GDK knows how to handle common text and image formats out-of-the-box. See
 * [class@Gdk.ContentSerializer] and [class@Gdk.ContentDeserializer] if you want
 * to add support for application-specific data formats.
 *
 */
@interface OGGdkContentProvider : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initForBytesWithMimeType:(OFString*)mimeType bytes:(GBytes*)bytes;
- (instancetype)initForValue:(const GValue*)value;
- (instancetype)initUnionWithProviders:(GdkContentProvider**)providers nproviders:(gsize)nproviders;

/**
 * Methods
 */

- (GdkContentProvider*)castedGObject;

/**
 * Emits the ::content-changed signal.
 *
 */
- (void)contentChanged;

/**
 * Gets the contents of @provider stored in @value.
 * 
 * The @value will have been initialized to the `GType` the value should be
 * provided in. This given `GType` does not need to be listed in the formats
 * returned by [method@Gdk.ContentProvider.ref_formats]. However, if the
 * given `GType` is not supported, this operation can fail and
 * `G_IO_ERROR_NOT_SUPPORTED` will be reported.
 *
 * @param value the `GValue` to fill
 * @return %TRUE if the value was set successfully. Otherwise
 *   @error will be set to describe the failure.
 */
- (bool)value:(GValue*)value;

/**
 * Gets the formats that the provider can provide its current contents in.
 *
 * @return The formats of the provider
 */
- (GdkContentFormats*)refFormats;

/**
 * Gets the formats that the provider suggests other applications to store
 * the data in.
 * 
 * An example of such an application would be a clipboard manager.
 * 
 * This can be assumed to be a subset of [method@Gdk.ContentProvider.ref_formats].
 *
 * @return The storable formats of the provider
 */
- (GdkContentFormats*)refStorableFormats;

/**
 * Asynchronously writes the contents of @provider to @stream in the given
 * @mime_type.
 * 
 * When the operation is finished @callback will be called. You must then call
 * [method@Gdk.ContentProvider.write_mime_type_finish] to get the result
 * of the operation.
 * 
 * The given mime type does not need to be listed in the formats returned by
 * [method@Gdk.ContentProvider.ref_formats]. However, if the given `GType` is
 * not supported, `G_IO_ERROR_NOT_SUPPORTED` will be reported.
 * 
 * The given @stream will not be closed.
 *
 * @param mimeType the mime type to provide the data in
 * @param stream the `GOutputStream` to write to
 * @param ioPriority I/O priority of the request.
 * @param cancellable optional `GCancellable` object, %NULL to ignore.
 * @param callback callback to call when the request is satisfied
 * @param userData the data to pass to callback function
 */
- (void)writeMimeTypeAsyncWithMimeType:(OFString*)mimeType stream:(OGOutputStream*)stream ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous write operation.
 * 
 * See [method@Gdk.ContentProvider.write_mime_type_async].
 *
 * @param result a `GAsyncResult`
 * @return %TRUE if the operation was completed successfully. Otherwise
 *   @error will be set to describe the failure.
 */
- (bool)writeMimeTypeFinish:(GAsyncResult*)result;

@end