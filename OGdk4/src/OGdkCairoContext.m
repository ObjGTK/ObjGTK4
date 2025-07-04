/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGdkCairoContext.h"

@implementation OGdkCairoContext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GDK_TYPE_CAIRO_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GDK_TYPE_CAIRO_CONTEXT);
	return gObjectClass;
}

- (GdkCairoContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GDK_TYPE_CAIRO_CONTEXT, GdkCairoContext);
}

- (cairo_t*)cairoCreate
{
	cairo_t* returnValue = (cairo_t*)gdk_cairo_context_cairo_create((GdkCairoContext*)[self castedGObject]);

	return returnValue;
}


@end