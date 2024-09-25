/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewRow.h"

@implementation OGTKColumnViewRow

- (GtkColumnViewRow*)castedGObject
{
	return GTK_COLUMN_VIEW_ROW([self gObject]);
}

- (OFString*)accessibleDescription
{
	const char* gobjectValue = gtk_column_view_row_get_accessible_description([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)accessibleLabel
{
	const char* gobjectValue = gtk_column_view_row_get_accessible_label([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)activatable
{
	bool returnValue = gtk_column_view_row_get_activatable([self castedGObject]);

	return returnValue;
}

- (bool)focusable
{
	bool returnValue = gtk_column_view_row_get_focusable([self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = gtk_column_view_row_get_item([self castedGObject]);

	return returnValue;
}

- (guint)position
{
	guint returnValue = gtk_column_view_row_get_position([self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = gtk_column_view_row_get_selectable([self castedGObject]);

	return returnValue;
}

- (bool)selected
{
	bool returnValue = gtk_column_view_row_get_selected([self castedGObject]);

	return returnValue;
}

- (void)setAccessibleDescription:(OFString*)description
{
	gtk_column_view_row_set_accessible_description([self castedGObject], [description UTF8String]);
}

- (void)setAccessibleLabel:(OFString*)label
{
	gtk_column_view_row_set_accessible_label([self castedGObject], [label UTF8String]);
}

- (void)setActivatable:(bool)activatable
{
	gtk_column_view_row_set_activatable([self castedGObject], activatable);
}

- (void)setFocusable:(bool)focusable
{
	gtk_column_view_row_set_focusable([self castedGObject], focusable);
}

- (void)setSelectable:(bool)selectable
{
	gtk_column_view_row_set_selectable([self castedGObject], selectable);
}


@end