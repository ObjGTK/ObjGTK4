/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewCell.h"

#import "OGTKWidget.h"

@implementation OGTKColumnViewCell

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLUMN_VIEW_CELL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COLUMN_VIEW_CELL);
	return gObjectClass;
}

- (GtkColumnViewCell*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COLUMN_VIEW_CELL, GtkColumnViewCell);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_column_view_cell_get_child((GtkColumnViewCell*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)focusable
{
	bool returnValue = (bool)gtk_column_view_cell_get_focusable((GtkColumnViewCell*)[self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = (gpointer)gtk_column_view_cell_get_item((GtkColumnViewCell*)[self castedGObject]);

	return returnValue;
}

- (guint)position
{
	guint returnValue = (guint)gtk_column_view_cell_get_position((GtkColumnViewCell*)[self castedGObject]);

	return returnValue;
}

- (bool)selected
{
	bool returnValue = (bool)gtk_column_view_cell_get_selected((GtkColumnViewCell*)[self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_column_view_cell_set_child((GtkColumnViewCell*)[self castedGObject], [child castedGObject]);
}

- (void)setFocusable:(bool)focusable
{
	gtk_column_view_cell_set_focusable((GtkColumnViewCell*)[self castedGObject], focusable);
}


@end