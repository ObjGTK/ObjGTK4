/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellView.h"

#import <OGdk4/OGdkTexture.h>
#import "OGTKCellArea.h"
#import "OGTKCellAreaContext.h"

@implementation OGTKCellView

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CELL_VIEW);
	return gObjectClass;
}

+ (instancetype)cellView
{
	GtkCellView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_view_new(), GTK_TYPE_CELL_VIEW, GtkCellView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellView* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)cellViewWithContextWithArea:(OGTKCellArea*)area context:(OGTKCellAreaContext*)context
{
	GtkCellView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_view_new_with_context([area castedGObject], [context castedGObject]), GTK_TYPE_CELL_VIEW, GtkCellView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellView* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)cellViewWithMarkup:(OFString*)markup
{
	GtkCellView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_view_new_with_markup([markup UTF8String]), GTK_TYPE_CELL_VIEW, GtkCellView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellView* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)cellViewWithText:(OFString*)text
{
	GtkCellView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_view_new_with_text([text UTF8String]), GTK_TYPE_CELL_VIEW, GtkCellView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellView* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)cellViewWithTexture:(OGdkTexture*)texture
{
	GtkCellView* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_view_new_with_texture([texture castedGObject]), GTK_TYPE_CELL_VIEW, GtkCellView);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellView* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellView alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCellView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CELL_VIEW, GtkCellView);
}

- (GtkTreePath*)displayedRow
{
	GtkTreePath* returnValue = (GtkTreePath*)gtk_cell_view_get_displayed_row((GtkCellView*)[self castedGObject]);

	return returnValue;
}

- (bool)drawSensitive
{
	bool returnValue = (bool)gtk_cell_view_get_draw_sensitive((GtkCellView*)[self castedGObject]);

	return returnValue;
}

- (bool)fitModel
{
	bool returnValue = (bool)gtk_cell_view_get_fit_model((GtkCellView*)[self castedGObject]);

	return returnValue;
}

- (GtkTreeModel*)model
{
	GtkTreeModel* returnValue = (GtkTreeModel*)gtk_cell_view_get_model((GtkCellView*)[self castedGObject]);

	return returnValue;
}

- (void)setDisplayedRowWithPath:(GtkTreePath*)path
{
	gtk_cell_view_set_displayed_row((GtkCellView*)[self castedGObject], path);
}

- (void)setDrawSensitive:(bool)drawSensitive
{
	gtk_cell_view_set_draw_sensitive((GtkCellView*)[self castedGObject], drawSensitive);
}

- (void)setFitModel:(bool)fitModel
{
	gtk_cell_view_set_fit_model((GtkCellView*)[self castedGObject], fitModel);
}

- (void)setModel:(GtkTreeModel*)model
{
	gtk_cell_view_set_model((GtkCellView*)[self castedGObject], model);
}


@end