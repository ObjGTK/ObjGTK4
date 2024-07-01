/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontsetSimple.h"

#import "OGPangoFont.h"

@implementation OGPangoFontsetSimple

- (instancetype)init:(PangoLanguage*)language
{
	PangoFontsetSimple* gobjectValue = PANGO_FONTSET_SIMPLE(pango_fontset_simple_new(language));

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

- (PangoFontsetSimple*)castedGObject
{
	return PANGO_FONTSET_SIMPLE([self gObject]);
}

- (void)append:(OGPangoFont*)font
{
	pango_fontset_simple_append([self castedGObject], [font castedGObject]);
}

- (int)size
{
	int returnValue = pango_fontset_simple_size([self castedGObject]);

	return returnValue;
}


@end