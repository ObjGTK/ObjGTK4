/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCssProvider.h"

@implementation OGTKCssProvider

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CSS_PROVIDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CSS_PROVIDER);
	return gObjectClass;
}

+ (instancetype)cssProvider
{
	GtkCssProvider* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_css_provider_new(), GTK_TYPE_CSS_PROVIDER, GtkCssProvider);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CSS_PROVIDER, GtkCssProvider);
}

- (void)loadFromBytesWithData:(GBytes*)data
{
	gtk_css_provider_load_from_bytes((GtkCssProvider*)[self castedGObject], data);
}

- (void)loadFromData:(OFString*)data length:(gssize)length
{
	gtk_css_provider_load_from_data((GtkCssProvider*)[self castedGObject], [data UTF8String], length);
}

- (void)loadFromFile:(GFile*)file
{
	gtk_css_provider_load_from_file((GtkCssProvider*)[self castedGObject], file);
}

- (void)loadFromPath:(OFString*)path
{
	gtk_css_provider_load_from_path((GtkCssProvider*)[self castedGObject], [path UTF8String]);
}

- (void)loadFromResourceWithResourcePath:(OFString*)resourcePath
{
	gtk_css_provider_load_from_resource((GtkCssProvider*)[self castedGObject], [resourcePath UTF8String]);
}

- (void)loadFromString:(OFString*)string
{
	gtk_css_provider_load_from_string((GtkCssProvider*)[self castedGObject], [string UTF8String]);
}

- (void)loadNamed:(OFString*)name variant:(OFString*)variant
{
	gtk_css_provider_load_named((GtkCssProvider*)[self castedGObject], [name UTF8String], [variant UTF8String]);
}

- (OFString*)toString
{
	char* gobjectValue = gtk_css_provider_to_string((GtkCssProvider*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end