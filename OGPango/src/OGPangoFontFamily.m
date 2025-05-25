/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontFamily.h"

#import "OGPangoFontFace.h"

@implementation OGPangoFontFamily

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONT_FAMILY;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(PANGO_TYPE_FONT_FAMILY);
	return gObjectClass;
}

- (PangoFontFamily*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PANGO_TYPE_FONT_FAMILY, PangoFontFamily);
}

- (OGPangoFontFace*)faceWithName:(OFString*)name
{
	PangoFontFace* gobjectValue = pango_font_family_get_face((PangoFontFamily*)[self castedGObject], [name UTF8String]);

	OGPangoFontFace* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)name
{
	const char* gobjectValue = pango_font_family_get_name((PangoFontFamily*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isMonospace
{
	bool returnValue = (bool)pango_font_family_is_monospace((PangoFontFamily*)[self castedGObject]);

	return returnValue;
}

- (bool)isVariable
{
	bool returnValue = (bool)pango_font_family_is_variable((PangoFontFamily*)[self castedGObject]);

	return returnValue;
}

- (void)listFaces:(PangoFontFace***)faces nfaces:(int*)nfaces
{
	pango_font_family_list_faces((PangoFontFamily*)[self castedGObject], faces, nfaces);
}


@end