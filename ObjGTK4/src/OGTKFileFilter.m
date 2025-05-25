/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileFilter.h"

@implementation OGTKFileFilter

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILE_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FILE_FILTER);
	return gObjectClass;
}

+ (instancetype)fileFilter
{
	GtkFileFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_filter_new(), GTK_TYPE_FILE_FILTER, GtkFileFilter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFileFilter* wrapperObject;
	@try {
		wrapperObject = [[OGTKFileFilter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)fileFilterFromGvariant:(GVariant*)variant
{
	GtkFileFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_filter_new_from_gvariant(variant), GTK_TYPE_FILE_FILTER, GtkFileFilter);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFileFilter* wrapperObject;
	@try {
		wrapperObject = [[OGTKFileFilter alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFileFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FILE_FILTER, GtkFileFilter);
}

- (void)addMimeType:(OFString*)mimeType
{
	gtk_file_filter_add_mime_type((GtkFileFilter*)[self castedGObject], [mimeType UTF8String]);
}

- (void)addPattern:(OFString*)pattern
{
	gtk_file_filter_add_pattern((GtkFileFilter*)[self castedGObject], [pattern UTF8String]);
}

- (void)addPixbufFormats
{
	gtk_file_filter_add_pixbuf_formats((GtkFileFilter*)[self castedGObject]);
}

- (void)addSuffix:(OFString*)suffix
{
	gtk_file_filter_add_suffix((GtkFileFilter*)[self castedGObject], [suffix UTF8String]);
}

- (const char**)attributes
{
	const char** returnValue = (const char**)gtk_file_filter_get_attributes((GtkFileFilter*)[self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_file_filter_get_name((GtkFileFilter*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setName:(OFString*)name
{
	gtk_file_filter_set_name((GtkFileFilter*)[self castedGObject], [name UTF8String]);
}

- (GVariant*)toGvariant
{
	GVariant* returnValue = (GVariant*)gtk_file_filter_to_gvariant((GtkFileFilter*)[self castedGObject]);

	return returnValue;
}


@end