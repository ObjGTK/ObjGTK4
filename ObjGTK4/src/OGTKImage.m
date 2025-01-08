/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKImage.h"

#import <OGdkPixbuf/OGdkPixbuf.h>

@implementation OGTKImage

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_IMAGE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new(), GtkImage, GtkImage);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithFilenameFromFile:(OFString*)filename
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_file([filename UTF8String]), GtkImage, GtkImage);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithIconFromGicon:(GIcon*)icon
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_gicon(icon), GtkImage, GtkImage);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithIconNameFromIconName:(OFString*)iconName
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_icon_name([iconName UTF8String]), GtkImage, GtkImage);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithPaintableFromPaintable:(GdkPaintable*)paintable
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_paintable(paintable), GtkImage, GtkImage);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithPixbufFromPixbuf:(OGdkPixbuf*)pixbuf
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_pixbuf([pixbuf castedGObject]), GtkImage, GtkImage);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (instancetype)initWithResourcePathFromResource:(OFString*)resourcePath
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_resource([resourcePath UTF8String]), GtkImage, GtkImage);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkImage, GtkImage);
}

- (void)clear
{
	gtk_image_clear([self castedGObject]);
}

- (GIcon*)gicon
{
	GIcon* returnValue = (GIcon*)gtk_image_get_gicon([self castedGObject]);

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
	GtkIconSize returnValue = (GtkIconSize)gtk_image_get_icon_size([self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)paintable
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_image_get_paintable([self castedGObject]);

	return returnValue;
}

- (int)pixelSize
{
	int returnValue = (int)gtk_image_get_pixel_size([self castedGObject]);

	return returnValue;
}

- (GtkImageType)storageType
{
	GtkImageType returnValue = (GtkImageType)gtk_image_get_storage_type([self castedGObject]);

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

- (void)setFromPixbuf:(OGdkPixbuf*)pixbuf
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