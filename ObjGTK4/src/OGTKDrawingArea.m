/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDrawingArea.h"

@implementation OGTKDrawingArea

- (instancetype)init
{
	GtkDrawingArea* gobjectValue = GTK_DRAWING_AREA(gtk_drawing_area_new());

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

- (GtkDrawingArea*)castedGObject
{
	return GTK_DRAWING_AREA([self gObject]);
}

- (int)contentHeight
{
	int returnValue = gtk_drawing_area_get_content_height([self castedGObject]);

	return returnValue;
}

- (int)contentWidth
{
	int returnValue = gtk_drawing_area_get_content_width([self castedGObject]);

	return returnValue;
}

- (void)setContentHeight:(int)height
{
	gtk_drawing_area_set_content_height([self castedGObject], height);
}

- (void)setContentWidth:(int)width
{
	gtk_drawing_area_set_content_width([self castedGObject], width);
}

- (void)setDrawFuncWithDrawFunc:(GtkDrawingAreaDrawFunc)drawFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_drawing_area_set_draw_func([self castedGObject], drawFunc, userData, destroy);
}


@end