/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbufLoader.h"

#import "OGdkPixbuf.h"
#import "OGdkPixbufAnimation.h"

@implementation OGdkPixbufLoader

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_PIXBUF_LOADER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_PIXBUF_LOADER);
	return gObjectClass;
}

+ (instancetype)pixbufLoader
{
	GdkPixbufLoader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_loader_new(), GDK_TYPE_PIXBUF_LOADER, GdkPixbufLoader);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkPixbufLoader* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbufLoader alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufLoaderWithMimeType:(OFString*)mimeType
{
	GError* err = NULL;

	GdkPixbufLoader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_loader_new_with_mime_type([mimeType UTF8String], &err), GDK_TYPE_PIXBUF_LOADER, GdkPixbufLoader);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbufLoader* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbufLoader alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)pixbufLoaderWithTypeWithImageType:(OFString*)imageType
{
	GError* err = NULL;

	GdkPixbufLoader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_loader_new_with_type([imageType UTF8String], &err), GDK_TYPE_PIXBUF_LOADER, GdkPixbufLoader);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGdkPixbufLoader* wrapperObject;
	@try {
		wrapperObject = [[OGdkPixbufLoader alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkPixbufLoader*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_PIXBUF_LOADER, GdkPixbufLoader);
}

- (bool)close
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_loader_close((GdkPixbufLoader*)[self castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGdkPixbufAnimation*)animation
{
	GdkPixbufAnimation* gobjectValue = gdk_pixbuf_loader_get_animation((GdkPixbufLoader*)[self castedGObject]);

	OGdkPixbufAnimation* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkPixbufFormat*)format
{
	GdkPixbufFormat* returnValue = (GdkPixbufFormat*)gdk_pixbuf_loader_get_format((GdkPixbufLoader*)[self castedGObject]);

	return returnValue;
}

- (OGdkPixbuf*)pixbuf
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_loader_get_pixbuf((GdkPixbufLoader*)[self castedGObject]);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setSizeWithWidth:(int)width height:(int)height
{
	gdk_pixbuf_loader_set_size((GdkPixbufLoader*)[self castedGObject], width, height);
}

- (bool)writeWithBuf:(const guchar*)buf count:(gsize)count
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_loader_write((GdkPixbufLoader*)[self castedGObject], buf, count, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)writeBytesWithBuffer:(GBytes*)buffer
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_loader_write_bytes((GdkPixbufLoader*)[self castedGObject], buffer, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end