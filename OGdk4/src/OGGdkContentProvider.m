/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkContentProvider.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>

@implementation OGGdkContentProvider

- (instancetype)initForBytesWithMimeType:(OFString*)mimeType bytes:(GBytes*)bytes
{
	GdkContentProvider* gobjectValue = GDK_CONTENT_PROVIDER(gdk_content_provider_new_for_bytes([mimeType UTF8String], bytes));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initForValue:(const GValue*)value
{
	GdkContentProvider* gobjectValue = GDK_CONTENT_PROVIDER(gdk_content_provider_new_for_value(value));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initUnionWithProviders:(GdkContentProvider**)providers nproviders:(gsize)nproviders
{
	GdkContentProvider* gobjectValue = GDK_CONTENT_PROVIDER(gdk_content_provider_new_union(providers, nproviders));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GdkContentProvider*)castedGObject
{
	return GDK_CONTENT_PROVIDER([self gObject]);
}

- (void)contentChanged
{
	gdk_content_provider_content_changed([self castedGObject]);
}

- (bool)value:(GValue*)value
{
	GError* err = NULL;

	bool returnValue = gdk_content_provider_get_value([self castedGObject], value, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GdkContentFormats*)refFormats
{
	GdkContentFormats* returnValue = gdk_content_provider_ref_formats([self castedGObject]);

	return returnValue;
}

- (GdkContentFormats*)refStorableFormats
{
	GdkContentFormats* returnValue = gdk_content_provider_ref_storable_formats([self castedGObject]);

	return returnValue;
}

- (void)writeMimeTypeAsyncWithMimeType:(OFString*)mimeType stream:(OGOutputStream*)stream ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_content_provider_write_mime_type_async([self castedGObject], [mimeType UTF8String], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)writeMimeTypeFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = gdk_content_provider_write_mime_type_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end