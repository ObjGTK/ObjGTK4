/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkContentProvider.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>

@implementation OGdkContentProvider

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CONTENT_PROVIDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)contentProviderForBytesWithMimeType:(OFString*)mimeType bytes:(GBytes*)bytes
{
	GdkContentProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_content_provider_new_for_bytes([mimeType UTF8String], bytes), GdkContentProvider, GdkContentProvider);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkContentProvider* wrapperObject;
	@try {
		wrapperObject = [[OGdkContentProvider alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)contentProviderForValue:(const GValue*)value
{
	GdkContentProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_content_provider_new_for_value(value), GdkContentProvider, GdkContentProvider);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkContentProvider* wrapperObject;
	@try {
		wrapperObject = [[OGdkContentProvider alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)contentProviderUnionWithProviders:(GdkContentProvider**)providers nproviders:(gsize)nproviders
{
	GdkContentProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_content_provider_new_union(providers, nproviders), GdkContentProvider, GdkContentProvider);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkContentProvider* wrapperObject;
	@try {
		wrapperObject = [[OGdkContentProvider alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkContentProvider*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkContentProvider, GdkContentProvider);
}

- (void)contentChanged
{
	gdk_content_provider_content_changed([self castedGObject]);
}

- (bool)value:(GValue*)value
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_content_provider_get_value([self castedGObject], value, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GdkContentFormats*)refFormats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_content_provider_ref_formats([self castedGObject]);

	return returnValue;
}

- (GdkContentFormats*)refStorableFormats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_content_provider_ref_storable_formats([self castedGObject]);

	return returnValue;
}

- (void)writeMimeTypeAsyncWithMimeType:(OFString*)mimeType stream:(OGOutputStream*)stream ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_content_provider_write_mime_type_async([self castedGObject], [mimeType UTF8String], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)writeMimeTypeFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_content_provider_write_mime_type_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end