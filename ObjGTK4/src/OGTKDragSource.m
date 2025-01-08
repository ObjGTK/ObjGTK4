/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDragSource.h"

#import <OGdk4/OGdkContentProvider.h>
#import <OGdk4/OGdkDrag.h>

@implementation OGTKDragSource

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DRAG_SOURCE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkDragSource* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drag_source_new(), GtkDragSource, GtkDragSource);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkDragSource, GtkDragSource);
}

- (void)dragCancel
{
	gtk_drag_source_drag_cancel([self castedGObject]);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = (GdkDragAction)gtk_drag_source_get_actions([self castedGObject]);

	return returnValue;
}

- (OGdkContentProvider*)content
{
	GdkContentProvider* gobjectValue = gtk_drag_source_get_content([self castedGObject]);

	OGdkContentProvider* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDrag*)drag
{
	GdkDrag* gobjectValue = gtk_drag_source_get_drag([self castedGObject]);

	OGdkDrag* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setActions:(GdkDragAction)actions
{
	gtk_drag_source_set_actions([self castedGObject], actions);
}

- (void)setContent:(OGdkContentProvider*)content
{
	gtk_drag_source_set_content([self castedGObject], [content castedGObject]);
}

- (void)setIconWithPaintable:(GdkPaintable*)paintable hotX:(int)hotX hotY:(int)hotY
{
	gtk_drag_source_set_icon([self castedGObject], paintable, hotX, hotY);
}


@end