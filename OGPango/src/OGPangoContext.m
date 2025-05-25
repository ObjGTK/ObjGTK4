/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoContext.h"

#import "OGPangoFont.h"
#import "OGPangoFontFamily.h"
#import "OGPangoFontMap.h"
#import "OGPangoFontset.h"

@implementation OGPangoContext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(PANGO_TYPE_CONTEXT);
	return gObjectClass;
}

+ (instancetype)context
{
	PangoContext* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(pango_context_new(), PANGO_TYPE_CONTEXT, PangoContext);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGPangoContext* wrapperObject;
	@try {
		wrapperObject = [[OGPangoContext alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (PangoContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PANGO_TYPE_CONTEXT, PangoContext);
}

- (void)changed
{
	pango_context_changed((PangoContext*)[self castedGObject]);
}

- (PangoDirection)baseDir
{
	PangoDirection returnValue = (PangoDirection)pango_context_get_base_dir((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (PangoGravity)baseGravity
{
	PangoGravity returnValue = (PangoGravity)pango_context_get_base_gravity((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (PangoFontDescription*)fontDescription
{
	PangoFontDescription* returnValue = (PangoFontDescription*)pango_context_get_font_description((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = pango_context_get_font_map((PangoContext*)[self castedGObject]);

	OGPangoFontMap* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (PangoGravity)gravity
{
	PangoGravity returnValue = (PangoGravity)pango_context_get_gravity((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (PangoGravityHint)gravityHint
{
	PangoGravityHint returnValue = (PangoGravityHint)pango_context_get_gravity_hint((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (PangoLanguage*)language
{
	PangoLanguage* returnValue = (PangoLanguage*)pango_context_get_language((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (const PangoMatrix*)matrix
{
	const PangoMatrix* returnValue = (const PangoMatrix*)pango_context_get_matrix((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (PangoFontMetrics*)metricsWithDesc:(const PangoFontDescription*)desc language:(PangoLanguage*)language
{
	PangoFontMetrics* returnValue = (PangoFontMetrics*)pango_context_get_metrics((PangoContext*)[self castedGObject], desc, language);

	return returnValue;
}

- (bool)roundGlyphPositions
{
	bool returnValue = (bool)pango_context_get_round_glyph_positions((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (guint)serial
{
	guint returnValue = (guint)pango_context_get_serial((PangoContext*)[self castedGObject]);

	return returnValue;
}

- (void)listFamilies:(PangoFontFamily***)families nfamilies:(int*)nfamilies
{
	pango_context_list_families((PangoContext*)[self castedGObject], families, nfamilies);
}

- (OGPangoFont*)loadFontWithDesc:(const PangoFontDescription*)desc
{
	PangoFont* gobjectValue = pango_context_load_font((PangoContext*)[self castedGObject], desc);

	OGPangoFont* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontset*)loadFontsetWithDesc:(const PangoFontDescription*)desc language:(PangoLanguage*)language
{
	PangoFontset* gobjectValue = pango_context_load_fontset((PangoContext*)[self castedGObject], desc, language);

	OGPangoFontset* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setBaseDirWithDirection:(PangoDirection)direction
{
	pango_context_set_base_dir((PangoContext*)[self castedGObject], direction);
}

- (void)setBaseGravity:(PangoGravity)gravity
{
	pango_context_set_base_gravity((PangoContext*)[self castedGObject], gravity);
}

- (void)setFontDescription:(const PangoFontDescription*)desc
{
	pango_context_set_font_description((PangoContext*)[self castedGObject], desc);
}

- (void)setFontMap:(OGPangoFontMap*)fontMap
{
	pango_context_set_font_map((PangoContext*)[self castedGObject], [fontMap castedGObject]);
}

- (void)setGravityHint:(PangoGravityHint)hint
{
	pango_context_set_gravity_hint((PangoContext*)[self castedGObject], hint);
}

- (void)setLanguage:(PangoLanguage*)language
{
	pango_context_set_language((PangoContext*)[self castedGObject], language);
}

- (void)setMatrix:(const PangoMatrix*)matrix
{
	pango_context_set_matrix((PangoContext*)[self castedGObject], matrix);
}

- (void)setRoundGlyphPositionsWithRoundPositions:(bool)roundPositions
{
	pango_context_set_round_glyph_positions((PangoContext*)[self castedGObject], roundPositions);
}


@end