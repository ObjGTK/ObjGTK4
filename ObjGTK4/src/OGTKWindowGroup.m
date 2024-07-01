/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowGroup.h"

#import "OGTKWindow.h"

@implementation OGTKWindowGroup

- (instancetype)init
{
	GtkWindowGroup* gobjectValue = GTK_WINDOW_GROUP(gtk_window_group_new());

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

- (GtkWindowGroup*)castedGObject
{
	return GTK_WINDOW_GROUP([self gObject]);
}

- (void)addWindow:(OGTKWindow*)window
{
	gtk_window_group_add_window([self castedGObject], [window castedGObject]);
}

- (GList*)listWindows
{
	GList* returnValue = gtk_window_group_list_windows([self castedGObject]);

	return returnValue;
}

- (void)removeWindow:(OGTKWindow*)window
{
	gtk_window_group_remove_window([self castedGObject], [window castedGObject]);
}


@end