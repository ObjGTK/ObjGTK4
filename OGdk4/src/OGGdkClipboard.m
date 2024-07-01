/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkClipboard.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>
#import "OGGdkDisplay.h"
#import "OGGdkTexture.h"
#import "OGGdkContentProvider.h"

@implementation OGGdkClipboard

- (GdkClipboard*)castedGObject
{
	return GDK_CLIPBOARD([self gObject]);
}

- (OGGdkContentProvider*)content
{
	GdkContentProvider* gobjectValue = GDK_CONTENT_PROVIDER(gdk_clipboard_get_content([self castedGObject]));

	OGGdkContentProvider* returnValue = [OGGdkContentProvider withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDisplay*)display
{
	GdkDisplay* gobjectValue = GDK_DISPLAY(gdk_clipboard_get_display([self castedGObject]));

	OGGdkDisplay* returnValue = [OGGdkDisplay withGObject:gobjectValue];
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = gdk_clipboard_get_formats([self castedGObject]);

	return returnValue;
}

- (bool)isLocal
{
	bool returnValue = gdk_clipboard_is_local([self castedGObject]);

	return returnValue;
}

- (void)readAsyncWithMimeTypes:(const char**)mimeTypes ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_async([self castedGObject], mimeTypes, ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGInputStream*)readFinishWithResult:(GAsyncResult*)result outMimeType:(const char**)outMimeType
{
	GError* err = NULL;

	GInputStream* gobjectValue = G_INPUT_STREAM(gdk_clipboard_read_finish([self castedGObject], result, outMimeType, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGInputStream* returnValue = [OGInputStream withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)readTextAsyncWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_text_async([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (char*)readTextFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	char* gobjectValue = gdk_clipboard_read_text_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	char* returnValue = gobjectValue;
	return returnValue;
}

- (void)readTextureAsyncWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_texture_async([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (OGGdkTexture*)readTextureFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_clipboard_read_texture_finish([self castedGObject], result, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGGdkTexture* returnValue = [OGGdkTexture withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)readValueAsyncWithType:(GType)type ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_value_async([self castedGObject], type, ioPriority, [cancellable castedGObject], callback, userData);
}

- (const GValue*)readValueFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	const GValue* returnValue = gdk_clipboard_read_value_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)setContent:(OGGdkContentProvider*)provider
{
	bool returnValue = gdk_clipboard_set_content([self castedGObject], [provider castedGObject]);

	return returnValue;
}

- (void)setText:(OFString*)text
{
	gdk_clipboard_set_text([self castedGObject], [text UTF8String]);
}

- (void)setTexture:(OGGdkTexture*)texture
{
	gdk_clipboard_set_texture([self castedGObject], [texture castedGObject]);
}

- (void)setValistWithType:(GType)type args:(va_list)args
{
	gdk_clipboard_set_valist([self castedGObject], type, args);
}

- (void)setValue:(const GValue*)value
{
	gdk_clipboard_set_value([self castedGObject], value);
}

- (void)storeAsyncWithIoPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_store_async([self castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)storeFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = gdk_clipboard_store_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end