/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGskCairoRenderer.h"

#import "OGskRenderer.h"

@implementation OGskCairoRenderer

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GSK_TYPE_CAIRO_RENDERER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GSK_TYPE_CAIRO_RENDERER);
	return gObjectClass;
}

+ (instancetype)cairoRenderer
{
	GskCairoRenderer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gsk_cairo_renderer_new(), GSK_TYPE_CAIRO_RENDERER, GskCairoRenderer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGskCairoRenderer* wrapperObject;
	@try {
		wrapperObject = [[OGskCairoRenderer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GskCairoRenderer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GSK_TYPE_CAIRO_RENDERER, GskCairoRenderer);
}


@end