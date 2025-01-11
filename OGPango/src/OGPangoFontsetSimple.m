/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontsetSimple.h"

#import "OGPangoFont.h"

@implementation OGPangoFontsetSimple

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONTSET_SIMPLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)fontsetSimple:(PangoLanguage*)language
{
	PangoFontsetSimple* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(pango_fontset_simple_new(language), PangoFontsetSimple, PangoFontsetSimple);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGPangoFontsetSimple* wrapperObject;
	@try {
		wrapperObject = [[OGPangoFontsetSimple alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (PangoFontsetSimple*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoFontsetSimple, PangoFontsetSimple);
}

- (void)append:(OGPangoFont*)font
{
	pango_fontset_simple_append([self castedGObject], [font castedGObject]);
}

- (int)size
{
	int returnValue = (int)pango_fontset_simple_size([self castedGObject]);

	return returnValue;
}


@end