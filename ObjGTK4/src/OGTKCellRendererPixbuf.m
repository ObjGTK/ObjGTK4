/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererPixbuf.h"

@implementation OGTKCellRendererPixbuf

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_RENDERER_PIXBUF;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CELL_RENDERER_PIXBUF);
	return gObjectClass;
}

+ (instancetype)cellRendererPixbuf
{
	GtkCellRendererPixbuf* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_renderer_pixbuf_new(), GTK_TYPE_CELL_RENDERER_PIXBUF, GtkCellRendererPixbuf);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellRendererPixbuf* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellRendererPixbuf alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCellRendererPixbuf*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CELL_RENDERER_PIXBUF, GtkCellRendererPixbuf);
}


@end