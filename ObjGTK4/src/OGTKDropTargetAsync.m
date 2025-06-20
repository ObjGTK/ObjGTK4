/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropTargetAsync.h"

#import <OGdk4/OGdkDrop.h>

@implementation OGTKDropTargetAsync

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_DROP_TARGET_ASYNC;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_DROP_TARGET_ASYNC);
	return gObjectClass;
}

+ (instancetype)dropTargetAsyncWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	GtkDropTargetAsync* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_drop_target_async_new(formats, actions), GTK_TYPE_DROP_TARGET_ASYNC, GtkDropTargetAsync);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKDropTargetAsync* wrapperObject;
	@try {
		wrapperObject = [[OGTKDropTargetAsync alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkDropTargetAsync*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_DROP_TARGET_ASYNC, GtkDropTargetAsync);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = (GdkDragAction)gtk_drop_target_async_get_actions((GtkDropTargetAsync*)[self castedGObject]);

	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = (GdkContentFormats*)gtk_drop_target_async_get_formats((GtkDropTargetAsync*)[self castedGObject]);

	return returnValue;
}

- (void)rejectDrop:(OGdkDrop*)drop
{
	gtk_drop_target_async_reject_drop((GtkDropTargetAsync*)[self castedGObject], [drop castedGObject]);
}

- (void)setActions:(GdkDragAction)actions
{
	gtk_drop_target_async_set_actions((GtkDropTargetAsync*)[self castedGObject], actions);
}

- (void)setFormats:(GdkContentFormats*)formats
{
	gtk_drop_target_async_set_formats((GtkDropTargetAsync*)[self castedGObject], formats);
}


@end