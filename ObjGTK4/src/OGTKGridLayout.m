/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGridLayout.h"

@implementation OGTKGridLayout

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GRID_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)gridLayout
{
	GtkGridLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_grid_layout_new(), GtkGridLayout, GtkGridLayout);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKGridLayout* wrapperObject;
	@try {
		wrapperObject = [[OGTKGridLayout alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGridLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGridLayout, GtkGridLayout);
}

- (int)baselineRow
{
	int returnValue = (int)gtk_grid_layout_get_baseline_row([self castedGObject]);

	return returnValue;
}

- (bool)columnHomogeneous
{
	bool returnValue = (bool)gtk_grid_layout_get_column_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)columnSpacing
{
	guint returnValue = (guint)gtk_grid_layout_get_column_spacing([self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)rowBaselinePosition:(int)row
{
	GtkBaselinePosition returnValue = (GtkBaselinePosition)gtk_grid_layout_get_row_baseline_position([self castedGObject], row);

	return returnValue;
}

- (bool)rowHomogeneous
{
	bool returnValue = (bool)gtk_grid_layout_get_row_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)rowSpacing
{
	guint returnValue = (guint)gtk_grid_layout_get_row_spacing([self castedGObject]);

	return returnValue;
}

- (void)setBaselineRow:(int)row
{
	gtk_grid_layout_set_baseline_row([self castedGObject], row);
}

- (void)setColumnHomogeneous:(bool)homogeneous
{
	gtk_grid_layout_set_column_homogeneous([self castedGObject], homogeneous);
}

- (void)setColumnSpacing:(guint)spacing
{
	gtk_grid_layout_set_column_spacing([self castedGObject], spacing);
}

- (void)setRowBaselinePositionWithRow:(int)row pos:(GtkBaselinePosition)pos
{
	gtk_grid_layout_set_row_baseline_position([self castedGObject], row, pos);
}

- (void)setRowHomogeneous:(bool)homogeneous
{
	gtk_grid_layout_set_row_homogeneous([self castedGObject], homogeneous);
}

- (void)setRowSpacing:(guint)spacing
{
	gtk_grid_layout_set_row_spacing([self castedGObject], spacing);
}


@end