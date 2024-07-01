/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFont.h"

#import "OGPangoContext.h"
#import "OGPangoCoverage.h"
#import "OGPangoFontFace.h"
#import "OGPangoFontMap.h"

@implementation OGPangoFont

+ (void)descriptionsFreeWithDescs:(PangoFontDescription**)descs ndescs:(int)ndescs
{
	pango_font_descriptions_free(descs, ndescs);
}

+ (OGPangoFont*)deserializeWithContext:(OGPangoContext*)context bytes:(GBytes*)bytes
{
	GError* err = NULL;

	PangoFont* gobjectValue = PANGO_FONT(pango_font_deserialize([context castedGObject], bytes, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGPangoFont* returnValue = [OGPangoFont withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoFont*)castedGObject
{
	return PANGO_FONT([self gObject]);
}

- (PangoFontDescription*)describe
{
	PangoFontDescription* returnValue = pango_font_describe([self castedGObject]);

	return returnValue;
}

- (PangoFontDescription*)describeWithAbsoluteSize
{
	PangoFontDescription* returnValue = pango_font_describe_with_absolute_size([self castedGObject]);

	return returnValue;
}

- (OGPangoCoverage*)coverage:(PangoLanguage*)language
{
	PangoCoverage* gobjectValue = PANGO_COVERAGE(pango_font_get_coverage([self castedGObject], language));

	OGPangoCoverage* returnValue = [OGPangoCoverage withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontFace*)face
{
	PangoFontFace* gobjectValue = PANGO_FONT_FACE(pango_font_get_face([self castedGObject]));

	OGPangoFontFace* returnValue = [OGPangoFontFace withGObject:gobjectValue];
	return returnValue;
}

- (void)featuresWithFeatures:(hb_feature_t*)features len:(guint)len numFeatures:(guint*)numFeatures
{
	pango_font_get_features([self castedGObject], features, len, numFeatures);
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = PANGO_FONT_MAP(pango_font_get_font_map([self castedGObject]));

	OGPangoFontMap* returnValue = [OGPangoFontMap withGObject:gobjectValue];
	return returnValue;
}

- (void)glyphExtentsWithGlyph:(PangoGlyph)glyph inkRect:(PangoRectangle*)inkRect logicalRect:(PangoRectangle*)logicalRect
{
	pango_font_get_glyph_extents([self castedGObject], glyph, inkRect, logicalRect);
}

- (hb_font_t*)hbFont
{
	hb_font_t* returnValue = pango_font_get_hb_font([self castedGObject]);

	return returnValue;
}

- (PangoLanguage**)languages
{
	PangoLanguage** returnValue = pango_font_get_languages([self castedGObject]);

	return returnValue;
}

- (PangoFontMetrics*)metrics:(PangoLanguage*)language
{
	PangoFontMetrics* returnValue = pango_font_get_metrics([self castedGObject], language);

	return returnValue;
}

- (bool)hasChar:(gunichar)wc
{
	bool returnValue = pango_font_has_char([self castedGObject], wc);

	return returnValue;
}

- (GBytes*)serialize
{
	GBytes* returnValue = pango_font_serialize([self castedGObject]);

	return returnValue;
}


@end