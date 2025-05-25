/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontFace.h"

#import "OGPangoFontFamily.h"

@implementation OGPangoFontFace

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONT_FACE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(PANGO_TYPE_FONT_FACE);
	return gObjectClass;
}

- (PangoFontFace*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PANGO_TYPE_FONT_FACE, PangoFontFace);
}

- (PangoFontDescription*)describe
{
	PangoFontDescription* returnValue = (PangoFontDescription*)pango_font_face_describe((PangoFontFace*)[self castedGObject]);

	return returnValue;
}

- (OFString*)faceName
{
	const char* gobjectValue = pango_font_face_get_face_name((PangoFontFace*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGPangoFontFamily*)family
{
	PangoFontFamily* gobjectValue = pango_font_face_get_family((PangoFontFace*)[self castedGObject]);

	OGPangoFontFamily* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)isSynthesized
{
	bool returnValue = (bool)pango_font_face_is_synthesized((PangoFontFace*)[self castedGObject]);

	return returnValue;
}

- (void)listSizes:(int**)sizes nsizes:(int*)nsizes
{
	pango_font_face_list_sizes((PangoFontFace*)[self castedGObject], sizes, nsizes);
}


@end