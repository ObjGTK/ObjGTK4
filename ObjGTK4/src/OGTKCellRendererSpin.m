/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererSpin.h"

#import "OGTKCellRenderer.h"

@implementation OGTKCellRendererSpin

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_RENDERER_SPIN;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CELL_RENDERER_SPIN);
	return gObjectClass;
}

+ (instancetype)cellRendererSpin
{
	GtkCellRendererSpin* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_renderer_spin_new(), GTK_TYPE_CELL_RENDERER_SPIN, GtkCellRendererSpin);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellRendererSpin* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellRendererSpin alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCellRendererSpin*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CELL_RENDERER_SPIN, GtkCellRendererSpin);
}


@end