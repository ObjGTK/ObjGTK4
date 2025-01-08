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

- (instancetype)init
{
	GtkCssProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_css_provider_new(), GtkCssProvider, GtkCssProvider);

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

- (GtkCssProvider*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCssProvider, GtkCssProvider);
}

- (void)loadFromBytes:(GBytes*)data
{
	gtk_css_provider_load_from_bytes([self castedGObject], data);
}

- (void)loadFromDataWithData:(OFString*)data length:(gssize)length
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

- (void)loadFromResource:(OFString*)resourcePath
{
	gtk_css_provider_load_from_resource([self castedGObject], [resourcePath UTF8String]);
}

- (void)loadFromString:(OFString*)string
{
	gtk_css_provider_load_from_string([self castedGObject], [string UTF8String]);
}

- (void)loadNamedWithName:(OFString*)name variant:(OFString*)variant
{
	gtk_css_provider_load_named([self castedGObject], [name UTF8String], [variant UTF8String]);
}

- (char*)toString
{
	char* gobjectValue = gtk_css_provider_to_string([self castedGObject]);

	char* returnValue = gobjectValue;
	return returnValue;
}


@end