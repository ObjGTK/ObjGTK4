/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCallbackAction.h"

@implementation OGTKCallbackAction

- (instancetype)initWithCallback:(GtkShortcutFunc)callback data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	GtkCallbackAction* gobjectValue = GTK_CALLBACK_ACTION(gtk_callback_action_new(callback, data, destroy));

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

- (GtkCallbackAction*)castedGObject
{
	return GTK_CALLBACK_ACTION([self gObject]);
}


@end