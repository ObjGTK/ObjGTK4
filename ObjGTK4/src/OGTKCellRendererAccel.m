/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererAccel.h"

#import "OGTKCellRenderer.h"

@implementation OGTKCellRendererAccel

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_RENDERER_ACCEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)cellRendererAccel
{
	GtkCellRendererAccel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_renderer_accel_new(), GtkCellRendererAccel, GtkCellRendererAccel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellRendererAccel* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellRendererAccel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCellRendererAccel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCellRendererAccel, GtkCellRendererAccel);
}


@end