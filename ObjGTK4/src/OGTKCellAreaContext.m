/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellAreaContext.h"

#import "OGTKCellArea.h"

@implementation OGTKCellAreaContext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_AREA_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CELL_AREA_CONTEXT);
	return gObjectClass;
}

- (GtkCellAreaContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CELL_AREA_CONTEXT, GtkCellAreaContext);
}

- (void)allocateWithWidth:(int)width height:(int)height
{
	gtk_cell_area_context_allocate((GtkCellAreaContext*)[self castedGObject], width, height);
}

- (void)allocationWithWidth:(int*)width height:(int*)height
{
	gtk_cell_area_context_get_allocation((GtkCellAreaContext*)[self castedGObject], width, height);
}

- (OGTKCellArea*)area
{
	GtkCellArea* gobjectValue = gtk_cell_area_context_get_area((GtkCellAreaContext*)[self castedGObject]);

	OGTKCellArea* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)preferredHeightWithMinimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_context_get_preferred_height((GtkCellAreaContext*)[self castedGObject], minimumHeight, naturalHeight);
}

- (void)preferredHeightForWidth:(int)width minimumHeight:(int*)minimumHeight naturalHeight:(int*)naturalHeight
{
	gtk_cell_area_context_get_preferred_height_for_width((GtkCellAreaContext*)[self castedGObject], width, minimumHeight, naturalHeight);
}

- (void)preferredWidthWithMinimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_context_get_preferred_width((GtkCellAreaContext*)[self castedGObject], minimumWidth, naturalWidth);
}

- (void)preferredWidthForHeight:(int)height minimumWidth:(int*)minimumWidth naturalWidth:(int*)naturalWidth
{
	gtk_cell_area_context_get_preferred_width_for_height((GtkCellAreaContext*)[self castedGObject], height, minimumWidth, naturalWidth);
}

- (void)pushPreferredHeightWithMinimumHeight:(int)minimumHeight naturalHeight:(int)naturalHeight
{
	gtk_cell_area_context_push_preferred_height((GtkCellAreaContext*)[self castedGObject], minimumHeight, naturalHeight);
}

- (void)pushPreferredWidthWithMinimumWidth:(int)minimumWidth naturalWidth:(int)naturalWidth
{
	gtk_cell_area_context_push_preferred_width((GtkCellAreaContext*)[self castedGObject], minimumWidth, naturalWidth);
}

- (void)reset
{
	gtk_cell_area_context_reset((GtkCellAreaContext*)[self castedGObject]);
}


@end