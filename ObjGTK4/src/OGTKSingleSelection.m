/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSingleSelection.h"

@implementation OGTKSingleSelection

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SINGLE_SELECTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SINGLE_SELECTION);
	return gObjectClass;
}

+ (instancetype)singleSelectionWithModel:(GListModel*)model
{
	GtkSingleSelection* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_single_selection_new(model), GTK_TYPE_SINGLE_SELECTION, GtkSingleSelection);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKSingleSelection* wrapperObject;
	@try {
		wrapperObject = [[OGTKSingleSelection alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSingleSelection*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SINGLE_SELECTION, GtkSingleSelection);
}

- (bool)autoselect
{
	bool returnValue = (bool)gtk_single_selection_get_autoselect((GtkSingleSelection*)[self castedGObject]);

	return returnValue;
}

- (bool)canUnselect
{
	bool returnValue = (bool)gtk_single_selection_get_can_unselect((GtkSingleSelection*)[self castedGObject]);

	return returnValue;
}

- (GListModel*)model
{
	GListModel* returnValue = (GListModel*)gtk_single_selection_get_model((GtkSingleSelection*)[self castedGObject]);

	return returnValue;
}

- (guint)selected
{
	guint returnValue = (guint)gtk_single_selection_get_selected((GtkSingleSelection*)[self castedGObject]);

	return returnValue;
}

- (gpointer)selectedItem
{
	gpointer returnValue = (gpointer)gtk_single_selection_get_selected_item((GtkSingleSelection*)[self castedGObject]);

	return returnValue;
}

- (void)setAutoselect:(bool)autoselect
{
	gtk_single_selection_set_autoselect((GtkSingleSelection*)[self castedGObject], autoselect);
}

- (void)setCanUnselect:(bool)canUnselect
{
	gtk_single_selection_set_can_unselect((GtkSingleSelection*)[self castedGObject], canUnselect);
}

- (void)setModel:(GListModel*)model
{
	gtk_single_selection_set_model((GtkSingleSelection*)[self castedGObject], model);
}

- (void)setSelectedWithPosition:(guint)position
{
	gtk_single_selection_set_selected((GtkSingleSelection*)[self castedGObject], position);
}


@end