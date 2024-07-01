/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoFontset.h"

#import "OGPangoFont.h"

@implementation OGPangoFontset

- (PangoFontset*)castedGObject
{
	return PANGO_FONTSET([self gObject]);
}

- (void)foreachWithFunc:(PangoFontsetForeachFunc)func data:(gpointer)data
{
	pango_fontset_foreach([self castedGObject], func, data);
}

- (OGPangoFont*)font:(guint)wc
{
	PangoFont* gobjectValue = PANGO_FONT(pango_fontset_get_font([self castedGObject], wc));

	OGPangoFont* returnValue = [OGPangoFont withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoFontMetrics*)metrics
{
	PangoFontMetrics* returnValue = pango_fontset_get_metrics([self castedGObject]);

	return returnValue;
}


@end