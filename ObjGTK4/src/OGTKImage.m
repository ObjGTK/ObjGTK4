/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKImage.h"

#import <OGdkPixbuf/OGGdkPixbuf.h>

@implementation OGTKImage

- (instancetype)init
{
	GtkImage* gobjectValue = GTK_IMAGE(gtk_image_new());

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
	GtkImage* gobjectValue = GTK_IMAGE(gtk_image_new_from_file([filename UTF8String]));

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

- (instancetype)initFromGicon:(GIcon*)icon
{
	GtkImage* gobjectValue = GTK_IMAGE(gtk_image_new_from_gicon(icon));

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

- (instancetype)initFromIconName:(OFString*)iconName
{
	GtkImage* gobjectValue = GTK_IMAGE(gtk_image_new_from_icon_name([iconName UTF8String]));

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

- (instancetype)initFromPaintable:(GdkPaintable*)paintable
{
	GtkImage* gobjectValue = GTK_IMAGE(gtk_image_new_from_paintable(paintable));

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

- (instancetype)initFromPixbuf:(OGGdkPixbuf*)pixbuf
{
	GtkImage* gobjectValue = GTK_IMAGE(gtk_image_new_from_pixbuf([pixbuf castedGObject]));

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
	GtkImage* gobjectValue = GTK_IMAGE(gtk_image_new_from_resource([resourcePath UTF8String]));

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

- (GtkImage*)castedGObject
{
	return GTK_IMAGE([self gObject]);
}

- (void)clear
{
	gtk_image_clear([self castedGObject]);
}

- (GIcon*)gicon
{
	GIcon* returnValue = gtk_image_get_gicon([self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_image_get_icon_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkIconSize)iconSize
{
	GtkIconSize returnValue = gtk_image_get_icon_size([self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)paintable
{
	GdkPaintable* returnValue = gtk_image_get_paintable([self castedGObject]);

	return returnValue;
}

- (int)pixelSize
{
	int returnValue = gtk_image_get_pixel_size([self castedGObject]);

	return returnValue;
}

- (GtkImageType)storageType
{
	GtkImageType returnValue = gtk_image_get_storage_type([self castedGObject]);

	return returnValue;
}

- (void)setFromFile:(OFString*)filename
{
	gtk_image_set_from_file([self castedGObject], [filename UTF8String]);
}

- (void)setFromGicon:(GIcon*)icon
{
	gtk_image_set_from_gicon([self castedGObject], icon);
}

- (void)setFromIconName:(OFString*)iconName
{
	gtk_image_set_from_icon_name([self castedGObject], [iconName UTF8String]);
}

- (void)setFromPaintable:(GdkPaintable*)paintable
{
	gtk_image_set_from_paintable([self castedGObject], paintable);
}

- (void)setFromPixbuf:(OGGdkPixbuf*)pixbuf
{
	gtk_image_set_from_pixbuf([self castedGObject], [pixbuf castedGObject]);
}

- (void)setFromResource:(OFString*)resourcePath
{
	gtk_image_set_from_resource([self castedGObject], [resourcePath UTF8String]);
}

- (void)setIconSize:(GtkIconSize)iconSize
{
	gtk_image_set_icon_size([self castedGObject], iconSize);
}

- (void)setPixelSize:(int)pixelSize
{
	gtk_image_set_pixel_size([self castedGObject], pixelSize);
}


@end