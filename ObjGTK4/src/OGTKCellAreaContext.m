/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellAreaContext.h"

#import "OGTKCellArea.h"

@implementation OGTKCellAreaContext

- (GtkCellAreaContext*)castedGObject
{
	return GTK_CELL_AREA_CONTEXT([self gObject]);
}

- (void)allocateWithWidth:(int)width height:(int)height
{
	gtk_cell_area_context_allocate([self castedGObject], width, height);
}

- (void)allocationWithWidth:(int*)width height:(int*)height
{
	gtk_cell_area_context_get_allocation([self castedGObject], width, height);
}

- (OGTKCellArea*)area
{
	GtkCellArea* gobjectValue = GTK_CELL_AREA(gtk_cell_area_context_get_area([self castedGObject]));

	OGTKCellArea* returnValue = [OGTKCellArea withGObject:gobjectValue];
	return returnValue;
}

- (void)preferredHeightWithMinimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_context_get_preferred_height([self castedGObject], minimumHeight, naturalHeight);
}

- (void)preferredHeightForWidthWithWidth:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_context_get_preferred_height_for_width([self castedGObject], width, minimumHeight, naturalHeight);
}

- (void)preferredWidthWithMinimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_context_get_preferred_width([self castedGObject], minimumWidth, naturalWidth);
}

- (void)preferredWidthForHeightWithHeight:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_context_get_preferred_width_for_height([self castedGObject], height, minimumWidth, naturalWidth);
}

- (void)pushPreferredHeightWithMinimumHeight:(int)minimumHeight naturalHeight:(int)naturalHeight
{
	gtk_cell_area_context_push_preferred_height([self castedGObject], minimumHeight, naturalHeight);
}

- (void)pushPreferredWidthWithMinimumWidth:(int)minimumWidth naturalWidth:(int)naturalWidth
{
	gtk_cell_area_context_push_preferred_width([self castedGObject], minimumWidth, naturalWidth);
}

- (void)reset
{
	gtk_cell_area_context_reset([self castedGObject]);
}


@end