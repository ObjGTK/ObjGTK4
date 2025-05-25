/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFont.h"

#import "OGPangoContext.h"
#import "OGPangoCoverage.h"
#import "OGPangoFontFace.h"
#import "OGPangoFontMap.h"

@implementation OGPangoFont

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(PANGO_TYPE_FONT);
	return gObjectClass;
}

+ (void)descriptionsFreeWithDescs:(PangoFontDescription**)descs ndescs:(int)ndescs
{
	pango_font_descriptions_free(descs, ndescs);
}

+ (OGPangoFont*)deserializeWithContext:(OGPangoContext*)context bytes:(GBytes*)bytes
{
	GError* err = NULL;

	PangoFont* gobjectValue = pango_font_deserialize([context castedGObject], bytes, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGPangoFont* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoFont*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PANGO_TYPE_FONT, PangoFont);
}

- (PangoFontDescription*)describe
{
	PangoFontDescription* returnValue = (PangoFontDescription*)pango_font_describe((PangoFont*)[self castedGObject]);

	return returnValue;
}

- (PangoFontDescription*)describeWithAbsoluteSize
{
	PangoFontDescription* returnValue = (PangoFontDescription*)pango_font_describe_with_absolute_size((PangoFont*)[self castedGObject]);

	return returnValue;
}

- (OGPangoCoverage*)coverageWithLanguage:(PangoLanguage*)language
{
	PangoCoverage* gobjectValue = pango_font_get_coverage((PangoFont*)[self castedGObject], language);

	OGPangoCoverage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontFace*)face
{
	PangoFontFace* gobjectValue = pango_font_get_face((PangoFont*)[self castedGObject]);

	OGPangoFontFace* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)featuresWithFeatures:(hb_feature_t*)features len:(guint)len numFeatures:(guint*)numFeatures
{
	pango_font_get_features((PangoFont*)[self castedGObject], features, len, numFeatures);
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = pango_font_get_font_map((PangoFont*)[self castedGObject]);

	OGPangoFontMap* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)glyphExtentsWithGlyph:(PangoGlyph)glyph inkRect:(PangoRectangle*)inkRect logicalRect:(PangoRectangle*)logicalRect
{
	pango_font_get_glyph_extents((PangoFont*)[self castedGObject], glyph, inkRect, logicalRect);
}

- (hb_font_t*)hbFont
{
	hb_font_t* returnValue = (hb_font_t*)pango_font_get_hb_font((PangoFont*)[self castedGObject]);

	return returnValue;
}

- (PangoLanguage**)languages
{
	PangoLanguage** returnValue = (PangoLanguage**)pango_font_get_languages((PangoFont*)[self castedGObject]);

	return returnValue;
}

- (PangoFontMetrics*)metricsWithLanguage:(PangoLanguage*)language
{
	PangoFontMetrics* returnValue = (PangoFontMetrics*)pango_font_get_metrics((PangoFont*)[self castedGObject], language);

	return returnValue;
}

- (bool)hasCharWithWc:(gunichar)wc
{
	bool returnValue = (bool)pango_font_has_char((PangoFont*)[self castedGObject], wc);

	return returnValue;
}

- (GBytes*)serialize
{
	GBytes* returnValue = (GBytes*)pango_font_serialize((PangoFont*)[self castedGObject]);

	return returnValue;
}


@end