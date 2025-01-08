/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSingleSelection.h"

@implementation OGTKSingleSelection

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SINGLE_SELECTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithModel:(GListModel*)model
{
	GtkSingleSelection* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_single_selection_new(model), GtkSingleSelection, GtkSingleSelection);

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

- (GtkSingleSelection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkSingleSelection, GtkSingleSelection);
}

- (bool)autoselect
{
	bool returnValue = (bool)gtk_single_selection_get_autoselect([self castedGObject]);

	return returnValue;
}

- (bool)canUnselect
{
	bool returnValue = (bool)gtk_single_selection_get_can_unselect([self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_single_selection_get_model([self castedGObject]);

	return returnValue;
}

- (guint)selected
{
	guint returnValue = (guint)gtk_single_selection_get_selected([self castedGObject]);

	return returnValue;
}

- (gpointer)selectedItem
{
	gpointer returnValue = (gpointer)gtk_single_selection_get_selected_item([self castedGObject]);

	return returnValue;
}

- (void)setAutoselect:(bool)autoselect
{
	gtk_single_selection_set_autoselect([self castedGObject], autoselect);
}

- (void)setCanUnselect:(bool)canUnselect
{
	gtk_single_selection_set_can_unselect([self castedGObject], canUnselect);
}

- (void)setModel:(GListModel*)model
{
	gtk_single_selection_set_model([self castedGObject], model);
}

- (void)setSelected:(guint)position
{
	gtk_single_selection_set_selected([self castedGObject], position);
}


@end