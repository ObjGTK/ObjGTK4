/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGridLayoutChild.h"

@implementation OGTKGridLayoutChild

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GRID_LAYOUT_CHILD;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_GRID_LAYOUT_CHILD);
	return gObjectClass;
}

- (GtkGridLayoutChild*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_GRID_LAYOUT_CHILD, GtkGridLayoutChild);
}

- (int)column
{
	int returnValue = (int)gtk_grid_layout_child_get_column((GtkGridLayoutChild*)[self castedGObject]);

	return returnValue;
}

- (int)columnSpan
{
	int returnValue = (int)gtk_grid_layout_child_get_column_span((GtkGridLayoutChild*)[self castedGObject]);

	return returnValue;
}

- (int)row
{
	int returnValue = (int)gtk_grid_layout_child_get_row((GtkGridLayoutChild*)[self castedGObject]);

	return returnValue;
}

- (int)rowSpan
{
	int returnValue = (int)gtk_grid_layout_child_get_row_span((GtkGridLayoutChild*)[self castedGObject]);

	return returnValue;
}

- (void)setColumn:(int)column
{
	gtk_grid_layout_child_set_column((GtkGridLayoutChild*)[self castedGObject], column);
}

- (void)setColumnSpan:(int)span
{
	gtk_grid_layout_child_set_column_span((GtkGridLayoutChild*)[self castedGObject], span);
}

- (void)setRow:(int)row
{
	gtk_grid_layout_child_set_row((GtkGridLayoutChild*)[self castedGObject], row);
}

- (void)setRowSpan:(int)span
{
	gtk_grid_layout_child_set_row_span((GtkGridLayoutChild*)[self castedGObject], span);
}


@end