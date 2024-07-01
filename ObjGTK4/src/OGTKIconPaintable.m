/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIconPaintable.h"

@implementation OGTKIconPaintable

- (instancetype)initForFileWithFile:(GFile*)file size:(int)size scale:(int)scale
{
	GtkIconPaintable* gobjectValue = GTK_ICON_PAINTABLE(gtk_icon_paintable_new_for_file(file, size, scale));

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

- (GtkIconPaintable*)castedGObject
{
	return GTK_ICON_PAINTABLE([self gObject]);
}

- (GFile*)file
{
	GFile* returnValue = gtk_icon_paintable_get_file([self castedGObject]);

	return returnValue;
}

- (OFString*)iconName
{
	const char* gobjectValue = gtk_icon_paintable_get_icon_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isSymbolic
{
	bool returnValue = gtk_icon_paintable_is_symbolic([self castedGObject]);

	return returnValue;
}


@end