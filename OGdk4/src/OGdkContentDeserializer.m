/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkContentDeserializer.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>

@implementation OGdkContentDeserializer

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CONTENT_DESERIALIZER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_CONTENT_DESERIALIZER);
	return gObjectClass;
}

- (GdkContentDeserializer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_CONTENT_DESERIALIZER, GdkContentDeserializer);
}

- (OGCancellable*)cancellable
{
	GCancellable* gobjectValue = gdk_content_deserializer_get_cancellable((GdkContentDeserializer*)[self castedGObject]);

	OGCancellable* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GType)gtype
{
	GType returnValue = (GType)gdk_content_deserializer_get_gtype((GdkContentDeserializer*)[self castedGObject]);

	return returnValue;
}

- (OGInputStream*)inputStream
{
	GInputStream* gobjectValue = gdk_content_deserializer_get_input_stream((GdkContentDeserializer*)[self castedGObject]);

	OGInputStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)mimeType
{
	const char* gobjectValue = gdk_content_deserializer_get_mime_type((GdkContentDeserializer*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)priority
{
	int returnValue = (int)gdk_content_deserializer_get_priority((GdkContentDeserializer*)[self castedGObject]);

	return returnValue;
}

- (gpointer)taskData
{
	gpointer returnValue = (gpointer)gdk_content_deserializer_get_task_data((GdkContentDeserializer*)[self castedGObject]);

	return returnValue;
}

- (gpointer)userData
{
	gpointer returnValue = (gpointer)gdk_content_deserializer_get_user_data((GdkContentDeserializer*)[self castedGObject]);

	return returnValue;
}

- (GValue*)value
{
	GValue* returnValue = (GValue*)gdk_content_deserializer_get_value((GdkContentDeserializer*)[self castedGObject]);

	return returnValue;
}

- (void)returnError:(GError*)error
{
	gdk_content_deserializer_return_error((GdkContentDeserializer*)[self castedGObject], error);
}

- (void)returnSuccess
{
	gdk_content_deserializer_return_success((GdkContentDeserializer*)[self castedGObject]);
}

- (void)setTaskData:(gpointer)data notify:(GDestroyNotify)notify
{
	gdk_content_deserializer_set_task_data((GdkContentDeserializer*)[self castedGObject], data, notify);
}


@end