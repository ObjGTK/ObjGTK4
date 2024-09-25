/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewCell.h"

#import "OGTKWidget.h"

@implementation OGTKColumnViewCell

- (GtkColumnViewCell*)castedGObject
{
	return GTK_COLUMN_VIEW_CELL([self gObject]);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_column_view_cell_get_child([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (bool)focusable
{
	bool returnValue = gtk_column_view_cell_get_focusable([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = gtk_column_view_cell_get_item([self castedGObject]);

	return returnValue;
}

- (guint)position
{
	guint returnValue = gtk_column_view_cell_get_position([self castedGObject]);

	return returnValue;
}

- (bool)selected
{
	bool returnValue = gtk_column_view_cell_get_selected([self castedGObject]);

	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_column_view_cell_set_child([self castedGObject], [child castedGObject]);
}

- (void)setFocusable:(bool)focusable
{
	gtk_column_view_cell_set_focusable([self castedGObject], focusable);
}


@end