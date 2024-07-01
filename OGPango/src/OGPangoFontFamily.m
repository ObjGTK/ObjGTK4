/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontFamily.h"

#import "OGPangoFontFace.h"

@implementation OGPangoFontFamily

- (PangoFontFamily*)castedGObject
{
	return PANGO_FONT_FAMILY([self gObject]);
}

- (OGPangoFontFace*)face:(OFString*)name
{
	PangoFontFace* gobjectValue = PANGO_FONT_FACE(pango_font_family_get_face([self castedGObject], [name UTF8String]));

	OGPangoFontFace* returnValue = [OGPangoFontFace withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = pango_font_family_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isMonospace
{
	bool returnValue = pango_font_family_is_monospace([self castedGObject]);

	return returnValue;
}

- (bool)isVariable
{
	bool returnValue = pango_font_family_is_variable([self castedGObject]);

	return returnValue;
}

- (void)listFacesWithFaces:(PangoFontFace***)faces nfaces:(int*)nfaces
{
	pango_font_family_list_faces([self castedGObject], faces, nfaces);
}


@end