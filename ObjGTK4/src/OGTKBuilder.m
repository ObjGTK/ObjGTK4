/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBuilder.h"

@implementation OGTKBuilder

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BUILDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)builder
{
	GtkBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_new(), GtkBuilder, GtkBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGTKBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)builderFromFileWithFilename:(OFString*)filename
{
	GtkBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_new_from_file([filename UTF8String]), GtkBuilder, GtkBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGTKBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)builderFromResourceWithResourcePath:(OFString*)resourcePath
{
	GtkBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_new_from_resource([resourcePath UTF8String]), GtkBuilder, GtkBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGTKBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)builderFromString:(OFString*)string length:(gssize)length
{
	GtkBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_builder_new_from_string([string UTF8String], length), GtkBuilder, GtkBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGTKBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBuilder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkBuilder, GtkBuilder);
}

- (bool)addFromFileWithFilename:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_add_from_file([self castedGObject], [filename UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)addFromResourceWithResourcePath:(OFString*)resourcePath
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_add_from_resource([self castedGObject], [resourcePath UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)addFromStringWithBuffer:(OFString*)buffer length:(gssize)length
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_add_from_string([self castedGObject], [buffer UTF8String], length, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)addObjectsFromFileWithFilename:(OFString*)filename objectIds:(const char**)objectIds
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_add_objects_from_file([self castedGObject], [filename UTF8String], objectIds, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)addObjectsFromResourceWithResourcePath:(OFString*)resourcePath objectIds:(const char**)objectIds
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_add_objects_from_resource([self castedGObject], [resourcePath UTF8String], objectIds, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)addObjectsFromStringWithBuffer:(OFString*)buffer length:(gssize)length objectIds:(const char**)objectIds
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_add_objects_from_string([self castedGObject], [buffer UTF8String], length, objectIds, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GClosure*)createClosureWithFunctionName:(OFString*)functionName flags:(GtkBuilderClosureFlags)flags object:(OGObject*)object
{
	GError* err = NULL;

	GClosure* returnValue = (GClosure*)gtk_builder_create_closure([self castedGObject], [functionName UTF8String], flags, [object gObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)exposeObjectWithName:(OFString*)name object:(OGObject*)object
{
	gtk_builder_expose_object([self castedGObject], [name UTF8String], [object gObject]);
}

- (bool)extendWithTemplateWithObject:(OGObject*)object templateType:(GType)templateType buffer:(OFString*)buffer length:(gssize)length
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_extend_with_template([self castedGObject], [object gObject], templateType, [buffer UTF8String], length, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGObject*)currentObject
{
	GObject* gobjectValue = gtk_builder_get_current_object([self castedGObject]);

	OGObject* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGObject*)objectWithName:(OFString*)name
{
	GObject* gobjectValue = gtk_builder_get_object([self castedGObject], [name UTF8String]);

	OGObject* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GSList*)objects
{
	GSList* returnValue = (GSList*)gtk_builder_get_objects([self castedGObject]);

	return returnValue;
}

- (GtkBuilderScope*)scope
{
	GtkBuilderScope* returnValue = (GtkBuilderScope*)gtk_builder_get_scope([self castedGObject]);

	return returnValue;
}

- (OFString*)translationDomain
{
	const char* gobjectValue = gtk_builder_get_translation_domain([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GType)typeFromNameWithTypeName:(OFString*)typeName
{
	GType returnValue = (GType)gtk_builder_get_type_from_name([self castedGObject], [typeName UTF8String]);

	return returnValue;
}

- (void)setCurrentObject:(OGObject*)currentObject
{
	gtk_builder_set_current_object([self castedGObject], [currentObject gObject]);
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

	bool returnValue = (bool)gtk_builder_value_from_string([self castedGObject], pspec, [string UTF8String], value, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)valueFromStringType:(GType)type string:(OFString*)string value:(GValue*)value
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_builder_value_from_string_type([self castedGObject], type, [string UTF8String], value, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end