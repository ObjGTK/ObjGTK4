/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkCairoContext.h"

@implementation OGGdkCairoContext

- (GdkCairoContext*)castedGObject
{
	return GDK_CAIRO_CONTEXT([self gObject]);
}

- (cairo_t*)cairoCreate
{
	cairo_t* returnValue = gdk_cairo_context_cairo_create([self castedGObject]);

	return returnValue;
}


@end