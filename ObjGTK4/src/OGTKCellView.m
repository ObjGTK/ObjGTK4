/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellView.h"

#import "OGTKCellArea.h"
#import <OGdk4/OGGdkTexture.h>
#import "OGTKCellAreaContext.h"

@implementation OGTKCellView

- (instancetype)init
{
	GtkCellView* gobjectValue = GTK_CELL_VIEW(gtk_cell_view_new());

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initWithContextWithArea:(OGTKCellArea*)area context:(OGTKCellAreaContext*)context
{
	GtkCellView* gobjectValue = GTK_CELL_VIEW(gtk_cell_view_new_with_context([area castedGObject], [context castedGObject]));

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initWithMarkup:(OFString*)markup
{
	GtkCellView* gobjectValue = GTK_CELL_VIEW(gtk_cell_view_new_with_markup([markup UTF8String]));

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initWithText:(OFString*)text
{
	GtkCellView* gobjectValue = GTK_CELL_VIEW(gtk_cell_view_new_with_text([text UTF8String]));

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initWithTexture:(OGGdkTexture*)texture
{
	GtkCellView* gobjectValue = GTK_CELL_VIEW(gtk_cell_view_new_with_texture([texture castedGObject]));

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkCellView*)castedGObject
{
	return GTK_CELL_VIEW([self gObject]);
}

- (GtkTreePath*)displayedRow
{
	GtkTreePath* returnValue = gtk_cell_view_get_displayed_row([self castedGObject]);

	return returnValue;
}

- (bool)drawSensitive
{
	bool returnValue = gtk_cell_view_get_draw_sensitive([self castedGObject]);

	return returnValue;
}

- (bool)fitModel
{
	bool returnValue = gtk_cell_view_get_fit_model([self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = gtk_cell_view_get_model([self castedGObject]);

	return returnValue;
}

- (void)setDisplayedRow:(GtkTreePath*)path
{
	gtk_cell_view_set_displayed_row([self castedGObject], path);
}

- (void)setDrawSensitive:(bool)drawSensitive
{
	gtk_cell_view_set_draw_sensitive([self castedGObject], drawSensitive);
}

- (void)setFitModel:(bool)fitModel
{
	gtk_cell_view_set_fit_model([self castedGObject], fitModel);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_cell_view_set_model([self castedGObject], model);
}


@end