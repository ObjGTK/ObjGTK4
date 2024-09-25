/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import <OGObject/OGObject.h>

@class OGGdkTexture;
@class OGCancellable;
@class OGInputStream;
@class OGGdkDisplay;
@class OGGdkContentProvider;

/**
 * The `GdkClipboard` object represents data shared between applications or
 * inside an application.
 * 
 * To get a `GdkClipboard` object, use [method@Gdk.Display.get_clipboard] or
 * [method@Gdk.Display.get_primary_clipboard]. You can find out about the data
 * that is currently available in a clipboard using
 * [method@Gdk.Clipboard.get_formats].
 * 
 * To make text or image data available in a clipboard, use
 * [method@Gdk.Clipboard.set_text] or [method@Gdk.Clipboard.set_texture].
 * For other data, you can use [method@Gdk.Clipboard.set_content], which
 * takes a [class@Gdk.ContentProvider] object.
 * 
 * To read textual or image data from a clipboard, use
 * [method@Gdk.Clipboard.read_text_async] or
 * [method@Gdk.Clipboard.read_texture_async]. For other data, use
 * [method@Gdk.Clipboard.read_async], which provides a `GInputStream` object.
 *
 */
@interface OGGdkClipboard : OGObject
{

}


/**
 * Methods
 */

- (GdkClipboard*)castedGObject;

/**
 * Returns the `GdkContentProvider` currently set on @clipboard.
 * 
 * If the @clipboard is empty or its contents are not owned by the
 * current process, %NULL will be returned.
 *
 * @return The content of a clipboard
 *   if the clipboard does not maintain any content
 */
- (OGGdkContentProvider*)content;

/**
 * Gets the `GdkDisplay` that the clipboard was created for.
 *
 * @return a `GdkDisplay`
 */
- (OGGdkDisplay*)display;

/**
 * Gets the formats that the clipboard can provide its current contents in.
 *
 * @return The formats of the clipboard
 */
- (GdkContentFormats*)formats;

/**
 * Returns if the clipboard is local.
 * 
 * A clipboard is considered local if it was last claimed
 * by the running application.
 * 
 * Note that [method@Gdk.Clipboard.get_content] may return %NULL
 * even on a local clipboard. In this case the clipboard is empty.
 *
 * @return %TRUE if the clipboard is local
 */
- (bool)isLocal;

/**
 * Asynchronously requests an input stream to read the @clipboard's
 * contents from.
 * 
 * When the operation is finished @callback will be called. You must then
 * call [method@Gdk.Clipboard.read_finish] to get the result of the operation.
 * 
 * The clipboard will choose the most suitable mime type from the given list
 * to fulfill the request, preferring the ones listed first.
 *
 * @param mimeTypes a %NULL-terminated array of mime types to choose from
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional `GCancellable` object
 * @param callback callback to call when the request is satisfied
 * @param userData the data to pass to callback function
 */
- (void)readAsyncWithMimeTypes:(const char**)mimeTypes ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous clipboard read.
 * 
 * See [method@Gdk.Clipboard.read_async].
 *
 * @param result a `GAsyncResult`
 * @param outMimeType location to store
 *   the chosen mime type
 * @return a `GInputStream`
 */
- (OGInputStream*)readFinishWithResult:(GAsyncResult*)result outMimeType:(const char**)outMimeType;

/**
 * Asynchronously request the @clipboard contents converted to a string.
 * 
 * When the operation is finished @callback will be called. You must then
 * call [method@Gdk.Clipboard.read_text_finish] to get the result.
 * 
 * This is a simple wrapper around [method@Gdk.Clipboard.read_value_async].
 * Use that function or [method@Gdk.Clipboard.read_async] directly if you
 * need more control over the operation.
 *
 * @param cancellable optional `GCancellable` object
 * @param callback callback to call when the request is satisfied
 * @param userData the data to pass to callback function
 */
- (void)readTextAsyncWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous clipboard read.
 * 
 * See [method@Gdk.Clipboard.read_text_async].
 *
 * @param result a `GAsyncResult`
 * @return a new string
 */
- (char*)readTextFinish:(GAsyncResult*)result;

/**
 * Asynchronously request the @clipboard contents converted to a `GdkPixbuf`.
 * 
 * When the operation is finished @callback will be called. You must then
 * call [method@Gdk.Clipboard.read_texture_finish] to get the result.
 * 
 * This is a simple wrapper around [method@Gdk.Clipboard.read_value_async].
 * Use that function or [method@Gdk.Clipboard.read_async] directly if you
 * need more control over the operation.
 *
 * @param cancellable optional `GCancellable` object, %NULL to ignore.
 * @param callback callback to call when the request is satisfied
 * @param userData the data to pass to callback function
 */
- (void)readTextureAsyncWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous clipboard read.
 * 
 * See [method@Gdk.Clipboard.read_texture_async].
 *
 * @param result a `GAsyncResult`
 * @return a new `GdkTexture`
 */
- (OGGdkTexture*)readTextureFinish:(GAsyncResult*)result;

/**
 * Asynchronously request the @clipboard contents converted to the given
 * @type.
 * 
 * When the operation is finished @callback will be called. You must then call
 * [method@Gdk.Clipboard.read_value_finish] to get the resulting `GValue`.
 * 
 * For local clipboard contents that are available in the given `GType`,
 * the value will be copied directly. Otherwise, GDK will try to use
 * [func@content_deserialize_async] to convert the clipboard's data.
 *
 * @param type a `GType` to read
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional `GCancellable` object
 * @param callback callback to call when the request is satisfied
 * @param userData the data to pass to callback function
 */
- (void)readValueAsyncWithType:(GType)type ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous clipboard read.
 * 
 * See [method@Gdk.Clipboard.read_value_async].
 *
 * @param result a `GAsyncResult`
 * @return a `GValue` containing the result.
 */
- (const GValue*)readValueFinish:(GAsyncResult*)result;

/**
 * Sets a new content provider on @clipboard.
 * 
 * The clipboard will claim the `GdkDisplay`'s resources and advertise
 * these new contents to other applications.
 * 
 * In the rare case of a failure, this function will return %FALSE. The
 * clipboard will then continue reporting its old contents and ignore
 * @provider.
 * 
 * If the contents are read by either an external application or the
 * @clipboard's read functions, @clipboard will select the best format to
 * transfer the contents and then request that format from @provider.
 *
 * @param provider the new contents of @clipboard
 *   or %NULL to clear the clipboard
 * @return %TRUE if setting the clipboard succeeded
 */
- (bool)setContent:(OGGdkContentProvider*)provider;

/**
 * Puts the given @text into the clipboard.
 *
 * @param text Text to put into the clipboard
 */
- (void)setText:(OFString*)text;

/**
 * Puts the given @texture into the clipboard.
 *
 * @param texture a `GdkTexture` to put into the clipboard
 */
- (void)setTexture:(OGGdkTexture*)texture;

/**
 * Sets the clipboard to contain the value collected from the given @args.
 *
 * @param type type of value to set
 * @param args varargs containing the value of @type
 */
- (void)setValistWithType:(GType)type args:(va_list)args;

/**
 * Sets the @clipboard to contain the given @value.
 *
 * @param value a `GValue` to set
 */
- (void)setValue:(const GValue*)value;

/**
 * Asynchronously instructs the @clipboard to store its contents remotely.
 * 
 * If the clipboard is not local, this function does nothing but report success.
 * 
 * The @callback must call [method@Gdk.Clipboard.store_finish].
 * 
 * The purpose of this call is to preserve clipboard contents beyond the
 * lifetime of an application, so this function is typically called on
 * exit. Depending on the platform, the functionality may not be available
 * unless a "clipboard manager" is running.
 * 
 * This function is called automatically when a
 * [GtkApplication](../gtk4/class.Application.html)
 * is shut down, so you likely don't need to call it.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional `GCancellable` object
 * @param callback callback to call when the request is satisfied
 * @param userData the data to pass to callback function
 */
- (void)storeAsyncWithIoPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous clipboard store.
 * 
 * See [method@Gdk.Clipboard.store_async].
 *
 * @param result a `GAsyncResult`
 * @return %TRUE if storing was successful.
 */
- (bool)storeFinish:(GAsyncResult*)result;

@end