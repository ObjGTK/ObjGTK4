/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSingleSelection.h"

@implementation OGTKSingleSelection

- (instancetype)init:(GListModel*)model
{
	GtkSingleSelection* gobjectValue = GTK_SINGLE_SELECTION(gtk_single_selection_new(model));

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
	return GTK_SINGLE_SELECTION([self gObject]);
}

- (bool)autoselect
{
	bool returnValue = gtk_single_selection_get_autoselect([self castedGObject]);

	return returnValue;
}

- (bool)canUnselect
{
	bool returnValue = gtk_single_selection_get_can_unselect([self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = gtk_single_selection_get_model([self castedGObject]);

	return returnValue;
}

- (guint)selected
{
	guint returnValue = gtk_single_selection_get_selected([self castedGObject]);

	return returnValue;
}

- (gpointer)selectedItem
{
	gpointer returnValue = gtk_single_selection_get_selected_item([self castedGObject]);

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