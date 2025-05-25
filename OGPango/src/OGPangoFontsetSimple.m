/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontsetSimple.h"

#import "OGPangoFont.h"

@implementation OGPangoFontsetSimple

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONTSET_SIMPLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(PANGO_TYPE_FONTSET_SIMPLE);
	return gObjectClass;
}

+ (instancetype)fontsetSimpleWithLanguage:(PangoLanguage*)language
{
	PangoFontsetSimple* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(pango_fontset_simple_new(language), PANGO_TYPE_FONTSET_SIMPLE, PangoFontsetSimple);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PANGO_TYPE_FONTSET_SIMPLE, PangoFontsetSimple);
}

- (void)appendWithFont:(OGPangoFont*)font
{
	pango_fontset_simple_append((PangoFontsetSimple*)[self castedGObject], [font castedGObject]);
}

- (int)size
{
	int returnValue = (int)pango_fontset_simple_size((PangoFontsetSimple*)[self castedGObject]);

	return returnValue;
}


@end