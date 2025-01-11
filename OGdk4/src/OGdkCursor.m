/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkCursor.h"

#import "OGdkTexture.h"

@implementation OGdkCursor

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CURSOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)cursorFromNameWithName:(OFString*)name fallback:(OGdkCursor*)fallback
{
	GdkCursor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_cursor_new_from_name([name UTF8String], [fallback castedGObject]), GdkCursor, GdkCursor);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkCursor* wrapperObject;
	@try {
		wrapperObject = [[OGdkCursor alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)cursorFromTextureWithTexture:(OGdkTexture*)texture hotspotX:(int)hotspotX hotspotY:(int)hotspotY fallback:(OGdkCursor*)fallback
{
	GdkCursor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gdk_cursor_new_from_texture([texture castedGObject], hotspotX, hotspotY, [fallback castedGObject]), GdkCursor, GdkCursor);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGdkCursor* wrapperObject;
	@try {
		wrapperObject = [[OGdkCursor alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GdkCursor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GdkCursor, GdkCursor);
}

- (OGdkCursor*)fallback
{
	GdkCursor* gobjectValue = gdk_cursor_get_fallback([self castedGObject]);

	OGdkCursor* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (int)hotspotX
{
	int returnValue = (int)gdk_cursor_get_hotspot_x([self castedGObject]);

	return returnValue;
}

- (int)hotspotY
{
	int returnValue = (int)gdk_cursor_get_hotspot_y([self castedGObject]);

	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = gdk_cursor_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGdkTexture*)texture
{
	GdkTexture* gobjectValue = gdk_cursor_get_texture([self castedGObject]);

	OGdkTexture* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end