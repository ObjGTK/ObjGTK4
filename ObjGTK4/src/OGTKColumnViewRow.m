/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColumnViewRow.h"

@implementation OGTKColumnViewRow

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_COLUMN_VIEW_ROW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_COLUMN_VIEW_ROW);
	return gObjectClass;
}

- (GtkColumnViewRow*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_COLUMN_VIEW_ROW, GtkColumnViewRow);
}

- (OFString*)accessibleDescription
{
	const char* gobjectValue = gtk_column_view_row_get_accessible_description((GtkColumnViewRow*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)accessibleLabel
{
	const char* gobjectValue = gtk_column_view_row_get_accessible_label((GtkColumnViewRow*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)activatable
{
	bool returnValue = (bool)gtk_column_view_row_get_activatable((GtkColumnViewRow*)[self castedGObject]);

	return returnValue;
}

- (bool)focusable
{
	bool returnValue = (bool)gtk_column_view_row_get_focusable((GtkColumnViewRow*)[self castedGObject]);

	return returnValue;
}

- (gpointer)item
{
	gpointer returnValue = (gpointer)gtk_column_view_row_get_item((GtkColumnViewRow*)[self castedGObject]);

	return returnValue;
}

- (guint)position
{
	guint returnValue = (guint)gtk_column_view_row_get_position((GtkColumnViewRow*)[self castedGObject]);

	return returnValue;
}

- (bool)selectable
{
	bool returnValue = (bool)gtk_column_view_row_get_selectable((GtkColumnViewRow*)[self castedGObject]);

	return returnValue;
}

- (bool)selected
{
	bool returnValue = (bool)gtk_column_view_row_get_selected((GtkColumnViewRow*)[self castedGObject]);

	return returnValue;
}

- (void)setAccessibleDescription:(OFString*)description
{
	gtk_column_view_row_set_accessible_description((GtkColumnViewRow*)[self castedGObject], [description UTF8String]);
}

- (void)setAccessibleLabel:(OFString*)label
{
	gtk_column_view_row_set_accessible_label((GtkColumnViewRow*)[self castedGObject], [label UTF8String]);
}

- (void)setActivatable:(bool)activatable
{
	gtk_column_view_row_set_activatable((GtkColumnViewRow*)[self castedGObject], activatable);
}

- (void)setFocusable:(bool)focusable
{
	gtk_column_view_row_set_focusable((GtkColumnViewRow*)[self castedGObject], focusable);
}

- (void)setSelectable:(bool)selectable
{
	gtk_column_view_row_set_selectable((GtkColumnViewRow*)[self castedGObject], selectable);
}


@end