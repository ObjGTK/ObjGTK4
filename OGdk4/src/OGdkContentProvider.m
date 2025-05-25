/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkContentProvider.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>

@implementation OGdkContentProvider

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CONTENT_PROVIDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_CONTENT_PROVIDER);
	return gObjectClass;
}

+ (instancetype)contentProviderForBytesWithMimeType:(OFString*)mimeType bytes:(GBytes*)bytes
{
	GdkContentProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_content_provider_new_for_bytes([mimeType UTF8String], bytes), GDK_TYPE_CONTENT_PROVIDER, GdkContentProvider);

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
	GdkContentProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_content_provider_new_for_value(value), GDK_TYPE_CONTENT_PROVIDER, GdkContentProvider);

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
	GdkContentProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_content_provider_new_union(providers, nproviders), GDK_TYPE_CONTENT_PROVIDER, GdkContentProvider);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_CONTENT_PROVIDER, GdkContentProvider);
}

- (void)contentChanged
{
	gdk_content_provider_content_changed((GdkContentProvider*)[self castedGObject]);
}

- (bool)valueWithValue:(GValue*)value
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_content_provider_get_value((GdkContentProvider*)[self castedGObject], value, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GdkContentFormats*)refFormats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_content_provider_ref_formats((GdkContentProvider*)[self castedGObject]);

	return returnValue;
}

- (GdkContentFormats*)refStorableFormats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gdk_content_provider_ref_storable_formats((GdkContentProvider*)[self castedGObject]);

	return returnValue;
}

- (void)writeMimeTypeAsync:(OFString*)mimeType stream:(OGOutputStream*)stream ioPriority:(int)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_content_provider_write_mime_type_async((GdkContentProvider*)[self castedGObject], [mimeType UTF8String], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)writeMimeTypeFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_content_provider_write_mime_type_finish((GdkContentProvider*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end