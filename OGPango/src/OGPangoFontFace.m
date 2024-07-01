/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontFace.h"

#import "OGPangoFontFamily.h"

@implementation OGPangoFontFace

- (PangoFontFace*)castedGObject
{
	return PANGO_FONT_FACE([self gObject]);
}

- (PangoFontDescription*)describe
{
	PangoFontDescription* returnValue = pango_font_face_describe([self castedGObject]);

	return returnValue;
}

- (OFString*)faceName
{
	const char* gobjectValue = pango_font_face_get_face_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGPangoFontFamily*)family
{
	PangoFontFamily* gobjectValue = PANGO_FONT_FAMILY(pango_font_face_get_family([self castedGObject]));

	OGPangoFontFamily* returnValue = [OGPangoFontFamily withGObject:gobjectValue];
	return returnValue;
}

- (bool)isSynthesized
{
	bool returnValue = pango_font_face_is_synthesized([self castedGObject]);

	return returnValue;
}

- (void)listSizesWithSizes:(int**)sizes nsizes:(int*)nsizes
{
	pango_font_face_list_sizes([self castedGObject], sizes, nsizes);
}


@end