/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererCombo.h"

#import "OGTKCellRenderer.h"

@implementation OGTKCellRendererCombo

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_RENDERER_COMBO;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkCellRendererCombo* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_renderer_combo_new(), GtkCellRendererCombo, GtkCellRendererCombo);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkCellRendererCombo*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCellRendererCombo, GtkCellRendererCombo);
}


@end