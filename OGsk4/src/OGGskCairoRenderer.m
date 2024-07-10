/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGskCairoRenderer.h"

#import "OGGskRenderer.h"

@implementation OGGskCairoRenderer

- (instancetype)init
{
	GskCairoRenderer* gobjectValue = GSK_CAIRO_RENDERER(gsk_cairo_renderer_new());

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

- (GskCairoRenderer*)castedGObject
{
	return GSK_CAIRO_RENDERER([self gObject]);
}


@end