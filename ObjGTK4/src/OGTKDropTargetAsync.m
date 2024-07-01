/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKDropTargetAsync.h"

#import <OGdk4/OGGdkDrop.h>

@implementation OGTKDropTargetAsync

- (instancetype)initWithFormats:(GdkContentFormats*)formats actions:(GdkDragAction)actions
{
	GtkDropTargetAsync* gobjectValue = GTK_DROP_TARGET_ASYNC(gtk_drop_target_async_new(formats, actions));

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

- (GtkDropTargetAsync*)castedGObject
{
	return GTK_DROP_TARGET_ASYNC([self gObject]);
}

- (GdkDragAction)actions
{
	GdkDragAction returnValue = gtk_drop_target_async_get_actions([self castedGObject]);

	return returnValue;
}

- (GdkContentFormats*)formats
{
	GdkContentFormats* returnValue = gtk_drop_target_async_get_formats([self castedGObject]);

	return returnValue;
}

- (void)rejectDrop:(OGGdkDrop*)drop
{
	gtk_drop_target_async_reject_drop([self castedGObject], [drop castedGObject]);
}

- (void)setActions:(GdkDragAction)actions
{
	gtk_drop_target_async_set_actions([self castedGObject], actions);
}

- (void)setFormats:(GdkContentFormats*)formats
{
	gtk_drop_target_async_set_formats([self castedGObject], formats);
}


@end