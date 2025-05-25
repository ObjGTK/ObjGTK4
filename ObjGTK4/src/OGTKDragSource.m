/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDragSource.h"

#import <OGdk4/OGdkContentProvider.h>
#import <OGdk4/OGdkDrag.h>

@implementation OGTKDragSource

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DRAG_SOURCE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_DRAG_SOURCE);
	return gObjectClass;
}

+ (instancetype)dragSource
{
	GtkDragSource* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drag_source_new(), GTK_TYPE_DRAG_SOURCE, GtkDragSource);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKDragSource* wrapperObject;
	@try {
		wrapperObject = [[OGTKDragSource alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDragSource*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_DRAG_SOURCE, GtkDragSource);
}

- (void)dragCancel
{
	gtk_drag_source_drag_cancel((GtkDragSource*)[self castedGObject]);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = (GdkDragAction)gtk_drag_source_get_actions((GtkDragSource*)[self castedGObject]);

	return returnValue;
}

- (OGdkContentProvider*)content
{
	GdkContentProvider* gobjectValue = gtk_drag_source_get_content((GtkDragSource*)[self castedGObject]);

	OGdkContentProvider* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGdkDrag*)drag
{
	GdkDrag* gobjectValue = gtk_drag_source_get_drag((GtkDragSource*)[self castedGObject]);

	OGdkDrag* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setActions:(GdkDragAction)actions
{
	gtk_drag_source_set_actions((GtkDragSource*)[self castedGObject], actions);
}

- (void)setContent:(OGdkContentProvider*)content
{
	gtk_drag_source_set_content((GtkDragSource*)[self castedGObject], [content castedGObject]);
}

- (void)setIconWithPaintable:(GdkPaintable*)paintable hotX:(int)hotX hotY:(int)hotY
{
	gtk_drag_source_set_icon((GtkDragSource*)[self castedGObject], paintable, hotX, hotY);
}


@end