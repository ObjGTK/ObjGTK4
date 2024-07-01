/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilder.h"

@implementation OGTKBuilder

- (instancetype)init
{
	GtkBuilder* gobjectValue = GTK_BUILDER(gtk_builder_new());

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

- (instancetype)initFromFile:(OFString*)filename
{
	GtkBuilder* gobjectValue = GTK_BUILDER(gtk_builder_new_from_file([filename UTF8String]));

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

- (instancetype)initFromResource:(OFString*)resourcePath
{
	GtkBuilder* gobjectValue = GTK_BUILDER(gtk_builder_new_from_resource([resourcePath UTF8String]));

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

- (instancetype)initFromStringWithString:(OFString*)string length:(gssize)length
{
	GtkBuilder* gobjectValue = GTK_BUILDER(gtk_builder_new_from_string([string UTF8String], length));

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

- (GtkBuilder*)castedGObject
{
	return GTK_BUILDER([self gObject]);
}

- (bool)addFromFile:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = gtk_builder_add_from_file([self castedGObject], [filename UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)addFromResource:(OFString*)resourcePath
{
	GError* err = NULL;

	bool returnValue = gtk_builder_add_from_resource([self castedGObject], [resourcePath UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)addFromStringWithBuffer:(OFString*)buffer length:(gssize)length
{
	GError* err = NULL;

	bool returnValue = gtk_builder_add_from_string([self castedGObject], [buffer UTF8String], length, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)addObjectsFromFileWithFilename:(OFString*)filename objectIds:(const char**)objectIds
{
	GError* err = NULL;

	bool returnValue = gtk_builder_add_objects_from_file([self castedGObject], [filename UTF8String], objectIds, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)addObjectsFromResourceWithResourcePath:(OFString*)resourcePath objectIds:(const char**)objectIds
{
	GError* err = NULL;

	bool returnValue = gtk_builder_add_objects_from_resource([self castedGObject], [resourcePath UTF8String], objectIds, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)addObjectsFromStringWithBuffer:(OFString*)buffer length:(gssize)length objectIds:(const char**)objectIds
{
	GError* err = NULL;

	bool returnValue = gtk_builder_add_objects_from_string([self castedGObject], [buffer UTF8String], length, objectIds, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GClosure*)createClosureWithFunctionName:(OFString*)functionName flags:(GtkBuilderClosureFlags)flags object:(GObject*)object
{
	GError* err = NULL;

	GClosure* returnValue = gtk_builder_create_closure([self castedGObject], [functionName UTF8String], flags, object, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)exposeObjectWithName:(OFString*)name object:(GObject*)object
{
	gtk_builder_expose_object([self castedGObject], [name UTF8String], object);
}

- (bool)extendWithTemplateWithObject:(GObject*)object templateType:(GType)templateType buffer:(OFString*)buffer length:(gssize)length
{
	GError* err = NULL;

	bool returnValue = gtk_builder_extend_with_template([self castedGObject], object, templateType, [buffer UTF8String], length, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GObject*)currentObject
{
	GObject* returnValue = gtk_builder_get_current_object([self castedGObject]);

	return returnValue;
}

- (GObject*)object:(OFString*)name
{
	GObject* returnValue = gtk_builder_get_object([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (GSList*)objects
{
	GSList* returnValue = gtk_builder_get_objects([self castedGObject]);

	return returnValue;
}

- (GtkBuilderScope*)scope
{
	GtkBuilderScope* returnValue = gtk_builder_get_scope([self castedGObject]);

	return returnValue;
}

- (OFString*)translationDomain
{
	const char* gobjectValue = gtk_builder_get_translation_domain([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GType)typeFromName:(OFString*)typeName
{
	GType returnValue = gtk_builder_get_type_from_name([self castedGObject], [typeName UTF8String]);

	return returnValue;
}

- (void)setCurrentObject:(GObject*)currentObject
{
	gtk_builder_set_current_object([self castedGObject], currentObject);
}

- (void)setScope:(GtkBuilderScope*)scope
{
	gtk_builder_set_scope([self castedGObject], scope);
}

- (void)setTranslationDomain:(OFString*)domain
{
	gtk_builder_set_translation_domain([self castedGObject], [domain UTF8String]);
}

- (bool)valueFromStringWithPspec:(GParamSpec*)pspec string:(OFString*)string value:(GValue*)value
{
	GError* err = NULL;

	bool returnValue = gtk_builder_value_from_string([self castedGObject], pspec, [string UTF8String], value, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)valueFromStringTypeWithType:(GType)type string:(OFString*)string value:(GValue*)value
{
	GError* err = NULL;

	bool returnValue = gtk_builder_value_from_string_type([self castedGObject], type, [string UTF8String], value, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end