/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkCursor.h"

#import "OGGdkTexture.h"

@implementation OGGdkCursor

- (instancetype)initFromNameWithName:(OFString*)name fallback:(OGGdkCursor*)fallback
{
	GdkCursor* gobjectValue = GDK_CURSOR(gdk_cursor_new_from_name([name UTF8String], [fallback castedGObject]));

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

- (instancetype)initFromTextureWithTexture:(OGGdkTexture*)texture hotspotX:(int)hotspotX hotspotY:(int)hotspotY fallback:(OGGdkCursor*)fallback
{
	GdkCursor* gobjectValue = GDK_CURSOR(gdk_cursor_new_from_texture([texture castedGObject], hotspotX, hotspotY, [fallback castedGObject]));

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

- (GdkCursor*)castedGObject
{
	return GDK_CURSOR([self gObject]);
}

- (OGGdkCursor*)fallback
{
	GdkCursor* gobjectValue = GDK_CURSOR(gdk_cursor_get_fallback([self castedGObject]));

	OGGdkCursor* returnValue = [OGGdkCursor withGObject:gobjectValue];
	return returnValue;
}

- (int)hotspotX
{
	int returnValue = gdk_cursor_get_hotspot_x([self castedGObject]);

	return returnValue;
}

- (int)hotspotY
{
	int returnValue = gdk_cursor_get_hotspot_y([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gdk_cursor_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGGdkTexture*)texture
{
	GdkTexture* gobjectValue = GDK_TEXTURE(gdk_cursor_get_texture([self castedGObject]));

	OGGdkTexture* returnValue = [OGGdkTexture withGObject:gobjectValue];
	return returnValue;
}


@end