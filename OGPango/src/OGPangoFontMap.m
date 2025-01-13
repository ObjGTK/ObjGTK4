/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontMap.h"

#import "OGPangoContext.h"
#import "OGPangoFont.h"
#import "OGPangoFontFamily.h"
#import "OGPangoFontset.h"

@implementation OGPangoFontMap

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONT_MAP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (PangoFontMap*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoFontMap, PangoFontMap);
}

- (void)changed
{
	pango_font_map_changed([self castedGObject]);
}

- (OGPangoContext*)createContext
{
	PangoContext* gobjectValue = pango_font_map_create_context([self castedGObject]);

	OGPangoContext* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontFamily*)familyWithName:(OFString*)name
{
	PangoFontFamily* gobjectValue = pango_font_map_get_family([self castedGObject], [name UTF8String]);

	OGPangoFontFamily* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (guint)serial
{
	guint returnValue = (guint)pango_font_map_get_serial([self castedGObject]);

	return returnValue;
}

- (void)listFamilies:(PangoFontFamily***)families nfamilies:(int*)nfamilies
{
	pango_font_map_list_families([self castedGObject], families, nfamilies);
}

- (OGPangoFont*)loadFontWithContext:(OGPangoContext*)context desc:(const PangoFontDescription*)desc
{
	PangoFont* gobjectValue = pango_font_map_load_font([self castedGObject], [context castedGObject], desc);

	OGPangoFont* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontset*)loadFontsetWithContext:(OGPangoContext*)context desc:(const PangoFontDescription*)desc language:(PangoLanguage*)language
{
	PangoFontset* gobjectValue = pango_font_map_load_fontset([self castedGObject], [context castedGObject], desc, language);

	OGPangoFontset* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFont*)reloadFont:(OGPangoFont*)font scale:(double)scale context:(OGPangoContext*)context variations:(OFString*)variations
{
	PangoFont* gobjectValue = pango_font_map_reload_font([self castedGObject], [font castedGObject], scale, [context castedGObject], [variations UTF8String]);

	OGPangoFont* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}


@end