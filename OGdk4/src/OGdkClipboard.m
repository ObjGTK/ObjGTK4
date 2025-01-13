/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkClipboard.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>
#import "OGdkContentProvider.h"
#import "OGdkDisplay.h"
#import "OGdkTexture.h"

@implementation OGdkClipboard

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CLIPBOARD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GdkClipboard*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkClipboard, GdkClipboard);
}

- (OGdkContentProvider*)content
{
	GdkContentProvider* gobjectValue = gdk_clipboard_get_content([self castedGObject]);

	OGdkContentProvider* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDisplay*)display
{
	GdkDisplay* gobjectValue = gdk_clipboard_get_display([self castedGObject]);

	OGdkDisplay* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_clipboard_get_formats([self castedGObject]);

	return returnValue;
}

- (bool)isLocal
{
	bool returnValue = (bool)gdk_clipboard_is_local([self castedGObject]);

	return returnValue;
}

- (void)readAsyncWithMimeTypes:(const char**)mimeTypes ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_async([self castedGObject], mimeTypes, ioPriority, [cancellable castedGObject], callback, userData);
}

- (OGInputStream*)readFinishWithResult:(GAsyncResult*)result outMimeType:(const char**)outMimeType
{
	GError* err = NULL;

	GInputStream* gobjectValue = gdk_clipboard_read_finish([self castedGObject], result, outMimeType, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGInputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)readTextAsyncWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_text_async([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (OFString*)readTextFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	char* gobjectValue = gdk_clipboard_read_text_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (void)readTextureAsyncWithCancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_texture_async([self castedGObject], [cancellable castedGObject], callback, userData);
}

- (OGdkTexture*)readTextureFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	GdkTexture* gobjectValue = gdk_clipboard_read_texture_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)readValueAsyncWithType:(GType)type ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_clipboard_read_value_async([self castedGObject], type, ioPriority, [cancellable castedGObject], callback, userData);
}

- (const GValue*)readValueFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	const GValue* returnValue = (const GValue*)gdk_clipboard_read_value_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)setContentWithProvider:(OGdkContentProvider*)provider
{
	bool returnValue = (bool)gdk_clipboard_set_content([self castedGObject], [provider castedGObject]);

	return returnValue;
}

- (void)setText:(OFString*)text
{
	gdk_clipboard_set_text([self castedGObject], [text UTF8String]);
}

- (void)setTexture:(OGdkTexture*)texture
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

- (bool)storeFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_clipboard_store_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end