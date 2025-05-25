/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPicture.h"

#import <OGdkPixbuf/OGdkPixbuf.h>

@implementation OGTKPicture

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PICTURE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_PICTURE);
	return gObjectClass;
}

+ (instancetype)picture
{
	GtkPicture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_picture_new(), GTK_TYPE_PICTURE, GtkPicture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPicture* wrapperObject;
	@try {
		wrapperObject = [[OGTKPicture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pictureForFile:(GFile*)file
{
	GtkPicture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_picture_new_for_file(file), GTK_TYPE_PICTURE, GtkPicture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPicture* wrapperObject;
	@try {
		wrapperObject = [[OGTKPicture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pictureForFilename:(OFString*)filename
{
	GtkPicture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_picture_new_for_filename([filename UTF8String]), GTK_TYPE_PICTURE, GtkPicture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPicture* wrapperObject;
	@try {
		wrapperObject = [[OGTKPicture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pictureForPaintable:(GdkPaintable*)paintable
{
	GtkPicture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_picture_new_for_paintable(paintable), GTK_TYPE_PICTURE, GtkPicture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPicture* wrapperObject;
	@try {
		wrapperObject = [[OGTKPicture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pictureForPixbuf:(OGdkPixbuf*)pixbuf
{
	GtkPicture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_picture_new_for_pixbuf([pixbuf castedGObject]), GTK_TYPE_PICTURE, GtkPicture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPicture* wrapperObject;
	@try {
		wrapperObject = [[OGTKPicture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pictureForResourceWithResourcePath:(OFString*)resourcePath
{
	GtkPicture* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_picture_new_for_resource([resourcePath UTF8String]), GTK_TYPE_PICTURE, GtkPicture);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKPicture* wrapperObject;
	@try {
		wrapperObject = [[OGTKPicture alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPicture*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_PICTURE, GtkPicture);
}

- (OFString*)alternativeText
{
	const char* gobjectValue = gtk_picture_get_alternative_text((GtkPicture*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)canShrink
{
	bool returnValue = (bool)gtk_picture_get_can_shrink((GtkPicture*)[self castedGObject]);

	return returnValue;
}

- (GtkContentFit)contentFit
{
	GtkContentFit returnValue = (GtkContentFit)gtk_picture_get_content_fit((GtkPicture*)[self castedGObject]);

	return returnValue;
}

- (GFile*)file
{
	GFile* returnValue = (GFile*)gtk_picture_get_file((GtkPicture*)[self castedGObject]);

	return returnValue;
}

- (bool)keepAspectRatio
{
	bool returnValue = (bool)gtk_picture_get_keep_aspect_ratio((GtkPicture*)[self castedGObject]);

	return returnValue;
}

- (GdkPaintable*)paintable
{
	GdkPaintable* returnValue = (GdkPaintable*)gtk_picture_get_paintable((GtkPicture*)[self castedGObject]);

	return returnValue;
}

- (void)setAlternativeText:(OFString*)alternativeText
{
	gtk_picture_set_alternative_text((GtkPicture*)[self castedGObject], [alternativeText UTF8String]);
}

- (void)setCanShrink:(bool)canShrink
{
	gtk_picture_set_can_shrink((GtkPicture*)[self castedGObject], canShrink);
}

- (void)setContentFit:(GtkContentFit)contentFit
{
	gtk_picture_set_content_fit((GtkPicture*)[self castedGObject], contentFit);
}

- (void)setFile:(GFile*)file
{
	gtk_picture_set_file((GtkPicture*)[self castedGObject], file);
}

- (void)setFilename:(OFString*)filename
{
	gtk_picture_set_filename((GtkPicture*)[self castedGObject], [filename UTF8String]);
}

- (void)setKeepAspectRatio:(bool)keepAspectRatio
{
	gtk_picture_set_keep_aspect_ratio((GtkPicture*)[self castedGObject], keepAspectRatio);
}

- (void)setPaintable:(GdkPaintable*)paintable
{
	gtk_picture_set_paintable((GtkPicture*)[self castedGObject], paintable);
}

- (void)setPixbuf:(OGdkPixbuf*)pixbuf
{
	gtk_picture_set_pixbuf((GtkPicture*)[self castedGObject], [pixbuf castedGObject]);
}

- (void)setResourceWithResourcePath:(OFString*)resourcePath
{
	gtk_picture_set_resource((GtkPicture*)[self castedGObject], [resourcePath UTF8String]);
}


@end