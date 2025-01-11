/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileFilter.h"

@implementation OGTKFileFilter

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILE_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)fileFilter
{
	GtkFileFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_filter_new(), GtkFileFilter, GtkFileFilter);

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
	GtkFileFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_filter_new_from_gvariant(variant), GtkFileFilter, GtkFileFilter);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFileFilter, GtkFileFilter);
}

- (void)addMimeType:(OFString*)mimeType
{
	gtk_file_filter_add_mime_type([self castedGObject], [mimeType UTF8String]);
}

- (void)addPattern:(OFString*)pattern
{
	gtk_file_filter_add_pattern([self castedGObject], [pattern UTF8String]);
}

- (void)addPixbufFormats
{
	gtk_file_filter_add_pixbuf_formats([self castedGObject]);
}

- (void)addSuffix:(OFString*)suffix
{
	gtk_file_filter_add_suffix([self castedGObject], [suffix UTF8String]);
}

- (const char**)attributes
{
	const char** returnValue = (const char**)gtk_file_filter_get_attributes([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gtk_file_filter_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setName:(OFString*)name
{
	gtk_file_filter_set_name([self castedGObject], [name UTF8String]);
}

- (GVariant*)toGvariant
{
	GVariant* returnValue = (GVariant*)gtk_file_filter_to_gvariant([self castedGObject]);

	return returnValue;
}


@end