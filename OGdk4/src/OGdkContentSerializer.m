/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkContentSerializer.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>

@implementation OGdkContentSerializer

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CONTENT_SERIALIZER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_CONTENT_SERIALIZER);
	return gObjectClass;
}

- (GdkContentSerializer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_CONTENT_SERIALIZER, GdkContentSerializer);
}

- (OGCancellable*)cancellable
{
	GCancellable* gobjectValue = gdk_content_serializer_get_cancellable((GdkContentSerializer*)[self castedGObject]);

	OGCancellable* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GType)gtype
{
	GType returnValue = (GType)gdk_content_serializer_get_gtype((GdkContentSerializer*)[self castedGObject]);

	return returnValue;
}

- (OFString*)mimeType
{
	const char* gobjectValue = gdk_content_serializer_get_mime_type((GdkContentSerializer*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGOutputStream*)outputStream
{
	GOutputStream* gobjectValue = gdk_content_serializer_get_output_stream((GdkContentSerializer*)[self castedGObject]);

	OGOutputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)priority
{
	int returnValue = (int)gdk_content_serializer_get_priority((GdkContentSerializer*)[self castedGObject]);

	return returnValue;
}

- (gpointer)taskData
{
	gpointer returnValue = (gpointer)gdk_content_serializer_get_task_data((GdkContentSerializer*)[self castedGObject]);

	return returnValue;
}

- (gpointer)userData
{
	gpointer returnValue = (gpointer)gdk_content_serializer_get_user_data((GdkContentSerializer*)[self castedGObject]);

	return returnValue;
}

- (const GValue*)value
{
	const GValue* returnValue = (const GValue*)gdk_content_serializer_get_value((GdkContentSerializer*)[self castedGObject]);

	return returnValue;
}

- (void)returnError:(GError*)error
{
	gdk_content_serializer_return_error((GdkContentSerializer*)[self castedGObject], error);
}

- (void)returnSuccess
{
	gdk_content_serializer_return_success((GdkContentSerializer*)[self castedGObject]);
}

- (void)setTaskData:(gpointer)data notify:(GDestroyNotify)notify
{
	gdk_content_serializer_set_task_data((GdkContentSerializer*)[self castedGObject], data, notify);
}


@end