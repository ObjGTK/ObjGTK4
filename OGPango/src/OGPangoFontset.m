/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontset.h"

#import "OGPangoFont.h"

@implementation OGPangoFontset

+ (void)load
{
	GType gtypeToAssociate = PANGO_TYPE_FONTSET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (PangoFontset*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoFontset, PangoFontset);
}

- (void)foreachWithFunc:(PangoFontsetForeachFunc)func data:(gpointer)data
{
	pango_fontset_foreach([self castedGObject], func, data);
}

- (OGPangoFont*)font:(guint)wc
{
	PangoFont* gobjectValue = pango_fontset_get_font([self castedGObject], wc);

	OGPangoFont* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoFontMetrics*)metrics
{
	PangoFontMetrics* returnValue = (PangoFontMetrics*)pango_fontset_get_metrics([self castedGObject]);

	return returnValue;
}


@end