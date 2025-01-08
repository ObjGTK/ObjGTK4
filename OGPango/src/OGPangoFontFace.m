/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontFace.h"

#import "OGPangoFontFamily.h"

@implementation OGPangoFontFace

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONT_FACE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (PangoFontFace*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoFontFace, PangoFontFace);
}

- (PangoFontDescription*)describe
{
	PangoFontDescription* returnValue = (PangoFontDescription*)pango_font_face_describe([self castedGObject]);

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
	PangoFontFamily* gobjectValue = pango_font_face_get_family([self castedGObject]);

	OGPangoFontFamily* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)isSynthesized
{
	bool returnValue = (bool)pango_font_face_is_synthesized([self castedGObject]);

	return returnValue;
}

- (void)listSizesWithSizes:(int**)sizes nsizes:(int*)nsizes
{
	pango_font_face_list_sizes([self castedGObject], sizes, nsizes);
}


@end