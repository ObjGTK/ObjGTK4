/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkPixbufLoader.h"

#import "OGdkPixbuf.h"
#import "OGdkPixbufAnimation.h"

@implementation OGdkPixbufLoader

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_PIXBUF_LOADER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GdkPixbufLoader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_loader_new(), GdkPixbufLoader, GdkPixbufLoader);

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

- (instancetype)initWithMimeType:(OFString*)mimeType
{
	GError* err = NULL;

	GdkPixbufLoader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_loader_new_with_mime_type([mimeType UTF8String], &err), GdkPixbufLoader, GdkPixbufLoader);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (instancetype)initWithImageTypeWithType:(OFString*)imageType
{
	GError* err = NULL;

	GdkPixbufLoader* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_pixbuf_loader_new_with_type([imageType UTF8String], &err), GdkPixbufLoader, GdkPixbufLoader);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

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

- (GdkPixbufLoader*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkPixbufLoader, GdkPixbufLoader);
}

- (bool)close
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_loader_close([self castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGdkPixbufAnimation*)animation
{
	GdkPixbufAnimation* gobjectValue = gdk_pixbuf_loader_get_animation([self castedGObject]);

	OGdkPixbufAnimation* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GdkPixbufFormat*)format
{
	GdkPixbufFormat* returnValue = (GdkPixbufFormat*)gdk_pixbuf_loader_get_format([self castedGObject]);

	return returnValue;
}

- (OGdkPixbuf*)pixbuf
{
	GdkPixbuf* gobjectValue = gdk_pixbuf_loader_get_pixbuf([self castedGObject]);

	OGdkPixbuf* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setSizeWithWidth:(int)width height:(int)height
{
	gdk_pixbuf_loader_set_size([self castedGObject], width, height);
}

- (bool)writeWithBuf:(const guchar*)buf count:(gsize)count
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_loader_write([self castedGObject], buf, count, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)writeBytes:(GBytes*)buffer
{
	GError* err = NULL;

	bool returnValue = (bool)gdk_pixbuf_loader_write_bytes([self castedGObject], buffer, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end