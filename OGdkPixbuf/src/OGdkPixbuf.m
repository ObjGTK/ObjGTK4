/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbuf.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>
#import <OGio/OGOutputStream.h>

@implementation OGdkPixbuf

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_PIXBUF;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (gint)calculateRowstrideWithColorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height
{
	gint returnValue = (gint)gdk_pixbuf_calculate_rowstride(colorspace, hasAlpha, bitsPerSample, width, height);

	return returnValue;
}

+ (GdkPixbufFormat*)fileInfoWithFilename:(OFString*)filename width:(gint*)width height:(gint*)height
{
	GdkPixbufFormat* returnValue = (GdkPixbufFormat*)gdk_pixbuf_get_file_info([filename UTF8String], width, height);

	return returnValue;
}

+ (void)fileInfoAsyncWithFilename:(OFString*)filename cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_pixbuf_get_file_info_async([filename UTF8String], [cancellable castedGObject], callback, userData);
}

+ (GdkPixbufFormat*)fileInfoFinishWithAsyncResult:(GAsyncResult*)asyncResult width:(gint*)width height:(gint*)height
{
	GError* err = NULL;

	GdkPixbufFormat* returnValue = (GdkPixbufFormat*)gdk_pixbuf_get_file_info_finish(asyncResult, width, height, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

+ (GSList*)formats
{
	GSList* returnValue = (GSList*)gdk_pixbuf_get_formats();

	return returnValue;
}

+ (bool)initModules:(OFString*)path
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_init_modules([path UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

+ (void)newFromStreamAsyncWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_pixbuf_new_from_stream_async([stream castedGObject], [cancellable castedGObject], callback, userData);
}

+ (void)newFromStreamAtScaleAsyncWithStream:(OGInputStream*)stream width:(gint)width height:(gint)height preserveAspectRatio:(bool)preserveAspectRatio cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_pixbuf_new_from_stream_at_scale_async([stream castedGObject], width, height, preserveAspectRatio, [cancellable castedGObject], callback, userData);
}

+ (bool)saveToStreamFinish:(GAsyncResult*)asyncResult
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_save_to_stream_finish(asyncResult, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

+ (instancetype)pixbufWithColorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height
{
	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new(colorspace, hasAlpha, bitsPerSample, width, height), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromBytesWithData:(GBytes*)data colorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height rowstride:(int)rowstride
{
	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_bytes(data, colorspace, hasAlpha, bitsPerSample, width, height, rowstride), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromDataWithData:(const guchar*)data colorspace:(GdkColorspace)colorspace hasAlpha:(bool)hasAlpha bitsPerSample:(int)bitsPerSample width:(int)width height:(int)height rowstride:(int)rowstride destroyFn:(GdkPixbufDestroyNotify)destroyFn destroyFnData:(gpointer)destroyFnData
{
	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_data(data, colorspace, hasAlpha, bitsPerSample, width, height, rowstride, destroyFn, destroyFnData), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromFile:(OFString*)filename
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_file([filename UTF8String], &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromFileAtScaleWithFilename:(OFString*)filename width:(int)width height:(int)height preserveAspectRatio:(bool)preserveAspectRatio
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_file_at_scale([filename UTF8String], width, height, preserveAspectRatio, &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromFileAtSizeWithFilename:(OFString*)filename width:(int)width height:(int)height
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_file_at_size([filename UTF8String], width, height, &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromInlineWithDataLength:(gint)dataLength data:(const guint8*)data copyPixels:(bool)copyPixels
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_inline(dataLength, data, copyPixels, &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromResource:(OFString*)resourcePath
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_resource([resourcePath UTF8String], &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromResourceAtScaleWithResourcePath:(OFString*)resourcePath width:(int)width height:(int)height preserveAspectRatio:(bool)preserveAspectRatio
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_resource_at_scale([resourcePath UTF8String], width, height, preserveAspectRatio, &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromStreamWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_stream([stream castedGObject], [cancellable castedGObject], &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromStreamAtScaleWithStream:(OGInputStream*)stream width:(gint)width height:(gint)height preserveAspectRatio:(bool)preserveAspectRatio cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_stream_at_scale([stream castedGObject], width, height, preserveAspectRatio, [cancellable castedGObject], &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromStreamFinish:(GAsyncResult*)asyncResult
{
	GError* err = NULL;

	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_stream_finish(asyncResult, &err), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufFromXpmData:(const char**)data
{
	GdkPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_new_from_xpm_data(data), GdkPixbuf, GdkPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkPixbuf*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkPixbuf, GdkPixbuf);
}

- (OGdkPixbuf*)addAlphaWithSubstituteColor:(bool)substituteColor r:(guchar)r g:(guchar)g b:(guchar)b
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_add_alpha([self castedGObject], substituteColor, r, g, b);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkPixbuf*)applyEmbeddedOrientation
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_apply_embedded_orientation([self castedGObject]);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)compositeWithDest:(OGdkPixbuf*)dest destX:(int)destX destY:(int)destY destWidth:(int)destWidth destHeight:(int)destHeight offsetX:(double)offsetX offsetY:(double)offsetY scaleX:(double)scaleX scaleY:(double)scaleY interpType:(GdkInterpType)interpType overallAlpha:(int)overallAlpha
{
	gdk_pixbuf_composite([self castedGObject], [dest castedGObject], destX, destY, destWidth, destHeight, offsetX, offsetY, scaleX, scaleY, interpType, overallAlpha);
}

- (void)compositeColorWithDest:(OGdkPixbuf*)dest destX:(int)destX destY:(int)destY destWidth:(int)destWidth destHeight:(int)destHeight offsetX:(double)offsetX offsetY:(double)offsetY scaleX:(double)scaleX scaleY:(double)scaleY interpType:(GdkInterpType)interpType overallAlpha:(int)overallAlpha checkX:(int)checkX checkY:(int)checkY checkSize:(int)checkSize color1:(guint32)color1 color2:(guint32)color2
{
	gdk_pixbuf_composite_color([self castedGObject], [dest castedGObject], destX, destY, destWidth, destHeight, offsetX, offsetY, scaleX, scaleY, interpType, overallAlpha, checkX, checkY, checkSize, color1, color2);
}

- (OGdkPixbuf*)compositeColorSimpleWithDestWidth:(int)destWidth destHeight:(int)destHeight interpType:(GdkInterpType)interpType overallAlpha:(int)overallAlpha checkSize:(int)checkSize color1:(guint32)color1 color2:(guint32)color2
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_composite_color_simple([self castedGObject], destWidth, destHeight, interpType, overallAlpha, checkSize, color1, color2);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGdkPixbuf*)copy
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_copy([self castedGObject]);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)copyAreaWithSrcX:(int)srcX srcY:(int)srcY width:(int)width height:(int)height destPixbuf:(OGdkPixbuf*)destPixbuf destX:(int)destX destY:(int)destY
{
	gdk_pixbuf_copy_area([self castedGObject], srcX, srcY, width, height, [destPixbuf castedGObject], destX, destY);
}

- (bool)copyOptions:(OGdkPixbuf*)destPixbuf
{
	bool returnValue = (bool)gdk_pixbuf_copy_options([self castedGObject], [destPixbuf castedGObject]);

	return returnValue;
}

- (void)fill:(guint32)pixel
{
	gdk_pixbuf_fill([self castedGObject], pixel);
}

- (OGdkPixbuf*)flip:(bool)horizontal
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_flip([self castedGObject], horizontal);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (int)bitsPerSample
{
	int returnValue = (int)gdk_pixbuf_get_bits_per_sample([self castedGObject]);

	return returnValue;
}

- (gsize)byteLength
{
	gsize returnValue = (gsize)gdk_pixbuf_get_byte_length([self castedGObject]);

	return returnValue;
}

- (GdkColorspace)colorspace
{
	GdkColorspace returnValue = (GdkColorspace)gdk_pixbuf_get_colorspace([self castedGObject]);

	return returnValue;
}

- (bool)hasAlpha
{
	bool returnValue = (bool)gdk_pixbuf_get_has_alpha([self castedGObject]);

	return returnValue;
}

- (int)height
{
	int returnValue = (int)gdk_pixbuf_get_height([self castedGObject]);

	return returnValue;
}

- (int)nchannels
{
	int returnValue = (int)gdk_pixbuf_get_n_channels([self castedGObject]);

	return returnValue;
}

- (OFString*)option:(OFString*)key
{
	const gchar* gobjectValue = gdk_pixbuf_get_option([self castedGObject], [key UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GHashTable*)options
{
	GHashTable* returnValue = (GHashTable*)gdk_pixbuf_get_options([self castedGObject]);

	return returnValue;
}

- (guchar*)pixels
{
	guchar* returnValue = (guchar*)gdk_pixbuf_get_pixels([self castedGObject]);

	return returnValue;
}

- (guchar*)pixelsWithLength:(guint*)length
{
	guchar* returnValue = (guchar*)gdk_pixbuf_get_pixels_with_length([self castedGObject], length);

	return returnValue;
}

- (int)rowstride
{
	int returnValue = (int)gdk_pixbuf_get_rowstride([self castedGObject]);

	return returnValue;
}

- (int)width
{
	int returnValue = (int)gdk_pixbuf_get_width([self castedGObject]);

	return returnValue;
}

- (OGdkPixbuf*)newSubpixbufWithSrcX:(int)srcX srcY:(int)srcY width:(int)width height:(int)height
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_new_subpixbuf([self castedGObject], srcX, srcY, width, height);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (GBytes*)readPixelBytes
{
	GBytes* returnValue = (GBytes*)gdk_pixbuf_read_pixel_bytes([self castedGObject]);

	return returnValue;
}

- (const guint8*)readPixels
{
	const guint8* returnValue = (const guint8*)gdk_pixbuf_read_pixels([self castedGObject]);

	return returnValue;
}

- (bool)removeOption:(OFString*)key
{
	bool returnValue = (bool)gdk_pixbuf_remove_option([self castedGObject], [key UTF8String]);

	return returnValue;
}

- (OGdkPixbuf*)rotateSimple:(GdkPixbufRotation)angle
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_rotate_simple([self castedGObject], angle);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)saturateAndPixelateWithDest:(OGdkPixbuf*)dest saturation:(gfloat)saturation pixelate:(bool)pixelate
{
	gdk_pixbuf_saturate_and_pixelate([self castedGObject], [dest castedGObject], saturation, pixelate);
}

- (bool)saveToBuffervWithBuffer:(gchar**)buffer bufferSize:(gsize*)bufferSize type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_save_to_bufferv([self castedGObject], buffer, bufferSize, [type UTF8String], optionKeys, optionValues, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)saveToCallbackvWithSaveFunc:(GdkPixbufSaveFunc)saveFunc userData:(gpointer)userData type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_save_to_callbackv([self castedGObject], saveFunc, userData, [type UTF8String], optionKeys, optionValues, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)saveToStreamvWithStream:(OGOutputStream*)stream type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_save_to_streamv([self castedGObject], [stream castedGObject], [type UTF8String], optionKeys, optionValues, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)saveToStreamvAsyncWithStream:(OGOutputStream*)stream type:(OFString*)type optionKeys:(gchar**)optionKeys optionValues:(gchar**)optionValues cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gdk_pixbuf_save_to_streamv_async([self castedGObject], [stream castedGObject], [type UTF8String], optionKeys, optionValues, [cancellable castedGObject], callback, userData);
}

- (bool)savevWithFilename:(OFString*)filename type:(OFString*)type optionKeys:(char**)optionKeys optionValues:(char**)optionValues
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_savev([self castedGObject], [filename UTF8String], [type UTF8String], optionKeys, optionValues, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)scaleWithDest:(OGdkPixbuf*)dest destX:(int)destX destY:(int)destY destWidth:(int)destWidth destHeight:(int)destHeight offsetX:(double)offsetX offsetY:(double)offsetY scaleX:(double)scaleX scaleY:(double)scaleY interpType:(GdkInterpType)interpType
{
	gdk_pixbuf_scale([self castedGObject], [dest castedGObject], destX, destY, destWidth, destHeight, offsetX, offsetY, scaleX, scaleY, interpType);
}

- (OGdkPixbuf*)scaleSimpleWithDestWidth:(int)destWidth destHeight:(int)destHeight interpType:(GdkInterpType)interpType
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_scale_simple([self castedGObject], destWidth, destHeight, interpType);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (bool)setOptionWithKey:(OFString*)key value:(OFString*)value
{
	bool returnValue = (bool)gdk_pixbuf_set_option([self castedGObject], [key UTF8String], [value UTF8String]);

	return returnValue;
}


@end