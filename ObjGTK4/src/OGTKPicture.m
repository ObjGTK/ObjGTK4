/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPicture.h"

#import <OGdkPixbuf/OGGdkPixbuf.h>

@implementation OGTKPicture

- (instancetype)init
{
	GtkPicture* gobjectValue = GTK_PICTURE(gtk_picture_new());

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

- (instancetype)initForFile:(GFile*)file
{
	GtkPicture* gobjectValue = GTK_PICTURE(gtk_picture_new_for_file(file));

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

- (instancetype)initForFilename:(OFString*)filename
{
	GtkPicture* gobjectValue = GTK_PICTURE(gtk_picture_new_for_filename([filename UTF8String]));

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

- (instancetype)initForPaintable:(GdkPaintable*)paintable
{
	GtkPicture* gobjectValue = GTK_PICTURE(gtk_picture_new_for_paintable(paintable));

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

- (instancetype)initForPixbuf:(OGGdkPixbuf*)pixbuf
{
	GtkPicture* gobjectValue = GTK_PICTURE(gtk_picture_new_for_pixbuf([pixbuf castedGObject]));

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

- (instancetype)initForResource:(OFString*)resourcePath
{
	GtkPicture* gobjectValue = GTK_PICTURE(gtk_picture_new_for_resource([resourcePath UTF8String]));

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

- (GtkPicture*)castedGObject
{
	return GTK_PICTURE([self gObject]);
}

- (OFString*)alternativeText
{
	const char* gobjectValue = gtk_picture_get_alternative_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)canShrink
{
	bool returnValue = gtk_picture_get_can_shrink([self castedGObject]);

	return returnValue;
}

- (GtkContentFit)contentFit
{
	GtkContentFit returnValue = gtk_picture_get_content_fit([self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = gtk_picture_get_file([self castedGObject]);

	return returnValue;
}

- (bool)keepAspectRatio
{
	bool returnValue = gtk_picture_get_keep_aspect_ratio([self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)paintable
{
	GdkPaintable* returnValue = gtk_picture_get_paintable([self castedGObject]);

	return returnValue;
}

- (void)setAlternativeText:(OFString*)alternativeText
{
	gtk_picture_set_alternative_text([self castedGObject], [alternativeText UTF8String]);
}

- (void)setCanShrink:(bool)canShrink
{
	gtk_picture_set_can_shrink([self castedGObject], canShrink);
}

- (void)setContentFit:(GtkContentFit)contentFit
{
	gtk_picture_set_content_fit([self castedGObject], contentFit);
}

- (void)setFile:(GFile*)file
{
	gtk_picture_set_file([self castedGObject], file);
}

- (void)setFilename:(OFString*)filename
{
	gtk_picture_set_filename([self castedGObject], [filename UTF8String]);
}

- (void)setKeepAspectRatio:(bool)keepAspectRatio
{
	gtk_picture_set_keep_aspect_ratio([self castedGObject], keepAspectRatio);
}

- (void)setPaintable:(GdkPaintable*)paintable
{
	gtk_picture_set_paintable([self castedGObject], paintable);
}

- (void)setPixbuf:(OGGdkPixbuf*)pixbuf
{
	gtk_picture_set_pixbuf([self castedGObject], [pixbuf castedGObject]);
}

- (void)setResource:(OFString*)resourcePath
{
	gtk_picture_set_resource([self castedGObject], [resourcePath UTF8String]);
}


@end