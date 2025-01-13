/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCssProvider.h"

@implementation OGTKCssProvider

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CSS_PROVIDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)cssProvider
{
	GtkCssProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_css_provider_new(), GtkCssProvider, GtkCssProvider);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKCssProvider* wrapperObject;
	@try {
		wrapperObject = [[OGTKCssProvider alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCssProvider*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCssProvider, GtkCssProvider);
}

- (void)loadFromBytesWithData:(GBytes*)data
{
	gtk_css_provider_load_from_bytes([self castedGObject], data);
}

- (void)loadFromData:(OFString*)data length:(gssize)length
{
	gtk_css_provider_load_from_data([self castedGObject], [data UTF8String], length);
}

- (void)loadFromFile:(GFile*)file
{
	gtk_css_provider_load_from_file([self castedGObject], file);
}

- (void)loadFromPath:(OFString*)path
{
	gtk_css_provider_load_from_path([self castedGObject], [path UTF8String]);
}

- (void)loadFromResourceWithResourcePath:(OFString*)resourcePath
{
	gtk_css_provider_load_from_resource([self castedGObject], [resourcePath UTF8String]);
}

- (void)loadFromString:(OFString*)string
{
	gtk_css_provider_load_from_string([self castedGObject], [string UTF8String]);
}

- (void)loadNamed:(OFString*)name variant:(OFString*)variant
{
	gtk_css_provider_load_named([self castedGObject], [name UTF8String], [variant UTF8String]);
}

- (OFString*)toString
{
	char* gobjectValue = gtk_css_provider_to_string([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end