/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontMap.h"

#import "OGPangoFont.h"
#import "OGPangoFontset.h"
#import "OGPangoContext.h"
#import "OGPangoFontFamily.h"

@implementation OGPangoFontMap

- (PangoFontMap*)castedGObject
{
	return PANGO_FONT_MAP([self gObject]);
}

- (void)changed
{
	pango_font_map_changed([self castedGObject]);
}

- (OGPangoContext*)createContext
{
	PangoContext* gobjectValue = PANGO_CONTEXT(pango_font_map_create_context([self castedGObject]));

	OGPangoContext* returnValue = [OGPangoContext withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontFamily*)family:(OFString*)name
{
	PangoFontFamily* gobjectValue = PANGO_FONT_FAMILY(pango_font_map_get_family([self castedGObject], [name UTF8String]));

	OGPangoFontFamily* returnValue = [OGPangoFontFamily withGObject:gobjectValue];
	return returnValue;
}

- (guint)serial
{
	guint returnValue = pango_font_map_get_serial([self castedGObject]);

	return returnValue;
}

- (void)listFamiliesWithFamilies:(PangoFontFamily***)families nfamilies:(int*)nfamilies
{
	pango_font_map_list_families([self castedGObject], families, nfamilies);
}

- (OGPangoFont*)loadFontWithContext:(OGPangoContext*)context desc:(const PangoFontDescription*)desc
{
	PangoFont* gobjectValue = PANGO_FONT(pango_font_map_load_font([self castedGObject], [context castedGObject], desc));

	OGPangoFont* returnValue = [OGPangoFont withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (OGPangoFontset*)loadFontsetWithContext:(OGPangoContext*)context desc:(const PangoFontDescription*)desc language:(PangoLanguage*)language
{
	PangoFontset* gobjectValue = PANGO_FONTSET(pango_font_map_load_fontset([self castedGObject], [context castedGObject], desc, language));

	OGPangoFontset* returnValue = [OGPangoFontset withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}


@end