/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererToggle.h"

@implementation OGTKCellRendererToggle

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_RENDERER_TOGGLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CELL_RENDERER_TOGGLE);
	return gObjectClass;
}

+ (instancetype)cellRendererToggle
{
	GtkCellRendererToggle* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_renderer_toggle_new(), GTK_TYPE_CELL_RENDERER_TOGGLE, GtkCellRendererToggle);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellRendererToggle* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellRendererToggle alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCellRendererToggle*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CELL_RENDERER_TOGGLE, GtkCellRendererToggle);
}

- (bool)activatable
{
	bool returnValue = (bool)gtk_cell_renderer_toggle_get_activatable((GtkCellRendererToggle*)[self castedGObject]);

	return returnValue;
}

- (bool)active
{
	bool returnValue = (bool)gtk_cell_renderer_toggle_get_active((GtkCellRendererToggle*)[self castedGObject]);

	return returnValue;
}

- (bool)radio
{
	bool returnValue = (bool)gtk_cell_renderer_toggle_get_radio((GtkCellRendererToggle*)[self castedGObject]);

	return returnValue;
}

- (void)setActivatableWithSetting:(bool)setting
{
	gtk_cell_renderer_toggle_set_activatable((GtkCellRendererToggle*)[self castedGObject], setting);
}

- (void)setActiveWithSetting:(bool)setting
{
	gtk_cell_renderer_toggle_set_active((GtkCellRendererToggle*)[self castedGObject], setting);
}

- (void)setRadio:(bool)radio
{
	gtk_cell_renderer_toggle_set_radio((GtkCellRendererToggle*)[self castedGObject], radio);
}


@end