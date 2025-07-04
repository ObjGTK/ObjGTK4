/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDrawingArea.h"

@implementation OGTKDrawingArea

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DRAWING_AREA;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_DRAWING_AREA);
	return gObjectClass;
}

+ (instancetype)drawingArea
{
	GtkDrawingArea* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drawing_area_new(), GTK_TYPE_DRAWING_AREA, GtkDrawingArea);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKDrawingArea* wrapperObject;
	@try {
		wrapperObject = [[OGTKDrawingArea alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDrawingArea*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_DRAWING_AREA, GtkDrawingArea);
}

- (int)contentHeight
{
	int returnValue = (int)gtk_drawing_area_get_content_height((GtkDrawingArea*)[self castedGObject]);

	return returnValue;
}

- (int)contentWidth
{
	int returnValue = (int)gtk_drawing_area_get_content_width((GtkDrawingArea*)[self castedGObject]);

	return returnValue;
}

- (void)setContentHeight:(int)height
{
	gtk_drawing_area_set_content_height((GtkDrawingArea*)[self castedGObject], height);
}

- (void)setContentWidth:(int)width
{
	gtk_drawing_area_set_content_width((GtkDrawingArea*)[self castedGObject], width);
}

- (void)setDrawFunc:(GtkDrawingAreaDrawFunc)drawFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_drawing_area_set_draw_func((GtkDrawingArea*)[self castedGObject], drawFunc, userData, destroy);
}


@end