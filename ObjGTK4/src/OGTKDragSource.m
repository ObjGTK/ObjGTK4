/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDragSource.h"

#import <OGdk4/OGGdkDrag.h>
#import <OGdk4/OGGdkContentProvider.h>

@implementation OGTKDragSource

- (instancetype)init
{
	GtkDragSource* gobjectValue = GTK_DRAG_SOURCE(gtk_drag_source_new());

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

- (GtkDragSource*)castedGObject
{
	return GTK_DRAG_SOURCE([self gObject]);
}

- (void)dragCancel
{
	gtk_drag_source_drag_cancel([self castedGObject]);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = gtk_drag_source_get_actions([self castedGObject]);

	return returnValue;
}

- (OGGdkContentProvider*)content
{
	GdkContentProvider* gobjectValue = GDK_CONTENT_PROVIDER(gtk_drag_source_get_content([self castedGObject]));

	OGGdkContentProvider* returnValue = [OGGdkContentProvider withGObject:gobjectValue];
	return returnValue;
}

- (OGGdkDrag*)drag
{
	GdkDrag* gobjectValue = GDK_DRAG(gtk_drag_source_get_drag([self castedGObject]));

	OGGdkDrag* returnValue = [OGGdkDrag withGObject:gobjectValue];
	return returnValue;
}

- (void)setActions:(GdkDragAction)actions
{
	gtk_drag_source_set_actions([self castedGObject], actions);
}

- (void)setContent:(OGGdkContentProvider*)content
{
	gtk_drag_source_set_content([self castedGObject], [content castedGObject]);
}

- (void)setIconWithPaintable:(GdkPaintable*)paintable hotX:(int)hotX hotY:(int)hotY
{
	gtk_drag_source_set_icon([self castedGObject], paintable, hotX, hotY);
}


@end