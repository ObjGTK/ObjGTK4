/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkContentSerializer.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>

@implementation OGdkContentSerializer

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CONTENT_SERIALIZER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (GdkContentSerializer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkContentSerializer, GdkContentSerializer);
}

- (OGCancellable*)cancellable
{
	GCancellable* gobjectValue = gdk_content_serializer_get_cancellable([self castedGObject]);

	OGCancellable* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GType)gtype
{
	GType returnValue = (GType)gdk_content_serializer_get_gtype([self castedGObject]);

	return returnValue;
}

- (OFString*)mimeType
{
	const char* gobjectValue = gdk_content_serializer_get_mime_type([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGOutputStream*)outputStream
{
	GOutputStream* gobjectValue = gdk_content_serializer_get_output_stream([self castedGObject]);

	OGOutputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)priority
{
	int returnValue = (int)gdk_content_serializer_get_priority([self castedGObject]);

	return returnValue;
}

- (gpointer)taskData
{
	gpointer returnValue = (gpointer)gdk_content_serializer_get_task_data([self castedGObject]);

	return returnValue;
}

- (gpointer)userData
{
	gpointer returnValue = (gpointer)gdk_content_serializer_get_user_data([self castedGObject]);

	return returnValue;
}

- (const GValue*)value
{
	const GValue* returnValue = (const GValue*)gdk_content_serializer_get_value([self castedGObject]);

	return returnValue;
}

- (void)returnError:(GError*)error
{
	gdk_content_serializer_return_error([self castedGObject], error);
}

- (void)returnSuccess
{
	gdk_content_serializer_return_success([self castedGObject]);
}

- (void)setTaskData:(gpointer)data notify:(GDestroyNotify)notify
{
	gdk_content_serializer_set_task_data([self castedGObject], data, notify);
}


@end