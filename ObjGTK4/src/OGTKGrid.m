/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKGrid.h"

@implementation OGTKGrid

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_GRID;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)grid
{
	GtkGrid* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_grid_new(), GtkGrid, GtkGrid);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKGrid* wrapperObject;
	@try {
		wrapperObject = [[OGTKGrid alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkGrid*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkGrid, GtkGrid);
}

- (void)attachWithChild:(OGTKWidget*)child column:(int)column row:(int)row width:(int)width height:(int)height
{
	gtk_grid_attach([self castedGObject], [child castedGObject], column, row, width, height);
}

- (void)attachNextToWithChild:(OGTKWidget*)child sibling:(OGTKWidget*)sibling side:(GtkPositionType)side width:(int)width height:(int)height
{
	gtk_grid_attach_next_to([self castedGObject], [child castedGObject], [sibling castedGObject], side, width, height);
}

- (int)baselineRow
{
	int returnValue = (int)gtk_grid_get_baseline_row([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)childAtWithColumn:(int)column row:(int)row
{
	GtkWidget* gobjectValue = gtk_grid_get_child_at([self castedGObject], column, row);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)columnHomogeneous
{
	bool returnValue = (bool)gtk_grid_get_column_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)columnSpacing
{
	guint returnValue = (guint)gtk_grid_get_column_spacing([self castedGObject]);

	return returnValue;
}

- (GtkBaselinePosition)rowBaselinePosition:(int)row
{
	GtkBaselinePosition returnValue = (GtkBaselinePosition)gtk_grid_get_row_baseline_position([self castedGObject], row);

	return returnValue;
}

- (bool)rowHomogeneous
{
	bool returnValue = (bool)gtk_grid_get_row_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)rowSpacing
{
	guint returnValue = (guint)gtk_grid_get_row_spacing([self castedGObject]);

	return returnValue;
}

- (void)insertColumn:(int)position
{
	gtk_grid_insert_column([self castedGObject], position);
}

- (void)insertNextToWithSibling:(OGTKWidget*)sibling side:(GtkPositionType)side
{
	gtk_grid_insert_next_to([self castedGObject], [sibling castedGObject], side);
}

- (void)insertRow:(int)position
{
	gtk_grid_insert_row([self castedGObject], position);
}

- (void)queryChildWithChild:(OGTKWidget*)child column:(int*)column row:(int*)row width:(int*)width height:(int*)height
{
	gtk_grid_query_child([self castedGObject], [child castedGObject], column, row, width, height);
}

- (void)remove:(OGTKWidget*)child
{
	gtk_grid_remove([self castedGObject], [child castedGObject]);
}

- (void)removeColumn:(int)position
{
	gtk_grid_remove_column([self castedGObject], position);
}

- (void)removeRow:(int)position
{
	gtk_grid_remove_row([self castedGObject], position);
}

- (void)setBaselineRow:(int)row
{
	gtk_grid_set_baseline_row([self castedGObject], row);
}

- (void)setColumnHomogeneous:(bool)homogeneous
{
	gtk_grid_set_column_homogeneous([self castedGObject], homogeneous);
}

- (void)setColumnSpacing:(guint)spacing
{
	gtk_grid_set_column_spacing([self castedGObject], spacing);
}

- (void)setRowBaselinePositionWithRow:(int)row pos:(GtkBaselinePosition)pos
{
	gtk_grid_set_row_baseline_position([self castedGObject], row, pos);
}

- (void)setRowHomogeneous:(bool)homogeneous
{
	gtk_grid_set_row_homogeneous([self castedGObject], homogeneous);
}

- (void)setRowSpacing:(guint)spacing
{
	gtk_grid_set_row_spacing([self castedGObject], spacing);
}


@end