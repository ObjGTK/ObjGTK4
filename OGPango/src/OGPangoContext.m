/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoContext.h"

#import "OGPangoFontFamily.h"
#import "OGPangoFontset.h"
#import "OGPangoFont.h"
#import "OGPangoFontMap.h"

@implementation OGPangoContext

- (instancetype)init
{
	PangoContext* gobjectValue = PANGO_CONTEXT(pango_context_new());

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

- (PangoContext*)castedGObject
{
	return PANGO_CONTEXT([self gObject]);
}

- (void)changed
{
	pango_context_changed([self castedGObject]);
}

- (PangoDirection)baseDir
{
	PangoDirection returnValue = pango_context_get_base_dir([self castedGObject]);

	return returnValue;
}

- (PangoGravity)baseGravity
{
	PangoGravity returnValue = pango_context_get_base_gravity([self castedGObject]);

	return returnValue;
}

- (PangoFontDescription*)fontDescription
{
	PangoFontDescription* returnValue = pango_context_get_font_description([self castedGObject]);

	return returnValue;
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = PANGO_FONT_MAP(pango_context_get_font_map([self castedGObject]));

	OGPangoFontMap* returnValue = [OGPangoFontMap withGObject:gobjectValue];
	return returnValue;
}

- (PangoGravity)gravity
{
	PangoGravity returnValue = pango_context_get_gravity([self castedGObject]);

	return returnValue;
}

- (PangoGravityHint)gravityHint
{
	PangoGravityHint returnValue = pango_context_get_gravity_hint([self castedGObject]);

	return returnValue;
}

- (PangoLanguage*)language
{
	PangoLanguage* returnValue = pango_context_get_language([self castedGObject]);

	return returnValue;
}

- (const PangoMatrix*)matrix
{
	const PangoMatrix* returnValue = pango_context_get_matrix([self castedGObject]);

	return returnValue;
}

- (PangoFontMetrics*)metricsWithDesc:(const PangoFontDescription*)desc language:(PangoLanguage*)language
{
	PangoFontMetrics* returnValue = pango_context_get_metrics([self castedGObject], desc, language);

	return returnValue;
}

- (bool)roundGlyphPositions
{
	bool returnValue = pango_context_get_round_glyph_positions([self castedGObject]);

	return returnValue;
}

- (guint)serial
{
	guint returnValue = pango_context_get_serial([self castedGObject]);

	return returnValue;
}

- (void)listFamiliesWithFamilies:(PangoFontFamily***)families nfamilies:(int*)nfamilies
{
	pango_context_list_families([self castedGObject], families, nfamilies);
}

- (OGPangoFont*)loadFont:(const PangoFontDescription*)desc
{
	PangoFont* gobjectValue = PANGO_FONT(pango_context_load_font([self castedGObject], desc));

	OGPangoFont* returnValue = [OGPangoFont withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontset*)loadFontsetWithDesc:(const PangoFontDescription*)desc language:(PangoLanguage*)language
{
	PangoFontset* gobjectValue = PANGO_FONTSET(pango_context_load_fontset([self castedGObject], desc, language));

	OGPangoFontset* returnValue = [OGPangoFontset withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setBaseDir:(PangoDirection)direction
{
	pango_context_set_base_dir([self castedGObject], direction);
}

- (void)setBaseGravity:(PangoGravity)gravity
{
	pango_context_set_base_gravity([self castedGObject], gravity);
}

- (void)setFontDescription:(const PangoFontDescription*)desc
{
	pango_context_set_font_description([self castedGObject], desc);
}

- (void)setFontMap:(OGPangoFontMap*)fontMap
{
	pango_context_set_font_map([self castedGObject], [fontMap castedGObject]);
}

- (void)setGravityHint:(PangoGravityHint)hint
{
	pango_context_set_gravity_hint([self castedGObject], hint);
}

- (void)setLanguage:(PangoLanguage*)language
{
	pango_context_set_language([self castedGObject], language);
}

- (void)setMatrix:(const PangoMatrix*)matrix
{
	pango_context_set_matrix([self castedGObject], matrix);
}

- (void)setRoundGlyphPositions:(bool)roundPositions
{
	pango_context_set_round_glyph_positions([self castedGObject], roundPositions);
}


@end