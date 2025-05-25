/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKImage.h"

#import <OGdkPixbuf/OGdkPixbuf.h>

@implementation OGTKImage

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_IMAGE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_IMAGE);
	return gObjectClass;
}

+ (instancetype)image
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new(), GTK_TYPE_IMAGE, GtkImage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKImage* wrapperObject;
	@try {
		wrapperObject = [[OGTKImage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)imageFromFileWithFilename:(OFString*)filename
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_file([filename UTF8String]), GTK_TYPE_IMAGE, GtkImage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKImage* wrapperObject;
	@try {
		wrapperObject = [[OGTKImage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)imageFromGicon:(GIcon*)icon
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_gicon(icon), GTK_TYPE_IMAGE, GtkImage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKImage* wrapperObject;
	@try {
		wrapperObject = [[OGTKImage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)imageFromIconName:(OFString*)iconName
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_icon_name([iconName UTF8String]), GTK_TYPE_IMAGE, GtkImage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKImage* wrapperObject;
	@try {
		wrapperObject = [[OGTKImage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)imageFromPaintable:(GdkPaintable*)paintable
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_paintable(paintable), GTK_TYPE_IMAGE, GtkImage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKImage* wrapperObject;
	@try {
		wrapperObject = [[OGTKImage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)imageFromPixbuf:(OGdkPixbuf*)pixbuf
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_pixbuf([pixbuf castedGObject]), GTK_TYPE_IMAGE, GtkImage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKImage* wrapperObject;
	@try {
		wrapperObject = [[OGTKImage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)imageFromResourceWithResourcePath:(OFString*)resourcePath
{
	GtkImage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_image_new_from_resource([resourcePath UTF8String]), GTK_TYPE_IMAGE, GtkImage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKImage* wrapperObject;
	@try {
		wrapperObject = [[OGTKImage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkImage*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_IMAGE, GtkImage);
}

- (void)clear
{
	gtk_image_clear((GtkImage*)[self castedGObject]);
}

- (GIcon*)gicon
{
	GIcon* returnValue = (GIcon*)gtk_image_get_gicon((GtkImage*)[self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_image_get_icon_name((GtkImage*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkIconSize)iconSize
{
	GtkIconSize returnValue = (GtkIconSize)gtk_image_get_icon_size((GtkImage*)[self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)paintable
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_image_get_paintable((GtkImage*)[self castedGObject]);

	return returnValue;
}

- (int)pixelSize
{
	int returnValue = (int)gtk_image_get_pixel_size((GtkImage*)[self castedGObject]);

	return returnValue;
}

- (GtkImageType)storageType
{
	GtkImageType returnValue = (GtkImageType)gtk_image_get_storage_type((GtkImage*)[self castedGObject]);

	return returnValue;
}

- (void)setFromFileWithFilename:(OFString*)filename
{
	gtk_image_set_from_file((GtkImage*)[self castedGObject], [filename UTF8String]);
}

- (void)setFromGicon:(GIcon*)icon
{
	gtk_image_set_from_gicon((GtkImage*)[self castedGObject], icon);
}

- (void)setFromIconName:(OFString*)iconName
{
	gtk_image_set_from_icon_name((GtkImage*)[self castedGObject], [iconName UTF8String]);
}

- (void)setFromPaintable:(GdkPaintable*)paintable
{
	gtk_image_set_from_paintable((GtkImage*)[self castedGObject], paintable);
}

- (void)setFromPixbuf:(OGdkPixbuf*)pixbuf
{
	gtk_image_set_from_pixbuf((GtkImage*)[self castedGObject], [pixbuf castedGObject]);
}

- (void)setFromResourceWithResourcePath:(OFString*)resourcePath
{
	gtk_image_set_from_resource((GtkImage*)[self castedGObject], [resourcePath UTF8String]);
}

- (void)setIconSize:(GtkIconSize)iconSize
{
	gtk_image_set_icon_size((GtkImage*)[self castedGObject], iconSize);
}

- (void)setPixelSize:(int)pixelSize
{
	gtk_image_set_pixel_size((GtkImage*)[self castedGObject], pixelSize);
}


@end